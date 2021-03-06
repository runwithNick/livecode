.PHONY: rnaiconv rnaiconv.debug rnaiconv.release rnaiconv.clean
rnaiconv: libexternal
	$(MAKE) -C ./rnaiconv rnaiconv

rnaiconv.debug: libexternal.debug
	MODE=debug $(MAKE) -C ./rnaiconv rnaiconv

rnaiconv.release: libexternal.release
	MODE=release $(MAKE) -C ./rnaiconv rnaiconv

rnaiconv.clean:
	MODE=debug $(MAKE) -C ./rnaiconv clean
	MODE=release $(MAKE) -C ./rnaiconv clean

.PHONY: libexternal libexternal.debug libexternal.release libexternal.clean
libexternal:
	$(MAKE) -C ./libexternal libexternal

libexternal.debug: libexternal.debug
	MODE=debug $(MAKE) -C ./libexternal libexternal

libexternal.release: libexternal.release
	MODE=release $(MAKE) -C ./libexternal libexternal

libexternal.clean:
	MODE=debug $(MAKE) -C ./libexternal clean
	MODE=release $(MAKE) -C ./libexternal clean

.PHONY: ctest ctest.debug ctest.release ctest.clean
ctest: libexternal
	$(MAKE) -C ./ctest ctest

ctest.debug: libexternal.debug
	MODE=debug $(MAKE) -C ./ctest ctest

ctest.release: libexternal.release
	MODE=release $(MAKE) -C ./ctest ctest

ctest.clean:
	MODE=debug $(MAKE) -C ./ctest clean
	MODE=release $(MAKE) -C ./ctest clean

