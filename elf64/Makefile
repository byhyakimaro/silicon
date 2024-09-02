AS=fasm

BUILD_DIR=build
TARGET=core
O_EXIT=asc

all: $(TARGET)

$(TARGET): $(TARGET).asm | $(BUILD_DIR)
	$(AS) $(TARGET).asm $(BUILD_DIR)/$(O_EXIT) && chmod +x $(BUILD_DIR)/$(O_EXIT)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

gdb:
	gdb -batch -ex "run" $(BUILD_DIR)/$(O_EXIT)

require:
	apt-get update -y && apt-get upgrade -y
	apt install -y binutils fasm gdb