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
