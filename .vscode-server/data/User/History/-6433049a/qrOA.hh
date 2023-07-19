#pragma once

#include "byte_stream.hh"
#include "tcp_receiver_message.hh"
#include "tcp_sender_message.hh"
#include "wrapping_integers.hh"
#include <cstdint>
#include <optional>
#include <sys/types.h>
#include <vector>

class TCPTimer
{
protected:
  uint64_t set_rto;
  uint64_t time = 0;
  bool is_on = false;

public:
  explicit TCPTimer( uint64_t initial_rto_ );

  /* Sets the timer to the RTO and turns it on. */
  void startTimer();

  /* Turns off the timer. */
  void stopTimer();

  /* Doubles the RTO value for the timer. */
  void doubleRTO();

  /* Resets the RTO to the given value. */
  void resetRTO( uint64_t initial_rto );

  bool is_started() const { return is_on; };
  bool pass_time_and_check( size_t ms_since_last_tick );
};

class TCPSender
{
protected:
  Wrap32 isn_;
  uint64_t initial_RTO_ms_;
  uint64_t ackno = 0;
  std::vector<TCPSenderMessage> in_flight_messages = {};
  std::vector<TCPSenderMessage> unsent_messages = {};
  uint64_t window_size = 1; /* Set to 1 because we assume the receiver’s window size before the receive method
                               informs it otherwise is 1 */
  uint64_t next_seqno = 0;
  TCPTimer timer { initial_RTO_ms_ };
  uint64_t consecutive_retransmissions_ = 0;

public:
  /* Construct TCP sender with given default Retransmission Timeout and possible ISN */
  TCPSender( uint64_t initial_RTO_ms, std::optional<Wrap32> fixed_isn );

  /* Push bytes from the outbound stream */
  void push( Reader& outbound_stream );

  /* Send a TCPSenderMessage if needed (or empty optional otherwise) */
  std::optional<TCPSenderMessage> maybe_send();

  /* Generate an empty TCPSenderMessage */
  TCPSenderMessage send_empty_message() const;

  /* Receive an act on a TCPReceiverMessage from the peer's receiver */
  void receive( const TCPReceiverMessage& msg );

  /* Time has passed by the given # of milliseconds since the last time the tick() method was called. */
  void tick( uint64_t ms_since_last_tick );

  /* Accessors for use in testing */
  uint64_t sequence_numbers_in_flight() const;  // How many sequence numbers are outstanding?
  uint64_t consecutive_retransmissions() const; // How many consecutive *re*transmissions have happened?

private:
  /* Constructs a single TCPSenderMessage from the reader. */
  TCPSenderMessage construct_segment( Reader& outbound_stream, uint64_t adjusted_window_size );

  /* Clears all the acked segments from the list of in_flight_messages. */
  void clear_acked_segments( uint64_t msg_ackno_unwrapped );

  /* Resets and restarts the timer as needed on receive. */
  void handle_timer_on_receive();
};
