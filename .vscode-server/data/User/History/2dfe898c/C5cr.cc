#include "tcp_receiver.hh"
#include "wrapping_integers.hh"
#include <cstdint>
#include <sys/types.h>

using namespace std;

void TCPReceiver::receive( TCPSenderMessage message, Reassembler& reassembler, Writer& inbound_stream )
{
  // Your code here.
  if ( message.SYN ) {
    zero_point_ = Wrap32 { message.seqno };
  }
  uint64_t abs_seqno = message.seqno.unwrap( zero_point_, 0 );
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
  TCPReceiverMessage response
    = { zero_point_ + static_cast<uint32_t>( inbound_stream.bytes_pushed() ), window_size };
  return response;
}
