lint:
	@go install honnef.co/go/tools/cmd/staticcheck@latest
	@go install golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@latest
	@go vet ./...
	@staticcheck -f stylish ./...

test: lint
	@go test -v -count=1 ./...


test/actions: test
    # Make sure act is installed (https://github.com/nektos/act)
	@command -v brew &> /dev/null && brew reinstall act
	act --use-gitignore


build: test
	@go build -o build/bumpVersion cmd/bumpVersion/main.go
	# Add more commands here.

install:
	mkdir -p ${GOROOT}/bin &> /dev/null || true
	cp build/bumpVersion ${GOROOT}/bin/bumpVersion

