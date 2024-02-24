# onylox
[![Test](https://github.com/Syuparn/onylox/actions/workflows/test.yml/badge.svg)](https://github.com/Syuparn/onylox/actions/workflows/test.yml)
[![Wasmer](https://img.shields.io/badge/Wasmer-registry-red)](https://wasmer.io/syuparn/onylox)

[Lox language](https://github.com/munificent/craftinginterpreters) implemented in [Onyx](https://onyxlang.io/)

# Playground

<img src="./images/playground_screenshot.png" width="800px">

# Run locally

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
