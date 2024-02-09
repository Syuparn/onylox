#!/usr/bin/env bats

# NOTE: use onyx directly because compiled wasm somehow cannot handle runtime errors (number + string) and print statements
# (`onyx run main.onyx -- -- tests/testdata/src/foo.lox`)

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "show help" {
  # NOTE: pad first arg as dummy (--)
  run onyx run main.onyx -- -- -h
  assert_output "Usage: onylox [script]"
}

@test "interpret a simple expr" {
  run onyx run main.onyx -- -- tests/testdata/src/expr.lox
  assert_success
}

@test "syntax error" {
  run onyx run main.onyx -- -- tests/testdata/src/syntax_error.lox
  assert_output "[line 1] Error at ';': Expect ')' after expression."
}

@test "runtime error" {
  run onyx run main.onyx -- -- tests/testdata/src/runtime_error.lox
  assert_output "Operand must be two numbers or two strings."$'\n'"[line 1]"
}

@test "run a source file" {
  run onyx run main.onyx -- -- tests/testdata/src/hello.lox
  assert_success
  assert_output "Hello, world!"
}

@test "file not found" {
  run onyx run main.onyx -- -- tests/testdata/src/notfound.lox
  assert_output "Error: failed to read \"tests/testdata/src/notfound.lox\": NotFound"
}
