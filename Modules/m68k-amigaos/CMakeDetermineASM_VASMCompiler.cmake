SET(ASM_DIALECT "_VASM")
FIND_PROGRAM(VASM vasmm68k_mot)
if (VASM)
	message("CMakeDetermineASM_VASMCompiler.cmake ${VASM}")
        # Hack to use VASM to compile the assembly code
        set(CMAKE_ASM_VASM_COMPILER_ENV_VAR ${CMAKE_ASM_COMPILER_ENV_VAR}" " CACHE STRING FORCE)
        set(CMAKE_ASM_VASM_COMPILER ${VASM} CACHE STRING FORCE)
        set(CMAKE_ASM_VASM_OUTPUT_EXTENSION ".o" CACHE STRING FORCE)
        set(CMAKE_ASM_VASM_COMPILE_OBJECT "<CMAKE_ASM_VASM_COMPILER> <FLAGS> -o <OBJECT> <SOURCE>" CACHE STRING FORCE)
        set(CMAKE_ASM_VASM_FLAGS "-devpac -Fhunk" CACHE STRING FORCE)
else ()
        message(ERROR "Could not find vasmm68k_mot! It is required to compile this library!")
endif ()
INCLUDE(CMakeDetermineASMCompiler)
SET(ASM_DIALECT)
