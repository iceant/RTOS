cmake_minimum_required(VERSION 3.6)
project(N32L40xTest C)
enable_language(ASM)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake)
include(utils)

########################################################################################################################
####
option(CPU_ARM_CORTEX_M4 "Use ARM Cortex-M4 CPU" ON)
option(USE_TLSF "Use TLSF Memory Allocator" ON)
add_definitions(-DCPU_TICKS_PER_SECOND=100 -D__FPU_PRESENT=1)
########################################################################################################################
####

add_subdirectory(../../ThirdParty/N32L40x ${CMAKE_CURRENT_BINARY_DIR}/ThirdParty/N32L40X)
add_subdirectory(../../ThirdParty/TLSF-2.4.6 ${CMAKE_CURRENT_BINARY_DIR}/ThirdParty/TLSF-2.4.6)
add_subdirectory(../../Kernel ${CMAKE_CURRENT_BINARY_DIR}/Kernel)
add_subdirectory(../../CPU ${CMAKE_CURRENT_BINARY_DIR}/CPU)

########################################################################################################################
####

file(GLOB SOURCES *.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_executable(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_link_libraries(${PROJECT_NAME}
        PUBLIC n32l40x
        PUBLIC RTOS-Kernel
)

firmware_size(${PROJECT_NAME} sysv)
generate_object(${PROJECT_NAME} .bin binary)

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    generate_object(${PROJECT_NAME} .hex ihex)
endif()
