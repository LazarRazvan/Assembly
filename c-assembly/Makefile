##############################################################################
CC = gcc
AS = nasm
CFLAGS = -Wall -Wextra -O0 -g -m32 -fno-pic
ASFLAGS = -g -f elf32
LDFLAGS = -fno-pie -m32


###############################################################################
# Sources
CC_SRC = $(wildcard *.c)
ASM_SRC = $(wildcard *.asm)

# Objects
CC_OBJ = $(CC_SRC:.c=.o)
ASM_OBJ = $(ASM_SRC:.asm=.o)

# Executable
EXEC = $(ASM_SRC:.asm=)


###############################################################################
.PHONY: all clean


all: min

min: minc.o minasm.o
	$(CC) $(LDFLAGS) $^ -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(EXEC) $(ASM_OBJ) $(CC_OBJ)
