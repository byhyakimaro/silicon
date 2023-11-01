AS=nasm
ASFLAGS=-f elf64
TARGET=SLCC

all: $(TARGET)

$(TARGET): $(TARGET).asm
	$(AS) $(ASFLAGS) -o build/$(TARGET).o $(TARGET).asm
	ld -o build/$(TARGET) build/$(TARGET).o

clean:
	rm -f build/$(TARGET).o build/$(TARGET)

require:
	apt-get update -y && apt-get upgrade -y
	apt install -y nasm binutils