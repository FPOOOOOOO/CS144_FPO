# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_SOURCE_DIR = /home/cs144/minnow

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cs144/minnow/fpo

# Utility rule file for check6.

# Include any custom commands dependencies for this target.
include CMakeFiles/check6.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/check6.dir/progress.make

CMakeFiles/check6:
	/usr/bin/ctest --output-on-failure --stop-on-failure --timeout 12 -R '^net_interface|^router'

check6: CMakeFiles/check6
check6: CMakeFiles/check6.dir/build.make
.PHONY : check6

# Rule to build all files generated by this target.
CMakeFiles/check6.dir/build: check6
.PHONY : CMakeFiles/check6.dir/build

CMakeFiles/check6.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/check6.dir/cmake_clean.cmake
.PHONY : CMakeFiles/check6.dir/clean

CMakeFiles/check6.dir/depend:
	cd /home/cs144/minnow/fpo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cs144/minnow /home/cs144/minnow /home/cs144/minnow/fpo /home/cs144/minnow/fpo /home/cs144/minnow/fpo/CMakeFiles/check6.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/check6.dir/depend

