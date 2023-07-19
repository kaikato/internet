#include "network_interface.hh"

#include "address.hh"
#include "arp_message.hh"
#include "buffer.hh"
#include "ethernet_frame.hh"
#include "ethernet_header.hh"
#include "ipv4_datagram.hh"
#include "parser.hh"
#include <cstddef>
#include <iterator>

using namespace std;

// ethernet_address: Ethernet (what ARP calls "hardware") address of the interface
// ip_address: IP (what ARP calls "protocol") address of the interface
NetworkInterface::NetworkInterface( const EthernetAddress& ethernet_address, const Address& ip_address )
  : ethernet_address_( ethernet_address ), ip_address_( ip_address )
{
  cerr << "DEBUG: Network interface has Ethernet address " << to_string( ethernet_address_ ) << " and IP address "
       << ip_address.ip() << "\n";
}

// dgram: the IPv4 datagram to be sent
// next_hop: the IP address of the interface to send it to (typically a router or default gateway, but
// may also be another host if directly connected to the same network as the destination)

// Note: the Address type can be converted to a uint32_t (raw 32-bit IP address) by using the
// Address::ipv4_numeric() method.
void NetworkInterface::send_datagram( const InternetDatagram& dgram, const Address& next_hop )
{
  auto next_hop_num = next_hop.ipv4_numeric();
  auto got = ip2eth.find( next_hop_num );
  EthernetFrame frame;
  if ( got != ip2eth.end() ) {
    EthernetHeader header { got->second.first, ethernet_address_, EthernetHeader::TYPE_IPv4 };
    frame = { header, serialize( dgram ) };
  } else {
    // awaiting_arp[next_hop_num] = dgram; should have up here since any datagram should be queued.
    if ( recent_ips_requested.contains( next_hop_num ) ) {
      return;
    }
    EthernetHeader header { ETHERNET_BROADCAST, ethernet_address_, EthernetHeader::TYPE_ARP };
    ARPMessage arp_request = create_arp_request( next_hop_num );
    frame = { header, serialize( arp_request ) };
    // vector<InternetDatagram> waiting_dgrams = awaiting_arp[next_hop_num];
    // waiting_dgrams.push_back( dgram );
    // awaiting_arp[next_hop_num] = waiting_dgrams;
    // awaiting_arp[next_hop_num].push_back( dgram );
    /*
    vector<InternetDatagram> test = {};
    test.push_back( dgram );
    awaiting_arp[next_hop_num] = test;
    */
    recent_ips_requested[next_hop_num] = 0;
  }
  sent_frames.push_back( frame );
}

ARPMessage NetworkInterface::create_arp_request( uint32_t next_hop_num )
{
  ARPMessage arp;
  arp.opcode = ARPMessage::OPCODE_REQUEST;
  arp.sender_ethernet_address = ethernet_address_;
  arp.sender_ip_address = ip_address_.ipv4_numeric();
  arp.target_ethernet_address = {};
  arp.target_ip_address = next_hop_num;
  return arp;
}

// frame: the incoming Ethernet frame
optional<InternetDatagram> NetworkInterface::recv_frame( const EthernetFrame& frame )
{
  if ( !( frame.header.dst == ETHERNET_BROADCAST || frame.header.dst == ethernet_address_ ) ) {
    return {};
  }
  if ( frame.header.type == EthernetHeader::TYPE_IPv4 ) {
    InternetDatagram dg;
    if ( parse( dg, frame.payload ) ) {
      return dg;
    }
  } else if ( frame.header.type == EthernetHeader::TYPE_ARP ) {
    ARPMessage arp;
    if ( parse( arp, frame.payload ) ) {
      ip2eth[arp.sender_ip_address] = pair( arp.sender_ethernet_address, 0 );
      if ( arp.opcode == ARPMessage::OPCODE_REQUEST && arp.target_ip_address == ip_address_.ipv4_numeric() ) {
        send_arp_response( arp );
      } else {
        resend_awaiting_arp( arp );
      }
    }
  }
  return {};
}

void NetworkInterface::send_arp_response( ARPMessage arp )
{
  EthernetHeader header { arp.sender_ethernet_address, ethernet_address_, EthernetHeader::TYPE_ARP };
  ARPMessage arpResponse = create_arp_response( arp );
  EthernetFrame frameResponse = { header, serialize( arpResponse ) };
  sent_frames.push_back( frameResponse );
}

ARPMessage NetworkInterface::create_arp_response( ARPMessage arp )
{
  ARPMessage arpResponse;
  arpResponse.opcode = ARPMessage::OPCODE_REPLY;
  arpResponse.sender_ethernet_address = ethernet_address_;
  arpResponse.sender_ip_address = ip_address_.ipv4_numeric();
  arpResponse.target_ethernet_address = arp.sender_ethernet_address;
  arpResponse.target_ip_address = arp.sender_ip_address;
  return arpResponse;
}

void NetworkInterface::resend_awaiting_arp( ARPMessage arp )
{
  auto got = awaiting_arp.find( arp.sender_ip_address );
  if ( got != awaiting_arp.end() ) {
    for ( const auto& dgram : got->second ) {
      send_datagram( dgram, Address::from_ipv4_numeric( arp.sender_ip_address ) );
    }
    // send_datagram( got->second, Address::from_ipv4_numeric( arp.sender_ip_address ) );
  }
}

// ms_since_last_tick: the number of milliseconds since the last call to this method
void NetworkInterface::tick( const size_t ms_since_last_tick )
{
  update_recent_requests( ms_since_last_tick );
  update_ip2eth_mapping( ms_since_last_tick );
}

void NetworkInterface::update_recent_requests( size_t ms_since_last_tick )
{
  std::vector<uint32_t> keys;
  keys.reserve( recent_ips_requested.size() );
  for ( const auto& pair : recent_ips_requested ) {
    keys.push_back( pair.first );
  }
  for ( auto key : keys ) {
    recent_ips_requested[key] += ms_since_last_tick;
    if ( recent_ips_requested[key] >= 5000 ) {
      recent_ips_requested.erase( key );
    }
  }
}

void NetworkInterface::update_ip2eth_mapping( size_t ms_since_last_tick )
{
  std::vector<uint32_t> keys;
  keys.reserve( ip2eth.size() );
  for ( const auto& ip_eth : ip2eth ) {
    keys.push_back( ip_eth.first );
  }
  for ( auto key : keys ) {
    ip2eth[key].second += ms_since_last_tick;
    if ( ip2eth[key].second >= 30000 ) {
      ip2eth.erase( key );
    }
  }
}

optional<EthernetFrame> NetworkInterface::maybe_send()
{
  if ( !sent_frames.empty() ) {
    EthernetFrame frame = sent_frames[0];
    sent_frames.erase( sent_frames.begin() );
    return frame;
  }
  return {};
}
