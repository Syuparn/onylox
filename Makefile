build:
	onyx build -r wasi -o onylox.wasm main.onyx

test: build
	bats tests
