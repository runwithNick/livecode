# Common template Makefile for all types

ifeq ($(MODE),)
	MODE=debug
endif

BUILD_DIR=../_build/$(MODE)
CACHE_DIR=../_cache/$(MODE)/$(NAME)
HEADER_DIR=$(BUILD_DIR)/headers
PRODUCT_DIR=$(BUILD_DIR)

DEFINES=$(CUSTOM_DEFINES) $(TYPE_DEFINES) _LINUX

ifeq ($(MODE),debug)
	DEFINES+=_DEBUG
else
	DEFINES+=_RELEASE NDEBUG
endif

INCLUDES=$(CUSTOM_INCLUDES) $(TYPE_INCLUDES) $(HEADER_DIR)

ifeq ($(MODE),release)
	CCFLAGS=$(CUSTOM_CCFLAGS) $(TYPE_CCFLAGS) -O2 -g -Wall
else
	CCFLAGS=$(CUSTOM_CCFLAGS) $(TYPE_CCFLAGS) -g -Wall
endif

OBJECTS=$(addprefix $(CACHE_DIR)/, $(addsuffix .o, $(basename $(SOURCES)))) $(CUSTOM_OBJECTS)

VPATH=./src $(addprefix ./src/,$(SOURCE_DIRS)) $(CACHE_DIR) $(BUILD_DIR)

$(CACHE_DIR)/%.o: %.cpp
	gcc $(CCFLAGS) $(addprefix -I,$(INCLUDES)) $(addprefix -D,$(DEFINES)) -c -o$(CACHE_DIR)/$*.o ./src/$*.cpp

$(CACHE_DIR)/%.o: %.c
	gcc $(CCFLAGS) $(addprefix -I,$(INCLUDES)) $(addprefix -D,$(DEFINES)) -c -o$(CACHE_DIR)/$*.o ./src/$*.c

.PHONY: $(NAME).pre
$(NAME).pre:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(CACHE_DIR) $(addprefix $(CACHE_DIR)/,$(SOURCE_DIRS))
	mkdir -p $(HEADER_DIR)

clean:
	rm -f $(OBJECTS)
	rm -f $(TARGET_PATH)
