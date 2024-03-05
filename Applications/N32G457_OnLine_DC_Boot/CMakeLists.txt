cmake_minimum_required(VERSION 3.6)
project(N32G457_OnlineDCBoot C)
enable_language(ASM)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake)
include(utils)

########################################################################################################################
####
option(CPU_ARM_CORTEX_M4 "Use ARM Cortex-M4 CPU" ON)
option(USE_TLSF "Use TLSF Memory Allocator" ON)

add_definitions(
        -DCPU_TICKS_PER_SECOND=100
        -DOS_IDLE_THREAD_TIME_SLICE
        -D__FPU_PRESENT=1
        -DSYSCLK_SRC=SYSCLK_USE_HSE_PLL
        -DHSE_VALUE=25000000
        -DSYSCLK_FREQ=100000000
        -DPLLSRC_DIV=1
        -DPLL_MUL=4
)

#add_definitions(
#        -DCPU_TICKS_PER_SECOND=100
#        -DSYSCLK_SRC=SYSCLK_USE_HSE_PLL
#        -DHSE_VALUE=8000000
#        -DSYSCLK_FREQ=144000000
#)



########################################################################################################################
####

set(DRIVER_HOME ${CMAKE_CURRENT_SOURCE_DIR}/../../Drivers)

add_subdirectory(../../ThirdParty/N32G45x ${CMAKE_CURRENT_BINARY_DIR}/ThirdParty/N32G45x)
add_subdirectory(../../ThirdParty/TLSF-2.4.6 ${CMAKE_CURRENT_BINARY_DIR}/ThirdParty/TLSF-2.4.6)
add_subdirectory(../../Kernel ${CMAKE_CURRENT_BINARY_DIR}/Kernel)
add_subdirectory(../../CPU ${CMAKE_CURRENT_BINARY_DIR}/CPU)
add_subdirectory(../../SDK ${CMAKE_CURRENT_BINARY_DIR}/SDK)
########################################################################################################################
####

file(GLOB SOURCES *.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB HARDWARE_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/hardware/*.c)
foreach (item IN LISTS HARDWARE_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB DEVICES_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/devices/*.c)
foreach (item IN LISTS DEVICES_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_executable(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME}
        PUBLIC ${SOURCES}
        PUBLIC ${HARDWARE_SOURCES}
        PUBLIC ${DEVICES_SOURCES}
)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/hardware)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/devices)
target_link_libraries(${PROJECT_NAME}
        PUBLIC N32G45x
        PUBLIC RTOS-Kernel
        PUBLIC RTOS-SDK
)

firmware_size(${PROJECT_NAME} sysv)
generate_object(${PROJECT_NAME} .bin binary)

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    generate_object(${PROJECT_NAME} .hex ihex)
endif()


