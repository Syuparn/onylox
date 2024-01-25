build:
	onyx build -r wasi -o onylox.wasm main.onyx

test: build
	@echo "--- unit tests ---"
	find src/ -name "*_test.onyx" | xargs -I{} onyx run {}
	@echo "--- integration tests ---"
	bats tests