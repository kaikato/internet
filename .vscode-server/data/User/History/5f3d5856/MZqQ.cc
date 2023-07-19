#include "reassembler.hh"
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <sys/types.h>

using namespace std;

void Reassembler::insert( uint64_t first_index, string data, bool is_last_substring, Writer& output )
{
  const uint64_t capacity = output.available_capacity();

  if ( reassemblerBuffer.size() != capacity ) {
    reassemblerBuffer.resize( capacity, make_pair( 0, false ) );
  }
  // assert( reassemblerBuffer.size() >= output.available_capacity() );
  if ( reassemblerBuffer.empty() ) {
    return;
  }
  // assert( !reassemblerBuffer.empty() );

  if ( first_index < buffer_head ) {
    uint64_t neg_excess_bytes = buffer_head - first_index;
    if ( neg_excess_bytes >= data.length() ) {
      return;
    }
    uint64_t last_unwritten = capacity;
    while ( last_unwritten > 0 && reassemblerBuffer[last_unwritten - 1].second ) {
      last_unwritten--;
    }
    data = data.substr( neg_excess_bytes, last_unwritten );
    // copy( data.begin(), data.begin() + ( data.length() ), reassemblerBuffer.begin() );
    for ( uint64_t i = 0; i < data.length(); i++ ) {
      // if ( !reassemblerBuffer[i].second ) {
      if ( !reassemblerBuffer[i].second ) {
        reassemblerBuffer[i] = make_pair( data[i], true );
        bytes_pending_++;
      }
      //}
    }

  } else {
    uint64_t buffer_idx = 0;
    buffer_idx = first_index - buffer_head;
    if ( buffer_idx >= capacity ) {
      return; // if the provided index starts beyond the acceptable range, just return
    }
    if ( buffer_idx + data.length() > capacity ) {
      uint64_t last_unwritten = capacity;
      while ( last_unwritten > 0 && reassemblerBuffer[last_unwritten - 1].second ) {
        last_unwritten--;
      }
      // If the provided data extends beyond the acceptable range, truncate it
      data = data.substr( 0, last_unwritten - buffer_idx );
    }

    // copy( data.begin(), data.begin() + ( data.length() ), reassemblerBuffer.begin() + buffer_idx );
    for ( uint64_t i = 0; i < data.length(); i++ ) {
      if ( !reassemblerBuffer[i + buffer_idx].second ) {
        reassemblerBuffer[buffer_idx + i] = make_pair( data[i], true );
        bytes_pending_++;
      }
    }
  }

  if ( is_last_substring ) {
    last_message_received = true;
    last_message_index = first_index + data.length();
  }

  if ( !reassemblerBuffer.empty() && reassemblerBuffer[0].second ) {
    uint64_t i = 0;
    string t;
    while ( i < capacity && reassemblerBuffer[i].second ) {
      t += reassemblerBuffer[i].first;
      i++;
    }
    output.push( t );
    buffer_head += i;
    bytes_pending_ -= i;
    reassemblerBuffer.erase( reassemblerBuffer.begin(), reassemblerBuffer.begin() + i );
  }

  uint64_t tt
    = std::count_if( reassemblerBuffer.begin(), reassemblerBuffer.end(), []( auto& p ) { return p.second; } );
  cout << tt;
  if ( last_message_received && buffer_head >= last_message_index ) {
    output.close();
  }
}

uint64_t Reassembler::bytes_pending() const
{
  return bytes_pending_;
}
