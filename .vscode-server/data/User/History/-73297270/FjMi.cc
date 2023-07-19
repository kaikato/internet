#include "router.hh"
#include "ipv4_datagram.hh"

#include <cstdint>
#include <iostream>
#include <limits>
#include <sys/types.h>

using namespace std;

// route_prefix: The "up-to-32-bit" IPv4 address prefix to match the datagram's destination address against
// prefix_length: For this route to be applicable, how many high-order (most-significant) bits of
//    the route_prefix will need to match the corresponding bits of the datagram's destination address?
// next_hop: The IP address of the next hop. Will be empty if the network is directly attached to the router (in
//    which case, the next hop address should be the datagram's final destination).
// interface_num: The index of the interface to send the datagram out on.
void Router::add_route( const uint32_t route_prefix,
                        const uint8_t prefix_length,
                        const optional<Address> next_hop,
                        const size_t interface_num )
{
  cerr << "DEBUG: adding route " << Address::from_ipv4_numeric( route_prefix ).ip() << "/"
       << static_cast<int>( prefix_length ) << " => " << ( next_hop.has_value() ? next_hop->ip() : "(direct)" )
       << " on interface " << interface_num << "\n";

  struct route route_entry = { route_prefix, prefix_length, next_hop, interface_num };
  routing_table.push_back( route_entry );
}

void Router::route()
{
  for ( auto interface : interfaces_ ) {
    // std::optional<InternetDatagram> dgram = interface.maybe_receive();
    // optional<InternetDatagram> dgram = interface.maybe_receive();
    int i = 0;
    while ( auto dgram = interface.maybe_receive() ) {
      cout << "received packet loop no.: " << i << endl;
      i++;
      if ( !dgram || dgram->header.ttl == 0 || --dgram->header.ttl == 0 ) {
        return;
      }
      dgram->header.compute_checksum();
      struct route longest_prefix_match
      {
        0, 0, {}, 0
      };
      for ( auto route : routing_table ) {
        if ( route.prefix_length > longest_prefix_match.prefix_length ) {
          uint32_t mask = static_cast<uint32_t>( ~0 ) << static_cast<uint32_t>( 32 - route.prefix_length );
          if ( ( route.route_prefix & mask ) == ( dgram->header.dst & mask ) ) {
            longest_prefix_match = route;
          }
        }
      }
      int j = 0;
      if ( longest_prefix_match.route_prefix != 0 ) {
        if ( longest_prefix_match.next_hop ) {
          Router::interface( longest_prefix_match.interface_num )
            .send_datagram( dgram.value(), longest_prefix_match.next_hop.value() );
          cout << "just send to next hop: " << longest_prefix_match.next_hop.value() << "num: " << j << endl;
          j++;
        } else {
          Router::interface( longest_prefix_match.interface_num )
            .send_datagram( dgram.value(), Address::from_ipv4_numeric( dgram->header.dst ) );
        }
      }
    }
  }
}
