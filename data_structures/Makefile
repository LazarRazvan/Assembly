##############################################################################
CC = gcc
AS = nasm
CFLAGS = -Wall -Wextra -O0 -g -m32 -fno-pic
ASFLAGS = -g -f elf32
LDFLAGS = -fno-pie -m32


###############################################################################
# Sources
ASM_SRC = $(wildcard *.asm)

# Objects
ASM_OBJ = $(ASM_SRC:.asm=.o)

# Executable
EXEC = $(ASM_SRC:.asm=)


###############################################################################
.PHONY: all clean


all: $(EXEC)

%: %.o
	$(CC) $(LDFLAGS) $^ -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f $(EXEC) $(ASM_OBJ)
