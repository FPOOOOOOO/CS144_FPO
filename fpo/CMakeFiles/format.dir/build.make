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

# Utility rule file for format.

# Include any custom commands dependencies for this target.
include CMakeFiles/format.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/format.dir/progress.make

CMakeFiles/format:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/cs144/minnow/fpo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Formatting source code..."
	clang-format -i /home/cs144/minnow/apps/bidirectional_stream_copy.cc /home/cs144/minnow/apps/bidirectional_stream_copy.hh /home/cs144/minnow/apps/tcp_ipv4.cc /home/cs144/minnow/apps/tcp_native.cc /home/cs144/minnow/apps/webget.cc /home/cs144/minnow/src/byte_stream.cc /home/cs144/minnow/src/byte_stream.hh /home/cs144/minnow/src/byte_stream_helpers.cc /home/cs144/minnow/src/network_interface.cc /home/cs144/minnow/src/network_interface.hh /home/cs144/minnow/src/reassembler.cc /home/cs144/minnow/src/reassembler.hh /home/cs144/minnow/src/router.cc /home/cs144/minnow/src/router.hh /home/cs144/minnow/src/tcp_minnow_socket.cc /home/cs144/minnow/src/tcp_receiver.cc /home/cs144/minnow/src/tcp_receiver.hh /home/cs144/minnow/src/tcp_sender.cc /home/cs144/minnow/src/tcp_sender.hh /home/cs144/minnow/src/wrapping_integers.cc /home/cs144/minnow/src/wrapping_integers.hh /home/cs144/minnow/tests/byte_stream_basics.cc /home/cs144/minnow/tests/byte_stream_capacity.cc /home/cs144/minnow/tests/byte_stream_many_writes.cc /home/cs144/minnow/tests/byte_stream_one_write.cc /home/cs144/minnow/tests/byte_stream_speed_test.cc /home/cs144/minnow/tests/byte_stream_stress_test.cc /home/cs144/minnow/tests/byte_stream_test_harness.hh /home/cs144/minnow/tests/byte_stream_two_writes.cc /home/cs144/minnow/tests/common.cc /home/cs144/minnow/tests/common.hh /home/cs144/minnow/tests/conversions.hh /home/cs144/minnow/tests/net_interface.cc /home/cs144/minnow/tests/network_interface_test_harness.hh /home/cs144/minnow/tests/reassembler_cap.cc /home/cs144/minnow/tests/reassembler_dup.cc /home/cs144/minnow/tests/reassembler_holes.cc /home/cs144/minnow/tests/reassembler_overlapping.cc /home/cs144/minnow/tests/reassembler_seq.cc /home/cs144/minnow/tests/reassembler_single.cc /home/cs144/minnow/tests/reassembler_speed_test.cc /home/cs144/minnow/tests/reassembler_test_harness.hh /home/cs144/minnow/tests/reassembler_win.cc /home/cs144/minnow/tests/receiver_test_harness.hh /home/cs144/minnow/tests/recv_close.cc /home/cs144/minnow/tests/recv_connect.cc /home/cs144/minnow/tests/recv_reorder.cc /home/cs144/minnow/tests/recv_reorder_more.cc /home/cs144/minnow/tests/recv_special.cc /home/cs144/minnow/tests/recv_transmit.cc /home/cs144/minnow/tests/recv_window.cc /home/cs144/minnow/tests/router.cc /home/cs144/minnow/tests/send_ack.cc /home/cs144/minnow/tests/send_close.cc /home/cs144/minnow/tests/send_connect.cc /home/cs144/minnow/tests/send_extra.cc /home/cs144/minnow/tests/send_retx.cc /home/cs144/minnow/tests/send_transmit.cc /home/cs144/minnow/tests/send_window.cc /home/cs144/minnow/tests/sender_test_harness.hh /home/cs144/minnow/tests/test_should_be.hh /home/cs144/minnow/tests/wrapping_integers_cmp.cc /home/cs144/minnow/tests/wrapping_integers_extra.cc /home/cs144/minnow/tests/wrapping_integers_roundtrip.cc /home/cs144/minnow/tests/wrapping_integers_unwrap.cc /home/cs144/minnow/tests/wrapping_integers_wrap.cc /home/cs144/minnow/util/address.cc /home/cs144/minnow/util/address.hh /home/cs144/minnow/util/arp_message.cc /home/cs144/minnow/util/arp_message.hh /home/cs144/minnow/util/checksum.hh /home/cs144/minnow/util/ethernet_frame.hh /home/cs144/minnow/util/ethernet_header.cc /home/cs144/minnow/util/ethernet_header.hh /home/cs144/minnow/util/eventloop.cc /home/cs144/minnow/util/eventloop.hh /home/cs144/minnow/util/exception.hh /home/cs144/minnow/util/fd_adapter.hh /home/cs144/minnow/util/file_descriptor.cc /home/cs144/minnow/util/file_descriptor.hh /home/cs144/minnow/util/ipv4_datagram.hh /home/cs144/minnow/util/ipv4_header.cc /home/cs144/minnow/util/ipv4_header.hh /home/cs144/minnow/util/lossy_fd_adapter.hh /home/cs144/minnow/util/parser.hh /home/cs144/minnow/util/random.cc /home/cs144/minnow/util/random.hh /home/cs144/minnow/util/socket.cc /home/cs144/minnow/util/socket.hh /home/cs144/minnow/util/tcp_config.hh /home/cs144/minnow/util/tcp_minnow_socket.hh /home/cs144/minnow/util/tcp_minnow_socket_impl.hh /home/cs144/minnow/util/tcp_over_ip.cc /home/cs144/minnow/util/tcp_over_ip.hh /home/cs144/minnow/util/tcp_peer.hh /home/cs144/minnow/util/tcp_receiver_message.hh /home/cs144/minnow/util/tcp_segment.cc /home/cs144/minnow/util/tcp_segment.hh /home/cs144/minnow/util/tcp_sender_message.hh /home/cs144/minnow/util/tun.cc /home/cs144/minnow/util/tun.hh /home/cs144/minnow/util/tuntap_adapter.cc /home/cs144/minnow/util/tuntap_adapter.hh /home/cs144/minnow/util/udinfo.hh

format: CMakeFiles/format
format: CMakeFiles/format.dir/build.make
.PHONY : format

# Rule to build all files generated by this target.
CMakeFiles/format.dir/build: format
.PHONY : CMakeFiles/format.dir/build

CMakeFiles/format.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/format.dir/cmake_clean.cmake
.PHONY : CMakeFiles/format.dir/clean

CMakeFiles/format.dir/depend:
	cd /home/cs144/minnow/fpo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cs144/minnow /home/cs144/minnow /home/cs144/minnow/fpo /home/cs144/minnow/fpo /home/cs144/minnow/fpo/CMakeFiles/format.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/format.dir/depend

