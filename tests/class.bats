#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "simple class" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/class.lox
  assert_output "Person"
}

@test "simple instance" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance.lox
  assert_output "Bagel instance"
}
