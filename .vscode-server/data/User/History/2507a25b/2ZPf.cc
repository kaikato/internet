#include "network_interface.hh"

#include "address.hh"
#include "arp_message.hh"
#include "buffer.hh"
#include "ethernet_frame.hh"
#include "ethernet_header.hh"
#include "ipv4_datagram.hh"
#include "parser.hh"
#include <cassert>

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
  if ( got != ip2eth.end() ) {
    EthernetHeader header {};
    header.dst = got->second.first;
    header.src = ethernet_address_;
    header.type = EthernetHeader::TYPE_IPv4;
    EthernetFrame frame = { header, serialize( dgram ) };
    sent_frames.push_back( frame );
    assert( !sent_frames.empty() );
  } else {
    if ( recent_ips_requested.contains( next_hop_num ) /*&& recent_ips_requested[next_hop_num] <= 5000*/ ) {
      return;
    }
    EthernetHeader header {};
    header.dst = ETHERNET_BROADCAST;
    header.src = ethernet_address_;
    header.type = EthernetHeader::TYPE_ARP;
    ARPMessage arp;
    arp.opcode = ARPMessage::OPCODE_REQUEST;
    arp.sender_ethernet_address = ethernet_address_;
    arp.sender_ip_address = ip_address_.ipv4_numeric();
    arp.target_ethernet_address = {};
    arp.target_ip_address = next_hop_num;
    EthernetFrame frame = { header, serialize( arp ) };
    awaiting_arp[next_hop_num] = dgram;
    sent_frames.push_back( frame );
    recent_ips_requested[next_hop_num] = 0;
  }
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
        EthernetHeader header {};
        header.dst = arp.sender_ethernet_address;
        header.src = ethernet_address_;
        header.type = EthernetHeader::TYPE_ARP;
        ARPMessage arpResponse;
        arpResponse.opcode = ARPMessage::OPCODE_REPLY;
        arpResponse.sender_ethernet_address = ethernet_address_;
        arpResponse.sender_ip_address = ip_address_.ipv4_numeric();
        arpResponse.target_ethernet_address = arp.sender_ethernet_address;
        arpResponse.target_ip_address = arp.sender_ip_address;
        EthernetFrame frameResponse = { header, serialize( arpResponse ) };
        sent_frames.push_back( frameResponse );
      } else {
        auto got = awaiting_arp.find( arp.sender_ip_address );
        if ( got != awaiting_arp.end() ) {
          send_datagram( got->second, Address::from_ipv4_numeric( arp.sender_ip_address ) );
        }
      }
    }
  }
  (void)frame;
  return {};
}

// ms_since_last_tick: the number of milliseconds since the last call to this method
void NetworkInterface::tick( const size_t ms_since_last_tick )
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
  std::vector<uint32_t> keys2;
  keys2.reserve( ip2eth.size() );
  for ( const auto ip_eth : ip2eth ) {
    keys2.push_back( ip_eth.first );
  }
  for ( auto& ip_eth : ip2eth ) {
    ip_eth.second.second += ms_since_last_tick;
    if ( ip_eth.second.second >= 30000 ) {
      ip2eth.erase( ip_eth.first );
    }
  }
  * /
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
