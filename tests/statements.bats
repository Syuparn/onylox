#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "interpret an empty file" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/empty.lox
  assert_success
}

@test "print calculation result" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/calculate.lox
  assert_output "20"
  assert_success
}

@test "interpret multi statements" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/multi_statements.lox
  assert_output "one"$'\n'"two"
  assert_success
}

@test "define variable" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/variable.lox
  assert_output "nil"
  assert_success
}

@test "define variable with value" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/variable_value.lox
  assert_output "5"
  assert_success
}

@test "define assignment" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/assign.lox
  assert_output "2"$'\n'"3"
  assert_success
}
