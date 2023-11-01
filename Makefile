AS=nasm
ASFLAGS=-f elf64
TARGET=SLCC

all: $(TARGET)

$(TARGET): $(TARGET).asm
	$(AS) $(ASFLAGS) -o $(TARGET).o $(TARGET).asm
	ld -o $(TARGET) $(TARGET).o

clean:
	rm -f $(TARGET).o $(TARGET)

require:
	apt-get update -y && apt-get upgrade -y
	apt install -y nasm binutils