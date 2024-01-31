cmake_minimum_required(VERSION 3.6)
project(n32l40x C)
enable_language(ASM)

include(FetchContent)
FetchContent_Declare(
        n32l40x_sdk
        URL        ftp://download.nationstech.com/1-Microcontrollers/N32L40xxx_V2.2.0.zip
        SOURCE_DIR n32l40x_sdk
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(n32l40x_sdk)

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

add_library(${PROJECT_NAME} "")

if(CMAKE_C_COMPILER_ID MATCHES GNU)
    list(APPEND N32L40x_CMSIS_SOURCES ${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/startup/startup_n32l40x_gcc.s)
    set(LINKER_FILE "${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/n32l40x_flash.ld")

    file(READ ${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/startup/startup_n32l40x_gcc.s TEXT)
    string(REPLACE "\n* Amount of memory" "\n/* Amount of memory" TEXT ${TEXT})
    file(WRITE ${N32L40X_SOURCE_DIR}/firmware/CMSIS/device/startup/startup_n32l40x_gcc.s "${TEXT}")

    set(CPU_FLAGS  -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16)
    set(COMPILER_FLAGS
            -fmessage-length=0
            -ffunction-sections
            -fdata-sections
            -fno-common
#            -fshort-enums
#            -ffreestanding
#            -ffunction-sections
#            -fdata-sections
#            -fsigned-char
#            -fmessage-length=0
#            -fshort-enums
    )
    set(LINK_FLAGS -lc -lm -Wl,--gc-sections
            -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map -Wl,--cref -Wl,--print-memory-usage
            -specs=nano.specs
#            -specs=nosys.specs -lnosys
    )
#    add_compile_options(${CPU_FLAGS} ${COMPILER_FLAGS})
#    add_link_options(${CPU_FLAGS} -T${LINKER_FILE})
    target_link_options(${PROJECT_NAME} PUBLIC ${CPU_FLAGS} -T${LINKER_FILE} ${LINK_FLAGS})
endif ()

set(N32L40X_SOURCES ${N32L40X_STD_PERIPH_DRIVER_SOURCES} ${N32L40x_CMSIS_SOURCES})

foreach (item IN LISTS N32L40X_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

target_sources(${PROJECT_NAME} PUBLIC ${N32L40X_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${N32L40X_INCLUDE_DIR})
target_compile_options(${PROJECT_NAME} PUBLIC ${CPU_FLAGS} ${COMPILER_FLAGS})
target_compile_definitions(${PROJECT_NAME} PUBLIC USE_STDPERIPH_DRIVER N32L40X __FPU_PRESENT=1)

