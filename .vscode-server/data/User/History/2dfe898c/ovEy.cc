#include "tcp_receiver.hh"
#include "wrapping_integers.hh"
#include <cstdint>
#include <sys/types.h>

using namespace std;

void TCPReceiver::receive( TCPSenderMessage message, Reassembler& reassembler, Writer& inbound_stream )
{
  // Your code here.
  uint64_t abs_seqno = message.seqno.unwrap( zero_point_, 0 );
  if ( message.SYN ) {
    zero_point_ = Wrap32 { message.seqno };
    syn_received = true;
  }
  if ( message.FIN ) {
    fin_index = abs_seqno + message.payload.length() + message.SYN;
  }
  uint64_t stream_index = 0;
  if ( message.SYN ) {
    stream_index = abs_seqno;
  } else {
    stream_index = abs_seqno - 1;
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
  }
  if ( next_needed == (Wrap32)fin_index ) {
    next_needed += 1;
  }
  TCPReceiverMessage response = { next_needed, window_size };
  return response;
}
