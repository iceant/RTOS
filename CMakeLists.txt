cmake_minimum_required(VERSION 3.27)
project(RTOS C)

set(CMAKE_C_STANDARD 11)

################################################################################
## Options
option(CPU_ARM_CORTEX_M3 "ARM Cortex-M3 Model" OFF)
option(CPU_ARM_CORTEX_M4 "ARM Cortex-M4 Model" ON)
option(USE_TLSF "USE TLSF Allocator" ON)

################################################################################
## Sub Projects
add_subdirectory(CPU)
add_subdirectory(Kernel)

if (USE_TLSF)
    add_subdirectory(ThirdParty/TLSF-2.4.6)
    add_dependencies(RTOS-Kernel TLSF)
endif ()

add_dependencies(RTOS-Kernel RTOS-CPU)

