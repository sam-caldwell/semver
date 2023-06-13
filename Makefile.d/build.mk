
build: test clean
	@echo "$@"
	@rm build/$(BUMP_VERSION_BINARY) &> /dev/null || true
	@go build -v -o build/$(BUMP_VERSION_BINARY) cmd/$(BUMP_VERSION_BINARY)/main.go
	@# Add more commands here.
