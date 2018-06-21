###############################################################################
# Linux Static Library Makefile Template

TYPE_DEFINES=
TYPE_INCLUDES=
TYPE_CCFLAGS=

include ../configurations/common.linux.makefile

###############################################################################
# Customizations

TARGET_PATH=$(BUILD_DIR)/$(NAME).a

$(TARGET_PATH): $(OBJECTS)
	ar rc $(TARGET_PATH) $(OBJECTS)

$(NAME).product: $(TARGET_PATH)
	#

.PHONY: $(NAME)
$(NAME):
	echo "*** BUILDING ARCHIVE: $(NAME)"
	$(MAKE) -f $(firstword $(MAKEFILE_LIST)) $(NAME).pre
	$(MAKE) -f $(firstword $(MAKEFILE_LIST)) $(NAME).headers
	$(MAKE) -f $(firstword $(MAKEFILE_LIST)) $(NAME).product
