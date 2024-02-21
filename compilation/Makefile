##############################################################################
CC = gcc
LD = $(CC)
CFLAGS = -Wall -Wextra -O0 -g


###############################################################################
# Build

all: main

main: main.o
	@echo "Perform linker..."
	$(CC) $(CFLAGS) $< -o $@

main.o: main.s
	@echo "Perform assembler..."
	$(CC) $(CFLAGS) -c $< -o $@

main.s: main.i
	@echo "Perform compile..."
	$(CC) $(CFLAGS) -S $< -o $@

main.i: main.c
	@echo "Perform pre-processing..."
	$(CC) $(CFLAGS) -E $< -o $@


###############################################################################
# Inspect object and executable files symbols using nm.
# 
# -d: unexported symbol in .data section
# -t: unexported symbol in .text section
# -r: unexported read-only symbol in .ro-data section
# -b: unexported uninitialized symbol in .bss section
# -D: exported symbol in .data section
# -T: exported symbol in .text section
# -R: exported read-only symbol in .ro-data section
# -B: unexported uninitialized symbol in .bss section
#
# -U: undefined symbol (used in current module but defined in another module)

info_simbols_obj: main.o
	nm $<

info_simbols_exe: main
	nm $<


###############################################################################
# TODO: readelf and objdump.


###############################################################################
clean:
	rm -f main.i main.s main.o main
