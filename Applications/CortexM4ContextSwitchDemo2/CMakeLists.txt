cmake_minimum_required(VERSION 3.6)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake)
include(utils)

include(FetchContent)
FetchContent_Declare(
        n32l40x_sdk
        URL "ftp://download.nationstech.com/1-Microcontrollers/N32L40xxx_V2.2.0.zip"
        SOURCE_DIR n32l40x_sdk
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(n32l40x_sdk)

########################################################################################################################

project(CortexM4ContextSwitchDemo2 C)
enable_language(ASM)

message(STATUS "n32l40x_sdk_SOURCE_DIR: ${n32l40x_sdk_SOURCE_DIR}")

set(N32L40X_SOURCE_DIR "${n32l40x_sdk_SOURCE_DIR}/6-Software Development Kit/Nationstech.N32L40x_Library.1.2.2")
set(N32L40X_INCLUDE_DIR
        ${N32L40X_SOURCE_DIR}/firmware/CMSIS/core
        ${N32L40X_SOURCE_DIR}/firmware/CMSIS/device
        ${N32L40X_SOURCE_DIR}/firmware/n32l40x_std_periph_driver/inc
)
file(GLOB N32L40X_STD_PERIPH_DRIVER_SOURCES ${N32L40X_SOURCE_DIR}/firmware/n32l40x_std_periph_driver/src/*.c)
file(GLOB N32L40x_CMSIS_SOURCES ${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/*.c)

message(STATUS "CMAKE_C_COMPILER_ID: ${CMAKE_C_COMPILER_ID}")
if(CMAKE_C_COMPILER_ID MATCHES GNU)
    list(APPEND N32L40x_CMSIS_SOURCES ${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/startup/startup_n32l40x_gcc.s)
endif ()
set(N32L40X_SOURCES ${N32L40X_STD_PERIPH_DRIVER_SOURCES} ${N32L40x_CMSIS_SOURCES})
set(LINKER_FILE "${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/n32l40x_flash.ld")

########################################################################################################################
set(CPU_ARM_CORTEX_M4 ON)
set(USE_TLSF ON)

set(RTOS_KERNEL_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../Kernel)
set(TLSF_PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../ThirdParty/TLSF-2.4.6)
set(RTOS_CPU_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../CPU)

add_subdirectory(${RTOS_KERNEL_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}/RTOS-Kernel)
add_subdirectory(${RTOS_CPU_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}/RTOS-CPU)
add_subdirectory(${TLSF_PROJECT_DIR} ${CMAKE_CURRENT_BINARY_DIR}/TLSF)

include_directories(${CPU_INCLUDE_DIR})
include_directories(${RTOS_KERNEL_INCLUDE_DIR})

########################################################################################################################
set(CPU_FLAGS -mthumb -mtune=cortex-m4 -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16)
#add_definitions(-DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -D__FPU_PRESENT=1)

set(COMPILER_FLAGS
        -ffreestanding
        -ffunction-sections
        -fdata-sections
        -fsigned-char
        -fmessage-length=0
        -fshort-enums)
add_compile_options(${CPU_FLAGS} ${COMPILER_FLAGS})
add_link_options(${CPU_FLAGS})
add_definitions(-DUSE_STDPERIPH_DRIVER -DN32L40X)

file(GLOB SOURCES *.c)
set(SOURCES ${SOURCES} ${N32L40X_SOURCES} ${CPU_SOURCES} ${RTOS_KERNEL_SOURCES})

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCES: ${item}")
endforeach ()

########################################################################################################################
add_executable(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_include_directories(${PROJECT_NAME}
    PUBLIC ${N32L40X_INCLUDE_DIR}
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
    PUBLIC ${CPU_INCLUDE_DIR}
    PUBLIC ${RTOS_KERNEL_INCLUDE_DIR}
)
target_link_options(${PROJECT_NAME} PRIVATE -Wl,--gc-sections -Wl,-T ${LINKER_FILE})


firmware_size(${PROJECT_NAME} sysv)
generate_object(${PROJECT_NAME} .bin binary)

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    generate_object(${PROJECT_NAME} .hex ihex)
endif()

