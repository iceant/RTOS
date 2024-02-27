cmake_minimum_required(VERSION 3.6)
project(N32L40xTest C)
enable_language(ASM)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake)
include(utils)

########################################################################################################################
####
option(CPU_ARM_CORTEX_M4 "Use ARM Cortex-M4 CPU" ON)
option(USE_TLSF "Use TLSF Memory Allocator" ON)
add_definitions(-DCPU_TICKS_PER_SECOND=100 -DOS_IDLE_THREAD_TIME_SLICE -D__FPU_PRESENT=1)
########################################################################################################################
####

set(DRIVER_HOME ${CMAKE_CURRENT_SOURCE_DIR}/../../Drivers)

add_subdirectory(../../ThirdParty/N32L40x ${CMAKE_CURRENT_BINARY_DIR}/ThirdParty/N32L40X)
add_subdirectory(../../ThirdParty/TLSF-2.4.6 ${CMAKE_CURRENT_BINARY_DIR}/ThirdParty/TLSF-2.4.6)
add_subdirectory(../../Kernel ${CMAKE_CURRENT_BINARY_DIR}/Kernel)
add_subdirectory(../../CPU ${CMAKE_CURRENT_BINARY_DIR}/CPU)
add_subdirectory(../../SDK ${CMAKE_CURRENT_BINARY_DIR}/SDK)
add_subdirectory(../../Drivers/ ${CMAKE_CURRENT_BINARY_DIR}/Drivers)
########################################################################################################################
####

file(GLOB SOURCES *.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB DRIVER_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/drivers/*.c)
foreach (item IN LISTS DRIVER_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_executable(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES} ${DRIVER_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/drivers)
target_link_libraries(${PROJECT_NAME}
        PUBLIC n32l40x
        PUBLIC RTOS-Kernel
        PUBLIC RTOS-SDK
)

firmware_size(${PROJECT_NAME} sysv)
generate_object(${PROJECT_NAME} .bin binary)

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    generate_object(${PROJECT_NAME} .hex ihex)
endif()
