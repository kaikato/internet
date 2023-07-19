#include "tcp_receiver.hh"
#include "tcp_receiver_message.hh"
#include "wrapping_integers.hh"
#include <cstdint>
#include <sys/types.h>

using namespace std;

void TCPReceiver::receive( TCPSenderMessage message, Reassembler& reassembler, Writer& inbound_stream )
{
  // Your code here.
  if ( message.SYN ) {
    zero_point_ = message.seqno;
    syn_received = true;
    checkpoint = message.seqno.unwrap( Wrap32 { 0 }, 0 );
  }
  uint64_t abs_seqno = message.seqno.unwrap( zero_point_, checkpoint );
  checkpoint = abs_seqno;
  if ( message.FIN ) {
    fin_index = abs_seqno + message.payload.length() + message.SYN;
  }
  uint64_t stream_index = abs_seqno - 1;
  if ( message.SYN ) {
    stream_index++;
  }
  reassembler.insert( stream_index, message.payload, message.FIN, inbound_stream );
}

TCPReceiverMessage TCPReceiver::send( const Writer& inbound_stream ) const
{
  // Your code here.
  uint16_t window_size = UINT16_MAX;
  if ( inbound_stream.available_capacity() < window_size ) {
    window_size = inbound_stream.available_capacity();
  }
  optional<Wrap32> next_needed;
  if ( syn_received ) {
    next_needed = zero_point_ + static_cast<uint32_t>( inbound_stream.bytes_pushed() + 1 );
    if ( next_needed->unwrap( zero_point_, checkpoint ) == fin_index ) {
      next_needed = zero_point_ + static_cast<uint32_t>( inbound_stream.bytes_pushed() + 2 );
    }
  }
  return TCPReceiverMessage { next_needed, window_size };
}
