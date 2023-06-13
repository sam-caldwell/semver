BUMP_VERSION_BINARY:="bumpVersion"
CPU_ARCH:=$(shell uname -m)
OPSYS:=$(shell uname -s | tr A-Z a-z)


clean:
	@echo "$@"
	@rm -rf build &>/dev/null || true
	@mkdir -p build &>/dev/null || true


lint:
	@echo "$@"
	@go install honnef.co/go/tools/cmd/staticcheck@latest
	@go install golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@latest
	@go vet ./...
	@staticcheck -f stylish ./...


test: lint
	@echo "$@"
	go test -v -count=10 ./...


# Make sure act is installed (https://github.com/nektos/act)
test/actions: test
	@echo "$@"
	@( \
		command -v act || { \
			command -v brew &> /dev/null && brew reinstall act; \
		} \
	)
	act --use-gitignore --


build: test clean
	@echo "$@"
	@rm build/$(BUMP_VERSION_BINARY) &> /dev/null || true
	@go build -v -o build/$(BUMP_VERSION_BINARY) cmd/$(BUMP_VERSION_BINARY)/main.go
	@# Add more commands here.


PACKAGE_NAME:="build/$(OPSYS).$(CPU_ARCH)-$(BUMP_VERSION_BINARY)"
package:
	@echo "$@"
	@tar -cvzf $(PACKAGE_NAME).tar.gz build/$(BUMP_VERSION_BINARY)
	@rm build/$(BUMP_VERSION_BINARY)
	@echo "package: $(PACKAGE_NAME).tar.gz"


install: build
	@echo "$@"
	cp build/$(BUMP_VERSION_BINARY) ${GOROOT}/bin

version:
	@go run cmd/$(BUMP_VERSION_BINARY)/main.go -patch -updateTag
