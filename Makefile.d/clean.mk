
clean:
	@echo "$@"
	@rm -rf build &>/dev/null || true
	@mkdir -p build &>/dev/null || true