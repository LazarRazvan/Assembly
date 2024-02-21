# Assembly
Kickstart into assembly language programming.

# compilation

This repository serves as a guide for understanding the compilation process using GCC (GNU Compiler Collection). Here, we discuss the various stages of compilation including preprocessing, compilation, assembly, and linking, along with explanations of the associated flags. Additionally, we provide information on utilities that can be used to explore the content of object files and executable files generated during the compilation process.

## Compilation Process Overview

The compilation process typically consists of several stages:

1. **Preprocessing**: In this stage, the preprocessor resolves directives such as `#include`, `#define`, and `#ifdef`. The output of this stage is often referred to as the "preprocessed" code.

2. **Compilation**: The compiler translates the preprocessed code (usually in C/C++ or another source language) into assembly code specific to the target architecture.

3. **Assembly**: The assembly code is translated into machine code (binary) by the assembler.

4. **Linking**: Finally, the linker combines object files generated during compilation along with any necessary libraries to produce an executable file.

## Compilation Flags

### GCC Flags

- `-E`: Stop after the preprocessing stage, outputting the preprocessed code.
- `-S`: Stop after the compilation stage, outputting the assembly code.
- `-c`: Stop after the compilation stage, outputting object files (.o files) without linking.
- `-o <output>`: Specify the output file name.

Inspect Makefile content that expose the usage of specific gcc flags.


# introduction

## Registers

### Base registers (32 bits)

| Register | Description                                                  |
|----------|--------------------------------------------------------------|
| EAX      | Accumulator; arithmetic                                      |
| EBX      | Base register                                                |
| ECX      | Counter                                                      |
| EDX      | Data register                                                |
| ESI      | Source in string operations                                  |
| EDI      | Destination in string operations                             |
| EBP      | Base pointer; keep the current stack frame                   |
| ESP      | Stack pointer; points to the top of the stack                |

### EIP (instruction pointer)

The registers stores the address of the instruction that has to be executed next. Note that it cannot be altered directly by user, but using custom instructions like **jump**, **call**, **ret**.

### EFLAGS (state registers)

| Register | Description                                                  |
|----------|--------------------------------------------------------------|
| CF       | Set if the result exceed max/min value for unsigned          |
| PF       | Set if result low byte has an even number of 1 bits          |
| AF       |                                                              |
| ZF       | Set if the result is 0                                       |
| SF       | Same as result sign bit                                      |
| OF       | Same as **CF** but for signed                                |


### Registers subsections

**EAX**
* AL [0:7]		8 bits register
* AH [8:15]		8 bits register
* AX [0:15]		16 bits register
 
**EBX**
* BL [0:7]		8 bits register
* BH [8:15]		8 bits register
* BX [0:15]		16 bits register
 
**ECX**
* CL [0:7]		8 bits register
* CH [8:15]		8 bits register
* CX [0:15]		16 bits register
 
**EDX**
* DL [0:7]		8 bits register
* DH [8:15]		8 bits register
* DX [0:15]		16 bits register
 
**ESI**
* SI [0:15]		16 bits register
 
**EDI**
* DI [0:15]		16 bits register
 
**EBP**
* BP [0:15]		16 bits register
 
**ESP**
* SP [0:15]		16 bits register
 

## Instructions

### Basic instructions

| Instruction | Operands        | Description                                                                            |
|-------------|-----------------|----------------------------------------------------------------------------------------|
| push        | src             | Move src value to the top of the stack                                                 |
| pop         | dst             | Move value from top of the stack to dst                                                |
| mov         | dst, src        | Move src value to dst                                                                  |
| lea         | dst, src        | Move src address to dst                                                                |
| xchg        | dst, src        | Exchange values from src and dst                                                       |
| -           | -               | -                                                                                      |
| add         | dst, src        | Add src and dst and store result in dst                                                |
| sub         | dst, src        | Subtract src from dst and store result in dst                                          |
| and         | dst, src        | Bitwise and between src and dst; store result in dst                                   |
| shl         | dst, src        | Left shift bits in destinations by src bits                                            |
| shr         | dst, src        | Right shift bits in destinations by src bits                                           |
| -           | -               | -                                                                                      |
| cmp         | dst, src        | Compare src and dst, by subtracting src from dst                                       |
| test        | dst, src        | Compare src and dst, by performing bitwise AND (efficient in compare with 0)           |
| call        | *addr*          | Call function at a specific address                                                    |
| jmp         | *addr*          | Unconditional jump to a specific address                                               |
| je/jz       | *addr*          | **signed/unsigned** Equal or zero conditional jump to a specific address (ZF)          |
| jne/jnz     | *addr*          | **signed/unsigned** Not equal or zero conditional jump to a specific address (ZF)      |
| jg/jnle     | *addr*          | **signed** Greater or not less equal conditional jump to a specific address (OF,SF,ZF) |
| jge/jnl     | *addr*          | **signed** Greater equal or not less conditional jump to a specific address (OF,SF)    |
| jl/jnge     | *addr*          | **signed** Less or not greater equal conditional jump to a specific address (OF,SF)    |
| jle/jng     | *addr*          | **signed** Less equal or not greater conditional jump to a specific address (OF,SF,ZF) |
| ja/jnbe     | *addr*          | **unsigned** Above or not below equal conditional jump to a specific address (CF,ZF)   |
| jae/jnb     | *addr*          | **unsigned** Above equal or not below conditional jump to a specific address (CF)      |
| jb/jnae     | *addr*          | **unsigned** Below or not above equal conditional jump to a specific address (CF)      |
| jbe/jna     | *addr*          | **unsigned** Below equal or not above conditional jump to a specific address (AF,CF)   |

## Sections

| Section   | Description                                                                |
|-----------|----------------------------------------------------------------------------|
| .bss      | Where variables that are not initialized are kept and no space is required |
| .data     | Where variables that are intialized are kept                               |
| .rodata   | Where read-only variables are kept                                         |

## Dimension directives

| Directive | Description                   |
|-----------|-------------------------------|
| DB        | Define byte (1 byte)          |
| DW        | Define word (2 bytes)         |
| DD        | Define double word (4 bytes)  |
| DQ        | Define quad word (8 bytes)    |


## Memory addressing

| Instruction                | Description                                                                          |
|----------------------------|--------------------------------------------------------------------------------------|
| mov eax, [0x123456]        | Direct addressing; move value from address 0x123456 to eax register                  |
| mov eax, [ebx]             | Indirect addressing; move value from address stored by ebx to eax register           |
| mov eax, [ebx-4]           | Based addressing; move value from address stored by ebx -4 to eax register           |
| mov eax, [ebx\*16 + 32]    | Indexed addressing; move value from address stored by ebx \* 16 + 32 to eax register |

**When computing an address, two registers cannot be subtracted**
**When computing an address, at most two registers can be used**
