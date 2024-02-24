# onylox
[![Test](https://github.com/Syuparn/onylox/actions/workflows/test.yml/badge.svg)](https://github.com/Syuparn/onylox/actions/workflows/test.yml)
[![Wasmer](https://img.shields.io/badge/Wasmer-registry-red)](https://wasmer.io/syuparn/onylox)

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

# Dependencies

- Onyx v0.1.9
