cmake_minimum_required(VERSION 3.27)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/CMake)
include(ExternalProject)

project(RTOS C)
set(CMAKE_C_STANDARD 11)

################################################################################
## Options
option(CPU_ARM_CORTEX_M3 "ARM Cortex-M3 Model" OFF)
option(CPU_ARM_CORTEX_M4 "ARM Cortex-M4 Model" ON)
option(USE_TLSF "USE TLSF Allocator" ON)

################################################################################
## Sub Projects
#add_subdirectory(CPU)
#add_subdirectory(Kernel)
#
#if (USE_TLSF)
#    add_subdirectory(ThirdParty/TLSF-2.4.6)
#    add_dependencies(RTOS-Kernel TLSF)
#endif ()
#
#add_dependencies(RTOS-Kernel RTOS-CPU)
#

#ExternalProject_Add(Proj_CortexM4ContextSwitchDemo
#    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Applications/CortexM4ContextSwitchDemo
#    INSTALL_COMMAND ""
#    CMAKE_GENERATOR Ninja
#    CMAKE_ARGS
#        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_CURRENT_SOURCE_DIR}/CMake/Toolchain/toolchain-arm-gnu.cmake
#        -DCMAKE_MODULE_PATH=${CMAKE_CURRENT_SOURCE_DIR}/CMake
#)
#
#ExternalProject_Add(Proj_CortexM4ContextSwitchDemo2
#        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Applications/CortexM4ContextSwitchDemo2
#        INSTALL_COMMAND ""
#        CMAKE_GENERATOR Ninja
#        CMAKE_ARGS
#        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_CURRENT_SOURCE_DIR}/CMake/Toolchain/toolchain-arm-gnu.cmake
#        -DCMAKE_MODULE_PATH=${CMAKE_CURRENT_SOURCE_DIR}/CMake
#)

ExternalProject_Add(Proj_N32L40xTest
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Applications/N32L40xTest
        DOWNLOAD_COMMAND ""
        INSTALL_COMMAND ""
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
        CMAKE_GENERATOR Ninja
        CMAKE_ARGS
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_CURRENT_SOURCE_DIR}/CMake/Toolchain/toolchain-arm-gnu.cmake
        -DCMAKE_MODULE_PATH=${CMAKE_CURRENT_SOURCE_DIR}/CMake
)
