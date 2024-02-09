# NOTE: use onyx directly because compiled wasm somehow cannot handle runtime errors (number + string) and print statements
# (`onyx run main.onyx -- -- tests/testdata/src/foo.lox`)

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "interpret an empty file" {
  run onyx run main.onyx -- -- tests/testdata/src/empty.lox
  assert_success
}

@test "print calculation result" {
  run onyx run main.onyx -- -- tests/testdata/src/calculate.lox
  assert_success
  assert_output "20"
}

@test "interpret multi statements" {
  run onyx run main.onyx -- -- tests/testdata/src/multi_statements.lox
  assert_success
  assert_output "one"$'\n'"two"
}
