NAME=libexternal
TYPE=archive

SOURCES=external.c

CUSTOM_DEFINES=

CUSTOM_INCLUDES=./src

CUSTOM_CCFLAGS=

libexternal.headers:
	mkdir -p $(HEADER_DIR)/revolution
	cp src/external.h $(HEADER_DIR)/revolution

include ../configurations/archive.linux.makefile
