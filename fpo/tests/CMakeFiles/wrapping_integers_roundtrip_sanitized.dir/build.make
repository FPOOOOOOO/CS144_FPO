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

# Include any dependencies generated for this target.
include tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/flags.make

tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o: tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/flags.make
tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o: /home/cs144/minnow/tests/wrapping_integers_roundtrip.cc
tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o: tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/cs144/minnow/fpo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o"
	cd /home/cs144/minnow/fpo/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o -MF CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o.d -o CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o -c /home/cs144/minnow/tests/wrapping_integers_roundtrip.cc

tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.i"
	cd /home/cs144/minnow/fpo/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cs144/minnow/tests/wrapping_integers_roundtrip.cc > CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.i

tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.s"
	cd /home/cs144/minnow/fpo/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cs144/minnow/tests/wrapping_integers_roundtrip.cc -o CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.s

# Object files for target wrapping_integers_roundtrip_sanitized
wrapping_integers_roundtrip_sanitized_OBJECTS = \
"CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o"

# External object files for target wrapping_integers_roundtrip_sanitized
wrapping_integers_roundtrip_sanitized_EXTERNAL_OBJECTS =

tests/wrapping_integers_roundtrip_sanitized: tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/wrapping_integers_roundtrip.cc.o
tests/wrapping_integers_roundtrip_sanitized: tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/build.make
tests/wrapping_integers_roundtrip_sanitized: tests/libminnow_testing_sanitized.a
tests/wrapping_integers_roundtrip_sanitized: src/libminnow_sanitized.a
tests/wrapping_integers_roundtrip_sanitized: util/libutil_sanitized.a
tests/wrapping_integers_roundtrip_sanitized: tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/cs144/minnow/fpo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable wrapping_integers_roundtrip_sanitized"
	cd /home/cs144/minnow/fpo/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/build: tests/wrapping_integers_roundtrip_sanitized
.PHONY : tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/build

tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/clean:
	cd /home/cs144/minnow/fpo/tests && $(CMAKE_COMMAND) -P CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/clean

tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/depend:
	cd /home/cs144/minnow/fpo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cs144/minnow /home/cs144/minnow/tests /home/cs144/minnow/fpo /home/cs144/minnow/fpo/tests /home/cs144/minnow/fpo/tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/wrapping_integers_roundtrip_sanitized.dir/depend

