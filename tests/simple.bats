#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "show help" {
  run wasmer run onylox.wasm -- -h
  assert_output "Usage: onylox [script]"
}

@test "interpret a simple expr" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/expr.onyx
  assert_success
}

# TODO: assert_output after evaluator is implemented
@test "run a source file" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/hello.onyx
  assert_success
}

@test "file not found" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/notfound.onyx
  assert_output "Error: failed to read \"tests/testdata/src/notfound.onyx\": NotFound"
}
