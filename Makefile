CC := clang
LD := clang
CFLAGS := $(CFLAGS) -DHAVE_CONFIG_H -ILibraries/include -ILibraries/libimobiledevice -ILibraries/libimobiledevice/common -ILibraries/libimobiledevice/include -flto -O3 -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function

# path macros
BUILD_PATH := build

# compile macros
TARGET_NAME := jitterbugpair
ifeq ($(OS),Windows_NT)
	TARGET_NAME := $(addsuffix .exe,$(TARGET_NAME))
endif
TARGET := $(BUILD_PATH)/$(TARGET_NAME)

# src files & obj files
SRC := JitterbugPair/main.c Libraries/libimobiledevice/common/debug.c Libraries/libimobiledevice/common/userpref.c Libraries/libimobiledevice/common/utils.c
OBJ := $(addsuffix .o, $(basename $(SRC)))

# default rule
default: all

# non-phony targets
$(TARGET): $(OBJ)
	$(LD) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.c*
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_PATH)/%.c: $(SRC)
	mkdir -p $(BUILD_PATH) || true
	cp $^ $(BUILD_PATH)/

# phony rules
.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	@echo CLEAN $(CLEAN_LIST)
	@rm -rf $(BUILD_PATH)
