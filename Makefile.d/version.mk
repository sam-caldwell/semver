
version:
	@go run cmd/$(BUMP_VERSION_BINARY)/main.go -patch -updateTag
