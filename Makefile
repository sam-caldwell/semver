BUMP_VERSION_BINARY:="bumpVersion"
CPU_ARCH:=$(shell uname -m)
OPSYS:=$(shell uname -s | tr A-Z a-z)

include Makefile.d/*.mk