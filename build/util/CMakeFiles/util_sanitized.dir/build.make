# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kaiykato/minnow

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kaiykato/build

# Include any dependencies generated for this target.
include util/CMakeFiles/util_sanitized.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include util/CMakeFiles/util_sanitized.dir/compiler_depend.make

# Include the progress variables for this target.
include util/CMakeFiles/util_sanitized.dir/progress.make

# Include the compile flags for this target's objects.
include util/CMakeFiles/util_sanitized.dir/flags.make

util/CMakeFiles/util_sanitized.dir/address.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/address.cc.o: /home/kaiykato/minnow/util/address.cc
util/CMakeFiles/util_sanitized.dir/address.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object util/CMakeFiles/util_sanitized.dir/address.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/address.cc.o -MF CMakeFiles/util_sanitized.dir/address.cc.o.d -o CMakeFiles/util_sanitized.dir/address.cc.o -c /home/kaiykato/minnow/util/address.cc

util/CMakeFiles/util_sanitized.dir/address.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/address.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/address.cc > CMakeFiles/util_sanitized.dir/address.cc.i

util/CMakeFiles/util_sanitized.dir/address.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/address.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/address.cc -o CMakeFiles/util_sanitized.dir/address.cc.s

util/CMakeFiles/util_sanitized.dir/arp_message.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/arp_message.cc.o: /home/kaiykato/minnow/util/arp_message.cc
util/CMakeFiles/util_sanitized.dir/arp_message.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object util/CMakeFiles/util_sanitized.dir/arp_message.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/arp_message.cc.o -MF CMakeFiles/util_sanitized.dir/arp_message.cc.o.d -o CMakeFiles/util_sanitized.dir/arp_message.cc.o -c /home/kaiykato/minnow/util/arp_message.cc

util/CMakeFiles/util_sanitized.dir/arp_message.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/arp_message.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/arp_message.cc > CMakeFiles/util_sanitized.dir/arp_message.cc.i

util/CMakeFiles/util_sanitized.dir/arp_message.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/arp_message.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/arp_message.cc -o CMakeFiles/util_sanitized.dir/arp_message.cc.s

util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.o: /home/kaiykato/minnow/util/ethernet_header.cc
util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.o -MF CMakeFiles/util_sanitized.dir/ethernet_header.cc.o.d -o CMakeFiles/util_sanitized.dir/ethernet_header.cc.o -c /home/kaiykato/minnow/util/ethernet_header.cc

util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/ethernet_header.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/ethernet_header.cc > CMakeFiles/util_sanitized.dir/ethernet_header.cc.i

util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/ethernet_header.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/ethernet_header.cc -o CMakeFiles/util_sanitized.dir/ethernet_header.cc.s

util/CMakeFiles/util_sanitized.dir/eventloop.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/eventloop.cc.o: /home/kaiykato/minnow/util/eventloop.cc
util/CMakeFiles/util_sanitized.dir/eventloop.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object util/CMakeFiles/util_sanitized.dir/eventloop.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/eventloop.cc.o -MF CMakeFiles/util_sanitized.dir/eventloop.cc.o.d -o CMakeFiles/util_sanitized.dir/eventloop.cc.o -c /home/kaiykato/minnow/util/eventloop.cc

util/CMakeFiles/util_sanitized.dir/eventloop.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/eventloop.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/eventloop.cc > CMakeFiles/util_sanitized.dir/eventloop.cc.i

util/CMakeFiles/util_sanitized.dir/eventloop.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/eventloop.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/eventloop.cc -o CMakeFiles/util_sanitized.dir/eventloop.cc.s

util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.o: /home/kaiykato/minnow/util/file_descriptor.cc
util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.o -MF CMakeFiles/util_sanitized.dir/file_descriptor.cc.o.d -o CMakeFiles/util_sanitized.dir/file_descriptor.cc.o -c /home/kaiykato/minnow/util/file_descriptor.cc

util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/file_descriptor.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/file_descriptor.cc > CMakeFiles/util_sanitized.dir/file_descriptor.cc.i

util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/file_descriptor.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/file_descriptor.cc -o CMakeFiles/util_sanitized.dir/file_descriptor.cc.s

util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.o: /home/kaiykato/minnow/util/ipv4_header.cc
util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.o -MF CMakeFiles/util_sanitized.dir/ipv4_header.cc.o.d -o CMakeFiles/util_sanitized.dir/ipv4_header.cc.o -c /home/kaiykato/minnow/util/ipv4_header.cc

util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/ipv4_header.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/ipv4_header.cc > CMakeFiles/util_sanitized.dir/ipv4_header.cc.i

util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/ipv4_header.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/ipv4_header.cc -o CMakeFiles/util_sanitized.dir/ipv4_header.cc.s

util/CMakeFiles/util_sanitized.dir/random.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/random.cc.o: /home/kaiykato/minnow/util/random.cc
util/CMakeFiles/util_sanitized.dir/random.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object util/CMakeFiles/util_sanitized.dir/random.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/random.cc.o -MF CMakeFiles/util_sanitized.dir/random.cc.o.d -o CMakeFiles/util_sanitized.dir/random.cc.o -c /home/kaiykato/minnow/util/random.cc

util/CMakeFiles/util_sanitized.dir/random.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/random.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/random.cc > CMakeFiles/util_sanitized.dir/random.cc.i

util/CMakeFiles/util_sanitized.dir/random.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/random.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/random.cc -o CMakeFiles/util_sanitized.dir/random.cc.s

util/CMakeFiles/util_sanitized.dir/socket.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/socket.cc.o: /home/kaiykato/minnow/util/socket.cc
util/CMakeFiles/util_sanitized.dir/socket.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object util/CMakeFiles/util_sanitized.dir/socket.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/socket.cc.o -MF CMakeFiles/util_sanitized.dir/socket.cc.o.d -o CMakeFiles/util_sanitized.dir/socket.cc.o -c /home/kaiykato/minnow/util/socket.cc

util/CMakeFiles/util_sanitized.dir/socket.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/socket.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/socket.cc > CMakeFiles/util_sanitized.dir/socket.cc.i

util/CMakeFiles/util_sanitized.dir/socket.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/socket.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/socket.cc -o CMakeFiles/util_sanitized.dir/socket.cc.s

util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o: /home/kaiykato/minnow/util/tcp_minnow_socket.cc
util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o -MF CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o.d -o CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o -c /home/kaiykato/minnow/util/tcp_minnow_socket.cc

util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/tcp_minnow_socket.cc > CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.i

util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/tcp_minnow_socket.cc -o CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.s

util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o: /home/kaiykato/minnow/util/tcp_over_ip.cc
util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o -MF CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o.d -o CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o -c /home/kaiykato/minnow/util/tcp_over_ip.cc

util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/tcp_over_ip.cc > CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.i

util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/tcp_over_ip.cc -o CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.s

util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.o: /home/kaiykato/minnow/util/tcp_segment.cc
util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.o -MF CMakeFiles/util_sanitized.dir/tcp_segment.cc.o.d -o CMakeFiles/util_sanitized.dir/tcp_segment.cc.o -c /home/kaiykato/minnow/util/tcp_segment.cc

util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/tcp_segment.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/tcp_segment.cc > CMakeFiles/util_sanitized.dir/tcp_segment.cc.i

util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/tcp_segment.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/tcp_segment.cc -o CMakeFiles/util_sanitized.dir/tcp_segment.cc.s

util/CMakeFiles/util_sanitized.dir/tun.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/tun.cc.o: /home/kaiykato/minnow/util/tun.cc
util/CMakeFiles/util_sanitized.dir/tun.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object util/CMakeFiles/util_sanitized.dir/tun.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/tun.cc.o -MF CMakeFiles/util_sanitized.dir/tun.cc.o.d -o CMakeFiles/util_sanitized.dir/tun.cc.o -c /home/kaiykato/minnow/util/tun.cc

util/CMakeFiles/util_sanitized.dir/tun.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/tun.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/tun.cc > CMakeFiles/util_sanitized.dir/tun.cc.i

util/CMakeFiles/util_sanitized.dir/tun.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/tun.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/tun.cc -o CMakeFiles/util_sanitized.dir/tun.cc.s

util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o: util/CMakeFiles/util_sanitized.dir/flags.make
util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o: /home/kaiykato/minnow/util/tuntap_adapter.cc
util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o: util/CMakeFiles/util_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o -MF CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o.d -o CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o -c /home/kaiykato/minnow/util/tuntap_adapter.cc

util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.i"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/util/tuntap_adapter.cc > CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.i

util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.s"
	cd /home/kaiykato/build/util && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/util/tuntap_adapter.cc -o CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.s

# Object files for target util_sanitized
util_sanitized_OBJECTS = \
"CMakeFiles/util_sanitized.dir/address.cc.o" \
"CMakeFiles/util_sanitized.dir/arp_message.cc.o" \
"CMakeFiles/util_sanitized.dir/ethernet_header.cc.o" \
"CMakeFiles/util_sanitized.dir/eventloop.cc.o" \
"CMakeFiles/util_sanitized.dir/file_descriptor.cc.o" \
"CMakeFiles/util_sanitized.dir/ipv4_header.cc.o" \
"CMakeFiles/util_sanitized.dir/random.cc.o" \
"CMakeFiles/util_sanitized.dir/socket.cc.o" \
"CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o" \
"CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o" \
"CMakeFiles/util_sanitized.dir/tcp_segment.cc.o" \
"CMakeFiles/util_sanitized.dir/tun.cc.o" \
"CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o"

# External object files for target util_sanitized
util_sanitized_EXTERNAL_OBJECTS =

util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/address.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/arp_message.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/ethernet_header.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/eventloop.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/file_descriptor.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/ipv4_header.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/random.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/socket.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/tcp_minnow_socket.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/tcp_over_ip.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/tcp_segment.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/tun.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/tuntap_adapter.cc.o
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/build.make
util/libutil_sanitized.a: util/CMakeFiles/util_sanitized.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX static library libutil_sanitized.a"
	cd /home/kaiykato/build/util && $(CMAKE_COMMAND) -P CMakeFiles/util_sanitized.dir/cmake_clean_target.cmake
	cd /home/kaiykato/build/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/util_sanitized.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
util/CMakeFiles/util_sanitized.dir/build: util/libutil_sanitized.a
.PHONY : util/CMakeFiles/util_sanitized.dir/build

util/CMakeFiles/util_sanitized.dir/clean:
	cd /home/kaiykato/build/util && $(CMAKE_COMMAND) -P CMakeFiles/util_sanitized.dir/cmake_clean.cmake
.PHONY : util/CMakeFiles/util_sanitized.dir/clean

util/CMakeFiles/util_sanitized.dir/depend:
	cd /home/kaiykato/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaiykato/minnow /home/kaiykato/minnow/util /home/kaiykato/build /home/kaiykato/build/util /home/kaiykato/build/util/CMakeFiles/util_sanitized.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : util/CMakeFiles/util_sanitized.dir/depend

