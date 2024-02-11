#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "clock function" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/clock.lox
  # time depends on when the test is run, so we cannot check the output.
  assert_success
}
