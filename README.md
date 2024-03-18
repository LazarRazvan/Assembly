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
| loop        | *label*         | Used for loop, using ecx register; decrement ecx and check if != 0, jumping at *label* |
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


# data structures

## Structures

### Declaration

Declaration of a structure in assembly has the following rules:

1. **struc *name***
2. declare structure fields
3. **endstruc**

Each filed of the structure has the following rules:

1. label (used to access member; represent the offset in the structure)
2. type specifier
3. number of elements

When declaring structure members we will use pseudo instructions **res**(resb, resw, resd, etc). These are used because, unlike instructions with **d**(db, dw, dd, etc), they are used to reserve uninitialized memory (.bss section).

Example of declaring a structure:
```
; member1 starting at offset 0 and size of 8 bytes (8 * 1 byte)
; member2 starting at offset 8 and size of 16 bytes (8 * 2 bytes)
; member3 starting at offset 24 and size of 16 bytes (4 * 4 bytes)
; member4 starting at offset 40 and size of 2 bytes (2 * 1 byte)

struc teststruct
	member1:    resb 8
	member2:    resw 8
	member3:    resd 4
	member4:    resb 2
endstruc
```

### Initialization

The initialization of a structure is performed in **.data** section using keywords **istruc** and **iend**. Note that for this step directives **d**(db, dw, dd, etc) are required so that memory to be allocatedand should match the data type in structure declaration.

Example of initialize a structure:
```
var_struct:
	istruc teststruct
		at member1, db 1,2,3,4,5,6,7,8
		at member2, dw 301,302,303,304,305,306,307,308
		at member3, dd 100001,100002,100003,100004
		at member4, db 1,2
	iend
```

### Access

Example of accessing structure members:
```
; update member1 of structure at index 2
mov ebx, 1
mov al, 12
mov byte [var_struct + member1 + ebx * 1], al

; update member2 of structure at index 5
mov ebx, 4
mov ax, 400
mov word [var_struct + member2 + ebx * 2], ax

; update member3 of structure at index 0
mov ebx, 0
mov eax, 200001
mov word [var_struct + member3 + ebx * 4], eax
```

## Arrays

### Declaration/Initialization

In order to declare an array in assembly we have two options.

1. Declare and initialize the array (**.data** section)

*times instruction cause the instruction to be assembled multiple times*
```
; declare and initialize an array of 64 elements of byte size with default value of 100
section .data
	array	times 64 db 100
```

2. Declare an unitialized array (**.bss** section)
```
; declare an uninitialize an array of 64 byte
section .bss
	array	resb 64
```

# stack

**The default limit of the stack size on 64-bits architectures is 8MiB.**

## Opeartions

1. The stack can be manipulated using special instructions like **push** and **pop**

```
section .text
	global main

main:
	mov eax, 10
	push eax			; store content of eax on the stack
	pop eax				; restore the content of eax register
```
2. The stack can be manipulated using the register that track the top of the stack, **esp**

```
section .text
	global main

main:
	mov eax, 10
	sub esp, 4			; reserve 4 bytes on the stack
	mov [esp], eax
	add esp, 4			; clear the 4 bytes reserved on the stack
```

**The reason for using *sub* instruction to reserve memory on the stack is that the stack grows to lower memory addresses.**

## Function calls

### Passing the parameters

When talking about a function call, there are two major types of passing the arguments:

1. Using the registers

This is a faster approach because the parameters can be easily accessed using the registers. However, the downside is that the number of registers is limited, and the number of parameters may exceed the number of available registers. Another downside is the fact that the function may alter the register values, so they must be preserved onto the stack."

2. Using the stack

This approach ensure support for as many parameter function require, however is slower than using registers because of the access to memory.


### Call

When performing a function call, the following steps are required:
1. Store the arguments on the stack, in reverse order as the function prototype.
2. Perform **call** instruction.
3. Restore stack state at the end of the call.

**Example:**
For a C function with the following prototype:
```
int my_function(int param1, int param2, int param3)
```

The actual call will be the following:
```
mov eax, [param3]
mov ebx, [param2]
mov ecx, [param1]

; push parameters onto stack in reverse order
push eax
push ebx
push ecx

; perform the call
call my_function

; restore the stack
add esp, 12
```

The **call** instruction is equivalent with the following instructions
```
push eip
jmp my_function
```
Saving the next instruction address (**eip**) is important for the *caller* to know where the execution must continue after the *my_function* ends the execution.

**Preamble**

Given that the function's execution persists within the same stack, it is crucial (though not obligatory) to establish a fresh context for its execution. This is achieved by preserving the old base pointer address (*ebp*) and relocating it to the current stack pointer address (*esp*).

```
push ebp
mov ebp, esp
```

**Epilogue**

Since the callee creates its own context for executing the function, it is his responsibility to restore the stack to its state before the call was made. This is accomplished using the **leave** instruction.  

The end of function execution is carried out using the **ret** instruction, which restores execution by popping the *eip* register from the stack.

**Return value**

To return a value from a function registeres can be used:

1. For 8 bits return values, **al** register is used.
1. For 16 bits return values, **ax** register is used.
1. For 32 bits return values, **eax** register is used.
1. For 64 bits return values, **edx:eax** registers are used.

### Example

Consider a function in C with three arguments and two local variables of type *int*:
```
int my_function(int param1, int param2, int param3)
{
	int localx, localy;

	...
}
```

Caller:

```
;
; Store parameters into registers
;
mov eax, param3
mov ebx, param2
mov ecx, param1

;
; Push parameters in reverse order to stack
;
push eax
push ebx
push ecx

;
; Call the function (note that this will save the eip to stack)
;
call my_function

;
; Cleanup the stack
;
add esp, 12
```

Callee:

```
;
; Preamble
;
push ebp
mov ebp, esp

;
; Function local variables
;
sub esp, 8

;
; Accessing the parameters
;
mov ecx, dword [ebp + 8]			; param1
mov ebx, dword [ebp + 12]			; param2
mov eax, dword [ebp + 16]			; param3

;
; Epilogue
;
leave

ret
```
Stack:

![Stack](https://github.com/LazarRazvan/Assembly/blob/main/stack.png)
