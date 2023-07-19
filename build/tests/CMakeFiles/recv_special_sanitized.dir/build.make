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
include tests/CMakeFiles/recv_special_sanitized.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/recv_special_sanitized.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/recv_special_sanitized.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/recv_special_sanitized.dir/flags.make

tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o: tests/CMakeFiles/recv_special_sanitized.dir/flags.make
tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o: /home/kaiykato/minnow/tests/recv_special.cc
tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o: tests/CMakeFiles/recv_special_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o"
	cd /home/kaiykato/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o -MF CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o.d -o CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o -c /home/kaiykato/minnow/tests/recv_special.cc

tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/recv_special_sanitized.dir/recv_special.cc.i"
	cd /home/kaiykato/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaiykato/minnow/tests/recv_special.cc > CMakeFiles/recv_special_sanitized.dir/recv_special.cc.i

tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/recv_special_sanitized.dir/recv_special.cc.s"
	cd /home/kaiykato/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaiykato/minnow/tests/recv_special.cc -o CMakeFiles/recv_special_sanitized.dir/recv_special.cc.s

# Object files for target recv_special_sanitized
recv_special_sanitized_OBJECTS = \
"CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o"

# External object files for target recv_special_sanitized
recv_special_sanitized_EXTERNAL_OBJECTS =

tests/recv_special_sanitized: tests/CMakeFiles/recv_special_sanitized.dir/recv_special.cc.o
tests/recv_special_sanitized: tests/CMakeFiles/recv_special_sanitized.dir/build.make
tests/recv_special_sanitized: tests/libminnow_testing_sanitized.a
tests/recv_special_sanitized: src/libminnow_sanitized.a
tests/recv_special_sanitized: util/libutil_sanitized.a
tests/recv_special_sanitized: tests/CMakeFiles/recv_special_sanitized.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kaiykato/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable recv_special_sanitized"
	cd /home/kaiykato/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/recv_special_sanitized.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/recv_special_sanitized.dir/build: tests/recv_special_sanitized
.PHONY : tests/CMakeFiles/recv_special_sanitized.dir/build

tests/CMakeFiles/recv_special_sanitized.dir/clean:
	cd /home/kaiykato/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/recv_special_sanitized.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/recv_special_sanitized.dir/clean

tests/CMakeFiles/recv_special_sanitized.dir/depend:
	cd /home/kaiykato/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaiykato/minnow /home/kaiykato/minnow/tests /home/kaiykato/build /home/kaiykato/build/tests /home/kaiykato/build/tests/CMakeFiles/recv_special_sanitized.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/recv_special_sanitized.dir/depend

