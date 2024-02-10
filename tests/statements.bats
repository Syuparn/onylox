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

@test "block statement" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/block.lox
  assert_output "hello"
  assert_success
}

@test "block scopes" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/scope.lox
  assert_output "inner a"$'\n'"outer b"$'\n'"global c"$'\n'"outer a"$'\n'"outer b"$'\n'"global c"$'\n'"global a"$'\n'"global b"$'\n'"global c"
  assert_success
}
