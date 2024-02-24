.PHONY: build
build:
	onyx build -r wasi -o onylox.wasm main.onyx

.PHONY: build-js
build-js:
	onyx build -r js -o playground/src/assets/onylox.wasm main.onyx

.PHONY: test
test: test-unit test-integration

.PHONY: test-integration
test-integration: build
	@echo "--- integration tests ---"
	bats tests

.PHONY: test-unit
test-unit:
	@echo "--- unit tests ---"
	find src/ -name "*_test.onyx" | xargs -I{} onyx run {}
	@echo "done"
