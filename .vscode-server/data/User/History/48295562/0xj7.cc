#include <stdexcept>

#include "byte_stream.hh"

using namespace std;

ByteStream::ByteStream( uint64_t capacity ) : capacity_( capacity ), Q() {}

void Writer::push( string data )
{
  // Your code here.
  uint32_t i = 0;
  while (bytes_pushed_ < capacity_){
    Q.push(data[i]);
    bytes_pushed_++;
    i++;
  }
}

void Writer::close()
{
  // Your code here.
  is_closed_ = true;
}

void Writer::set_error()
{
  // Your code here.
  has_error_ = true;
}

bool Writer::is_closed() const
{
  // Your code here.
  return is_closed_;
}

uint64_t Writer::available_capacity() const
{
  // Your code here.
  return capacity_ - bytes_pushed_;
}

uint64_t Writer::bytes_pushed() const
{
  // Your code here.
  return bytes_pushed_;
}

string_view Reader::peek() const
{
  // Your code here.
  const char ch = Q.front();
  //string s = "";
  stored = "" + ch;
  //s = ch;
  string_view sv {&stored};
  return sv;
}

bool Reader::is_finished() const
{
  // Your code here.
  return (bytes_buffered() == 0 && is_closed_);
}

bool Reader::has_error() const
{
  // Your code here.
  return has_error_;
}

void Reader::pop( uint64_t len )
{
  // Your code here.
  for (uint64_t i = 0; i < len; i++){
    Q.pop();
    bytes_popped_++;
  }
}

uint64_t Reader::bytes_buffered() const
{
  // Your code here.
  return bytes_pushed_ - bytes_popped_;
}

uint64_t Reader::bytes_popped() const
{
  // Your code here.
  return bytes_popped_;
}
