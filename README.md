# onylox
[Lox language](https://github.com/munificent/craftinginterpreters) implemented in [Onyx](https://onyxlang.io/)

# Run

```bash
$ make build
$ wasmer run --mapdir examples:examples onylox.wasm -- examples/hello.onyx
```

# Test

```bash
# bats is required
$ make test
```
