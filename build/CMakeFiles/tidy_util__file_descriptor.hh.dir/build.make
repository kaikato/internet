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

# Utility rule file for tidy_util__file_descriptor.hh.

# Include any custom commands dependencies for this target.
include CMakeFiles/tidy_util__file_descriptor.hh.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/tidy_util__file_descriptor.hh.dir/progress.make

CMakeFiles/tidy_util__file_descriptor.hh:
	clang-tidy --quiet -header-filter=.* -p=/home/kaiykato/build /home/kaiykato/minnow/util/file_descriptor.hh

tidy_util__file_descriptor.hh: CMakeFiles/tidy_util__file_descriptor.hh
tidy_util__file_descriptor.hh: CMakeFiles/tidy_util__file_descriptor.hh.dir/build.make
.PHONY : tidy_util__file_descriptor.hh

# Rule to build all files generated by this target.
CMakeFiles/tidy_util__file_descriptor.hh.dir/build: tidy_util__file_descriptor.hh
.PHONY : CMakeFiles/tidy_util__file_descriptor.hh.dir/build

CMakeFiles/tidy_util__file_descriptor.hh.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tidy_util__file_descriptor.hh.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tidy_util__file_descriptor.hh.dir/clean

CMakeFiles/tidy_util__file_descriptor.hh.dir/depend:
	cd /home/kaiykato/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaiykato/minnow /home/kaiykato/minnow /home/kaiykato/build /home/kaiykato/build /home/kaiykato/build/CMakeFiles/tidy_util__file_descriptor.hh.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tidy_util__file_descriptor.hh.dir/depend

