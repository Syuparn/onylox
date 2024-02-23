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

@test "undefined property" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_undefined_property.lox
  assert_output "Undefined property bar."$'\n'"[line 4]"
}

@test "instance fields" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_fields.lox
  assert_output "123"$'\n'"456"
}

@test "instance methods" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_methods.lox
  assert_output "Crunch crunch crunch!"
}

@test "field shadows method" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_shadowing.lox
  assert_output "Hi!"$'\n'"Bye!"
}

@test "this" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_this.lox
  assert_output "Jane"$'\n'"Jane"
}

@test "toplevel this" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/error_top_level_this.lox
  assert_output "[line 1] Error at 'this': Can't use 'this' outside of a class."
}

@test "constructor" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/class_init.lox
  assert_output "true"$'\n'"I'm Jane."
}

@test "call init directly" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_call_init.lox
  assert_output "Person instance"$'\n'"true"
}

@test "class equivalence" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/class_equivalence.lox
  assert_output "true"$'\n'"false"
}

@test "instance equivalence" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/instance_equivalence.lox
  assert_output "true"$'\n'"false"
}

@test "init returns value" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/error_init_returns_value.lox
  assert_output "[line 3] Error at 'return': Can't return a value from an initializer."
}

@test "explicit return in init" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/class_init_explicit_return.lox
  assert_output "Foo instance"
}

@test "class inherits itself" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/error_inherit_itself.lox
  assert_output "[line 1] Error at 'Oops': A class can't inherit from itself."
}

@test "class inherits non-class value" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/error_inherit_nonclass.lox
  assert_output "Superclass must be a class."$'\n'"[line 2]"
}

@test "class inheritance" {
  run wasmer run --mapdir tests:tests onylox.wasm -- tests/testdata/src/class_inheritance.lox
  assert_output "meow"$'\n'"happyhappyhappy"
}
