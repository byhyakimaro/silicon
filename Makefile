AS=nasm
ASFLAGS=-f elf64 -I/libs
LDFLAGS=-L/libs
LDLIBS=$(wildcard /libs/*.o)

TARGET=SLCC

all: $(TARGET)

$(TARGET): $(TARGET).asm
	mkdir -p build	
	$(AS) $(ASFLAGS) -o build/$(TARGET).o $(TARGET).asm
	ld -o build/$(TARGET) build/$(TARGET).o

clean:
	rm -rf build

require:
	apt-get update -y && apt-get upgrade -y
	apt install -y nasm binutils