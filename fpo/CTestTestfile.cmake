# CMake generated Testfile for 
# Source directory: /home/cs144/minnow
# Build directory: /home/cs144/minnow/fpo
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[compile with bug-checkers]=] "/usr/bin/cmake" "--build" "/home/cs144/minnow/fpo" "-t" "functionality_testing" "webget")
set_tests_properties([=[compile with bug-checkers]=] PROPERTIES  FIXTURES_SETUP "compile" TIMEOUT "0" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;6;add_test;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[t_webget]=] "/home/cs144/minnow/tests/webget_t.sh" "/home/cs144/minnow/fpo")
set_tests_properties([=[t_webget]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;17;add_test;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_basics]=] "/home/cs144/minnow/fpo/tests/byte_stream_basics_sanitized")
set_tests_properties([=[byte_stream_basics]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;20;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_capacity]=] "/home/cs144/minnow/fpo/tests/byte_stream_capacity_sanitized")
set_tests_properties([=[byte_stream_capacity]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;21;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_one_write]=] "/home/cs144/minnow/fpo/tests/byte_stream_one_write_sanitized")
set_tests_properties([=[byte_stream_one_write]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;22;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_two_writes]=] "/home/cs144/minnow/fpo/tests/byte_stream_two_writes_sanitized")
set_tests_properties([=[byte_stream_two_writes]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;23;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_many_writes]=] "/home/cs144/minnow/fpo/tests/byte_stream_many_writes_sanitized")
set_tests_properties([=[byte_stream_many_writes]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;24;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_stress_test]=] "/home/cs144/minnow/fpo/tests/byte_stream_stress_test_sanitized")
set_tests_properties([=[byte_stream_stress_test]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;25;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_single]=] "reassembler_single_sanitized")
set_tests_properties([=[reassembler_single]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;27;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_cap]=] "reassembler_cap_sanitized")
set_tests_properties([=[reassembler_cap]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;28;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_seq]=] "reassembler_seq_sanitized")
set_tests_properties([=[reassembler_seq]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;29;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_dup]=] "reassembler_dup_sanitized")
set_tests_properties([=[reassembler_dup]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;30;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_holes]=] "reassembler_holes_sanitized")
set_tests_properties([=[reassembler_holes]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;31;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_overlapping]=] "reassembler_overlapping_sanitized")
set_tests_properties([=[reassembler_overlapping]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;32;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_win]=] "reassembler_win_sanitized")
set_tests_properties([=[reassembler_win]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;33;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[wrapping_integers_cmp]=] "wrapping_integers_cmp_sanitized")
set_tests_properties([=[wrapping_integers_cmp]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;35;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[wrapping_integers_wrap]=] "wrapping_integers_wrap_sanitized")
set_tests_properties([=[wrapping_integers_wrap]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;36;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[wrapping_integers_unwrap]=] "wrapping_integers_unwrap_sanitized")
set_tests_properties([=[wrapping_integers_unwrap]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;37;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[wrapping_integers_roundtrip]=] "wrapping_integers_roundtrip_sanitized")
set_tests_properties([=[wrapping_integers_roundtrip]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;38;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[wrapping_integers_extra]=] "wrapping_integers_extra_sanitized")
set_tests_properties([=[wrapping_integers_extra]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;39;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_connect]=] "recv_connect_sanitized")
set_tests_properties([=[recv_connect]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;41;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_transmit]=] "recv_transmit_sanitized")
set_tests_properties([=[recv_transmit]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;42;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_window]=] "recv_window_sanitized")
set_tests_properties([=[recv_window]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;43;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_reorder]=] "recv_reorder_sanitized")
set_tests_properties([=[recv_reorder]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;44;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_reorder_more]=] "recv_reorder_more_sanitized")
set_tests_properties([=[recv_reorder_more]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;45;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_close]=] "recv_close_sanitized")
set_tests_properties([=[recv_close]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;46;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[recv_special]=] "recv_special_sanitized")
set_tests_properties([=[recv_special]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;47;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_connect]=] "send_connect_sanitized")
set_tests_properties([=[send_connect]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;49;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_transmit]=] "send_transmit_sanitized")
set_tests_properties([=[send_transmit]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;50;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_retx]=] "send_retx_sanitized")
set_tests_properties([=[send_retx]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;51;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_window]=] "send_window_sanitized")
set_tests_properties([=[send_window]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;52;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_ack]=] "send_ack_sanitized")
set_tests_properties([=[send_ack]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;53;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_close]=] "send_close_sanitized")
set_tests_properties([=[send_close]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;54;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[send_extra]=] "send_extra_sanitized")
set_tests_properties([=[send_extra]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;55;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[net_interface]=] "net_interface_sanitized")
set_tests_properties([=[net_interface]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;57;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[router]=] "router_sanitized")
set_tests_properties([=[router]=] PROPERTIES  FIXTURES_REQUIRED "compile" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;10;add_test;/home/cs144/minnow/etc/tests.cmake;59;ttest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[compile with optimization]=] "/usr/bin/cmake" "--build" "/home/cs144/minnow/fpo" "-t" "speed_testing")
set_tests_properties([=[compile with optimization]=] PROPERTIES  FIXTURES_SETUP "compile_opt" TIMEOUT "0" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;80;add_test;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[byte_stream_speed_test]=] "/home/cs144/minnow/fpo/tests/byte_stream_speed_test")
set_tests_properties([=[byte_stream_speed_test]=] PROPERTIES  FIXTURES_REQUIRED "compile_opt" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;84;add_test;/home/cs144/minnow/etc/tests.cmake;91;stest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
add_test([=[reassembler_speed_test]=] "reassembler_speed_test")
set_tests_properties([=[reassembler_speed_test]=] PROPERTIES  FIXTURES_REQUIRED "compile_opt" _BACKTRACE_TRIPLES "/home/cs144/minnow/etc/tests.cmake;84;add_test;/home/cs144/minnow/etc/tests.cmake;92;stest;/home/cs144/minnow/etc/tests.cmake;0;;/home/cs144/minnow/CMakeLists.txt;16;include;/home/cs144/minnow/CMakeLists.txt;0;")
subdirs("util")
subdirs("src")
subdirs("tests")
subdirs("apps")
