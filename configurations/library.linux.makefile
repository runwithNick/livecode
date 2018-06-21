###############################################################################
# Linux Shared Library Makefile Template

TYPE_DEFINES=
TYPE_INCLUDES=
TYPE_CCFLAGS=

include ../configurations/common.linux.makefile

###############################################################################
# Customizations

LIBS=$(CUSTOM_LIBS)
STATIC_LIBS=$(CUSTOM_STATIC_LIBS)
DYNAMIC_LIBS=$(CUSTOM_DYNAMIC_LIBS)

LDFLAGS=$(CUSTOM_LDFLAGS) -shared -Xlinker -no-undefined -L$(PRODUCT_DIR)

TARGET_PATH=$(BUILD_DIR)/$(NAME).so

$(TARGET_PATH): $(OBJECTS)
	gcc -o$(TARGET_PATH) $(LDFLAGS) $(OBJECTS) $(addprefix -l,$(LIBS)) -Wl,-Bstatic $(addprefix -l,$(STATIC_LIBS)) -Wl,-Bdynamic $(addprefix -l,$(DYNAMIC_LIBS))

$(NAME).product: $(TARGET_PATH)
	#

.PHONY: $(NAME)
$(NAME):
	echo "*** BUILDING LIBRARY: $(NAME)"
	$(MAKE) -f $(firstword $(MAKEFILE_LIST)) $(NAME).pre
	$(MAKE) -f $(firstword $(MAKEFILE_LIST)) $(NAME).product
