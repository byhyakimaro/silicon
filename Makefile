AS=nasm
ASFLAGS=-f elf64 -g

BUILD_DIR=build
TARGET=SLCC

all: $(TARGET)

$(TARGET): $(TARGET).asm | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $(BUILD_DIR)/$(TARGET).o $(TARGET).asm
	$(AS) $(ASFLAGS) -o $(BUILD_DIR)/libs.o $(wildcard libs/*.asm)
	ld -o $(BUILD_DIR)/$(TARGET) $(BUILD_DIR)/$(TARGET).o $(BUILD_DIR)/libs.o

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf build

gdb:
	gdb $(BUILD_DIR)/$(TARGET)

require:
	apt-get update -y && apt-get upgrade -y
	apt install -y nasm binutils