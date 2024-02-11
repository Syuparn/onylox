#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "simple function" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/function.lox
  assert_output "Hello, world!"
}

@test "arities" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/function_arities.lox
  assert_output "1"$'\n'"3"$'\n'"6"
}

@test "wrong arity" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/wrong_arity.lox
  assert_output "Expected 2 arguments but got 1."$'\n'"[line 5]"
}

@test "function polymorphism" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/function_polymorphism.lox
  assert_output "foobar"$'\n'"5"
}

@test "redefine variable" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/function_redefine.lox
  assert_output "hello"$'\n'"5"
}

# recursion
# return (and implicit nil return)
# closure
