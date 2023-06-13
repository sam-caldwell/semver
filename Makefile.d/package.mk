
PACKAGE_NAME:="build/$(OPSYS).$(CPU_ARCH)-$(BUMP_VERSION_BINARY)"
package:
	@echo "$@"
	@tar -cvzf $(PACKAGE_NAME).tar.gz build/$(BUMP_VERSION_BINARY)
	@rm build/$(BUMP_VERSION_BINARY)
	@echo "package: $(PACKAGE_NAME).tar.gz"