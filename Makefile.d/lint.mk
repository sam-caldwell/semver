
lint:
	@echo "$@"
	@go install honnef.co/go/tools/cmd/staticcheck@latest
	@go install golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@latest
	@go vet ./...
	@staticcheck -f stylish ./...
