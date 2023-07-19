#include "tcp_sender.hh"
#include "tcp_config.hh"
#include "tcp_sender_message.hh"

#include <cstdint>
#include <cstdio>
#include <iostream>
#include <random>

using namespace std;

/* TCPSender constructor (uses a random ISN if none given) */
TCPSender::TCPSender( uint64_t initial_RTO_ms, optional<Wrap32> fixed_isn )
  : isn_( fixed_isn.value_or( Wrap32 { random_device()() } ) ), initial_RTO_ms_( initial_RTO_ms )
{}

uint64_t TCPSender::sequence_numbers_in_flight() const
{
  return next_seqno - ackno;
}

uint64_t TCPSender::consecutive_retransmissions() const
{
  return consecutive_retransmissions_;
}

optional<TCPSenderMessage> TCPSender::maybe_send()
{
  if ( !unsent_messages.empty() ) {
    TCPSenderMessage msg = unsent_messages[0];
    unsent_messages.erase( unsent_messages.begin() );
    return msg;
  }
  return {};
}

void TCPSender::push( Reader& outbound_stream )
{
  uint64_t fixed_window_size = window_size == 0 ? 1 : window_size;
  while ( fixed_window_size > sequence_numbers_in_flight() ) {
    string segment_payload;
    bool syn = next_seqno == 0;
    uint64_t len = min( fixed_window_size - sequence_numbers_in_flight() - syn, TCPConfig::MAX_PAYLOAD_SIZE );
    read( outbound_stream, len, segment_payload );
    TCPSenderMessage segment = { Wrap32::wrap( next_seqno, isn_ ), syn, segment_payload, false };
    next_seqno = next_seqno + segment.sequence_length();
    if ( fixed_window_size > sequence_numbers_in_flight() ) {
      segment.FIN = outbound_stream.is_finished() && outbound_stream.bytes_popped() + 1 == next_seqno;
      if ( segment.FIN ) {
        next_seqno++;
      }
    }
    if ( segment.sequence_length() == 0 ) {
      return;
    }
    unsent_messages.push_back( segment );
    in_flight_messages.push_back( segment );
    if ( !timer.is_started() ) {
      timer.startTimer();
    }
  }
}

/*
  while ( window_size > sequence_numbers_in_flight() || window_size == 0 ) {
    string segment_payload;
    bool syn = next_seqno == 0;
    uint64_t len = window_size == 0
                     ? 1 - syn - sequence_numbers_in_flight() // this might underflow
                     : min( window_size - sequence_numbers_in_flight() - syn, TCPConfig::MAX_PAYLOAD_SIZE );
    read( outbound_stream, len, segment_payload );
    TCPSenderMessage segment = { Wrap32::wrap( next_seqno, isn_ ), syn, segment_payload, false };
    next_seqno = next_seqno + segment.sequence_length();
    if ( window_size > sequence_numbers_in_flight() ) {
      segment.FIN = outbound_stream.is_finished() && outbound_stream.bytes_popped() + 1 == next_seqno;
      if ( segment.FIN ) {
        next_seqno++;
      }
    }
    if ( segment.sequence_length() == 0 ) {
      return;
    }
    unsent_messages.push_back( segment );
    in_flight_messages.push_back( segment );
    if ( !timer.is_started() ) {
      timer.startTimer();
    }
    if ( window_size == 0 ) {
      return;
    }
  }
  */

TCPSenderMessage TCPSender::send_empty_message() const
{
  return { Wrap32::wrap( next_seqno, isn_ ), false, {}, false };
}

void TCPSender::receive( const TCPReceiverMessage& msg )
{
  window_size = msg.window_size;
  window_size_received = true;
  if ( !msg.ackno || msg.ackno->unwrap( isn_, next_seqno ) > next_seqno ) {
    return;
  }
  if ( msg.ackno->unwrap( isn_, next_seqno ) > ackno ) {
    timer.resetRTO( initial_RTO_ms_ );
    consecutive_retransmissions_ = 0;
    ackno = msg.ackno->unwrap( isn_, next_seqno );
    while ( !in_flight_messages.empty()
            && msg.ackno.value().unwrap( isn_, 0 )
                 >= in_flight_messages[0].seqno.unwrap( isn_, 0 ) + in_flight_messages[0].sequence_length() ) {
      in_flight_messages.erase( in_flight_messages.begin() );
    };
    if ( in_flight_messages.empty() ) {
      timer.stopTimer();
    } else {
      timer.startTimer();
    }
  }
}

void TCPSender::tick( const size_t ms_since_last_tick )
{
  if ( timer.is_started() && timer.pass_time_and_check( ms_since_last_tick ) ) {
    unsent_messages.push_back( in_flight_messages[0] );

    if ( window_size > 0 || !window_size_received ) {
      consecutive_retransmissions_++;
      timer.doubleRTO();
    }
    timer.startTimer();
  }
}

TCPTimer::TCPTimer( uint64_t initial_rto ) : set_rto( initial_rto ) {};

void TCPTimer::startTimer()
{
  time = set_rto;
  is_on = true;
}

void TCPTimer::stopTimer()
{
  is_on = false;
}

void TCPTimer::doubleRTO()
{
  set_rto *= 2;
}

void TCPTimer::resetRTO( uint64_t initial_rto )
{
  set_rto = initial_rto;
}

bool TCPTimer::pass_time_and_check( const size_t ms_since_last_tick )
{
  if ( time <= ms_since_last_tick ) {
    return true;
  }
  time -= ms_since_last_tick;
  return false;
}