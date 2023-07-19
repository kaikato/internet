#include "reassembler.hh"
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <sys/types.h>

using namespace std;

void Reassembler::insert( uint64_t first_index, string data, bool is_last_substring, Writer& output )
{

  if ( reassemblerBuffer.size() != output.available_capacity() ) {
    // reassemblerBuffer.resize( output.available_capacity(), make_pair( 0, false ) );
    reassemblerBuffer.resize( output.available_capacity() );
  }

  /*
    if ( shadowBuffer.size() < output.available_capacity() ) {
      shadowBuffer.resize( output.available_capacity(), false );
    }
  */
  // assert( reassemblerBuffer.size() >= output.available_capacity() );
  // assert( shadowBuffer.size() >= output.available_capacity() );
  if ( reassemblerBuffer.empty() ) {
    return;
  }
  // assert( !reassemblerBuffer.empty() );
  // assert( !shadowBuffer.empty() );

  if ( first_index < buffer_head ) {
    uint64_t neg_excess_bytes = buffer_head - first_index;
    if ( neg_excess_bytes >= data.length() ) {
      return;
    }
    uint64_t last_unwritten = output.available_capacity();
    // while ( last_unwritten > 0 && shadowBuffer[last_unwritten] ) {
    while ( last_unwritten > 0 && reassemblerBuffer[last_unwritten - 1].second ) {
      last_unwritten--;
    }
    data = data.substr( neg_excess_bytes, last_unwritten );
    // copy( data.begin(), data.begin() + ( data.length() ), reassemblerBuffer.begin() );
    for ( uint64_t i = 0; i < data.length(); i++ ) {
      // reassemblerBuffer[i] = data[i];
      reassemblerBuffer[i] = make_pair( data[i], true );
      // shadowBuffer[i] = true;
    }
    /*
    for ( uint64_t i = 0; i < data.length(); i++ ) {
      shadowBuffer[i] = true;
    }
    */

  } else {
    uint64_t buffer_idx = 0;
    buffer_idx = first_index - buffer_head;
    if ( buffer_idx >= output.available_capacity() ) {
      return; // if the provided index starts beyond the acceptable range, just return
    }
    if ( buffer_idx + data.length() > output.available_capacity() ) {
      uint64_t last_unwritten = output.available_capacity();
      // while ( last_unwritten > 0 && shadowBuffer[last_unwritten] ) {
      while ( last_unwritten > 0 && reassemblerBuffer[last_unwritten - 1].second ) {
        last_unwritten--;
      }
      // If the provided data extends beyond the acceptable range, truncate it
      data = data.substr( 0, last_unwritten - buffer_idx );
    }

    // copy( data.begin(), data.begin() + ( data.length() ), reassemblerBuffer.begin() + buffer_idx );
    /*
    for ( uint64_t i = buffer_idx; i < buffer_idx + data.length(); i++ ) {
      reassemblerBuffer[i] = data[i - buffer_idx];
      shadowBuffer[i] = true;
    }*/
    for ( uint64_t i = 0; i < data.length(); i++ ) {
      reassemblerBuffer[buffer_idx + i] = make_pair( data[i], true );
    }
  }

  if ( is_last_substring ) {
    last_message_received = true;
    last_message_index = first_index + data.length();
  }

  if ( !reassemblerBuffer.empty() && reassemblerBuffer[0].second ) {
    // if ( !shadowBuffer.empty() && shadowBuffer[0] ) {
    //  Find the first byte that hasn't been written to yet
    // uint64_t i = data.length();
    uint64_t i = 0;
    // while ( i < output.available_capacity() && shadowBuffer[i] ) {
    string t;
    while ( i < output.available_capacity() && reassemblerBuffer[i].second ) {
      t += reassemblerBuffer[i].first;
      i++;
    }
    // Extract the message from the buffer and remove it from the buffer
    // string t( reassemblerBuffer.begin(), reassemblerBuffer.begin() + i );
    output.push( t );
    buffer_head += i;
    reassemblerBuffer.erase( reassemblerBuffer.begin(), reassemblerBuffer.begin() + i );
    // shadowBuffer.erase( shadowBuffer.begin(), shadowBuffer.begin() + i );
  }

  /*
    string t;
    if ( first_index <= buffer_head ) {
      uint64_t i = 0;
      for ( i = 0; i < shadowBuffer.size() && shadowBuffer[i]; i++ ) {
        t += reassemblerBuffer[i];
      }
      if ( i != 0 ) {
        output.push( t );
        buffer_head += i;
        reassemblerBuffer.erase( reassemblerBuffer.begin(), reassemblerBuffer.begin() + i );
        shadowBuffer.erase( shadowBuffer.begin(), shadowBuffer.begin() + i );
      }
    }
  */
  // bytes_pending_ = std::count( shadowBuffer.begin(), shadowBuffer.end(), true );
  bytes_pending_
    = std::count_if( reassemblerBuffer.begin(), reassemblerBuffer.end(), []( auto& p ) { return p.second; } );

  if ( last_message_received && buffer_head >= last_message_index ) {
    output.close();
  }
}

uint64_t Reassembler::bytes_pending() const
{
  return bytes_pending_;
}
