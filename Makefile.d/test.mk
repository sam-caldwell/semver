
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
