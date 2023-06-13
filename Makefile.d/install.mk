
install: build
	@echo "$@"
	cp build/$(BUMP_VERSION_BINARY) ${GOROOT}/bin