
version:
	@go run cmd/$(BUMP_VERSION_BINARY)/main.go -patch -updateTag
	git push origin $(go run cmd/$(BUMP_VERSION_BINARY)/main.go)