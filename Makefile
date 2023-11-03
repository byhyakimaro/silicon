AS=nasm
ASFLAGS=-f elf64 -g

BUILD_DIR=build
TARGET=kernel
O_EXIT=slcc

LIB_ASM_FILES=$(wildcard libs/*.asm)
LIB_OBJ_FILES=$(patsubst libs/%.asm,$(BUILD_DIR)/%.o,$(LIB_ASM_FILES))

all: $(TARGET)

$(TARGET): $(TARGET).asm $(LIB_OBJ_FILES) | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $(BUILD_DIR)/$(TARGET).o $(TARGET).asm
	ld -o $(BUILD_DIR)/$(O_EXIT) $(BUILD_DIR)/$(TARGET).o $(LIB_OBJ_FILES)

$(LIB_OBJ_FILES): $(BUILD_DIR)/%.o : libs/%.asm | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

gdb:
	gdb $(BUILD_DIR)/$(O_EXIT)

require:
	apt-get update -y && apt-get upgrade -y
	apt install -y nasm binutils