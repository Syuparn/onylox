#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "show help" {
  run wasmer run onylox.wasm -- -h
  assert_output "Usage: onylox [script]"
}

# TODO: run file
