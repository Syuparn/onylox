#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "if statement" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/if.lox
  assert_output "truthy"
}

@test "dangling else" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/dangling_else.lox
  assert_output "true-true"
}

@test "logical operators" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/logical_operators.lox
  assert_output "left"$'\n'"right"$'\n'"left"$'\n'"false"$'\n'"right"$'\n'"false"$'\n'"false"$'\n'"false"
}

# TODO: add tests
@test "shortcuts" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/shortcuts.lox
  assert_output ""
}

@test "while" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/while.lox
  assert_output "0"$'\n'"1"$'\n'"2"
}
