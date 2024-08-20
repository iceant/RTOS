cmake_minimum_required(VERSION 3.28)
project(RTOS_V2 C)

set(CMAKE_C_STANDARD 11)

set(CPU_MODEL ARM-Cortex-M4)

add_subdirectory(Kernel)
