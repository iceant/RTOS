cmake_minimum_required(VERSION 3.6)
project(RTOS-CPU C)
enable_language(ASM)

set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/cpu.c)
set(CPU_INCLUDE_DIR "")

if(CPU_ARM_CORTEX_M3)
    list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM3/cpu_port.c)
    set(CPU_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM3/)
endif ()

if(CPU_ARM_CORTEX_M4)
    list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM4/cpu_port.c
            ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM4/HardFaultHandler.c
            ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM4/SVCHandler.c
    )
    set(CPU_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM4/)
endif ()

if(CMAKE_C_COMPILER_ID MATCHES GNU)
    list(APPEND SOURCES
            ${CMAKE_CURRENT_SOURCE_DIR}/ARM/CortexM4/cpu_gcc.s
    )
endif ()

set(CPU_INCLUDE_DIR ${CPU_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}  CACHE STRING "" FORCE)
set(CPU_SOURCES ${SOURCES} CACHE STRING "" FORCE)

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

include_directories(${CPU_INCLUDE_DIR})
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
#target_include_directories(${PROJECT_NAME} PUBLIC ${CPU_INCLUDE_DIR})




