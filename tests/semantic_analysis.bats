#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "redefine local variable" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/error_redefine_local_var.lox
  assert_output "[line 3] Error at 'a': Already a variable with this name in this scope."
}

@test "top-level return" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/error_top_level_return.lox
  assert_output "[line 1] Error at 'return': Can't return from top-level code."
}
