#!/usr/bin/env bash
# test functions should start with test_
# using https://github.com/pgrange/bash_unit
#  fail
#  assert
#  assert "test -e /tmp/the_file"
#  assert_fails "grep this /tmp/the_file" "should not write 'this' in /tmp/the_file"
#  assert_status_code 25 code
#  assert_equals "a string" "another string" "a string should be another string"
#  assert_not_equals "a string" "a string" "a string should be different from another string"
#  fake ps echo hello world
test_folder=$(dirname "$0")
echo "Executing in [$test_folder]"
root_folder=$(cd "$test_folder/.." && pwd) #
echo "Root folder  [$root_folder]"

root_script="$root_folder/bumpkeys.sh"
keys_folder=$(cd "$test_folder/example_keys" && pwd) #
echo "Keys folder  [$keys_folder]"


test_analyze_works() {
  # test function hash
  assert "'$root_script' -d '$keys_folder' analyze"
  assert "'$root_script' -d '$keys_folder' analyze | grep OK"
}
