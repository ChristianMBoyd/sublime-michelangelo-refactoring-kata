# sublime-michelangelo-refactoring-kata

A long-term refactoring exercise from ASM/C to modern C++ on an embedded platform.

## Getting started

This repo has external dependencies that are not provided as part of this coding exercise.

### Your sm64 reference ROM

The assets required to compile a working sm64 ROM are not provided as part of this refactoring.  A working sm64 ROM (currently US only) must be provided at `baserom/baserom.us.z64` for compilation to succeed.

### The reference code

The following make target will bring in the required dependencies under the `deps/` directory.

```bash
make download-deps
```

## Building the ROM

The following make target utilizes docker for the compilation environment.

```bash
make build-from-deps
```
