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
