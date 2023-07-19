#include "tcp_receiver.hh"
#include "tcp_receiver_message.hh"
#include "wrapping_integers.hh"
#include <cstdint>
#include <sys/types.h>

using namespace std;

void TCPReceiver::receive( TCPSenderMessage message, Reassembler& reassembler, Writer& inbound_stream )
{
  if ( message.SYN ) {
    zero_point_ = message.seqno;
    syn_received = true;
  }
  const uint64_t abs_seqno = message.seqno.unwrap( zero_point_, inbound_stream.bytes_pushed() );
  const uint64_t stream_index = abs_seqno - 1 + message.SYN;
  reassembler.insert( stream_index, message.payload, message.FIN, inbound_stream );
}

TCPReceiverMessage TCPReceiver::send( const Writer& inbound_stream ) const
{
  const uint16_t window_size
    = inbound_stream.available_capacity() < UINT16_MAX ? inbound_stream.available_capacity() : UINT16_MAX;
  optional<Wrap32> next_needed;
  if ( syn_received ) {
    next_needed = zero_point_ + static_cast<uint32_t>( inbound_stream.bytes_pushed() + 1 );
    if ( inbound_stream.is_closed() ) {
      // next_needed = zero_point_ + static_cast<uint32_t>( inbound_stream.bytes_pushed() + 2 );
      next_needed = next_needed + 1;
    }
  }
  return TCPReceiverMessage { next_needed, window_size };
}
