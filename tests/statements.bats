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
  assert_output "20"
  assert_success
}

@test "interpret multi statements" {
  run onyx run main.onyx -- -- tests/testdata/src/multi_statements.lox
  assert_output "one"$'\n'"two"
  assert_success
}

@test "define variable" {
  run onyx run main.onyx -- -- tests/testdata/src/variable.lox
  assert_output "nil"
  assert_success
}

@test "define variable with value" {
  run onyx run main.onyx -- -- tests/testdata/src/variable_value.lox
  assert_output "5"
  assert_success
}
