cmake_minimum_required(VERSION 3.6)
project(N32G45x C)
enable_language(ASM)

include(FetchContent)
FetchContent_Declare(
        N32G457_SDK
        URL        ftp://download.nationstech.com/1-Microcontrollers/N32G457xx_V3.1.0.zip
        SOURCE_DIR N32G457_SDK
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(N32G457_SDK)

message(STATUS "N32G457_SDK_SOURCE_DIR: ${n32g457_sdk_SOURCE_DIR}")

set(N32G457_SOURCE_DIR "${n32g457_sdk_SOURCE_DIR}/6-Software Development Kit/Nationstech.N32G45x_Library.2.2.0")
set(N32G457_INCLUDE_DIR
        ${N32G457_SOURCE_DIR}/firmware/CMSIS/core
        ${N32G457_SOURCE_DIR}/firmware/CMSIS/device
        ${N32G457_SOURCE_DIR}/firmware/n32g45x_std_periph_driver/inc
)
file(GLOB N32G457_STD_PERIPH_DRIVER_SOURCES ${N32G457_SOURCE_DIR}/firmware/n32g45x_std_periph_driver/src/*.c)
file(GLOB N32G457_CMSIS_SOURCES ${N32G457_SOURCE_DIR}/firmware/CMSIS/device/*.c)

message(STATUS "CMAKE_C_COMPILER_ID: ${CMAKE_C_COMPILER_ID}")

add_library(${PROJECT_NAME} "")

if(CMAKE_C_COMPILER_ID MATCHES GNU)
    list(APPEND N32G457_CMSIS_SOURCES ${N32G457_SOURCE_DIR}/firmware/CMSIS/device/startup/startup_n32g45x_gcc.s)
    set(LINKER_FILE "${N32G457_SOURCE_DIR}/firmware/CMSIS/device/n32g45x_flash.ld")

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

set(N32G457_SOURCE_DIR ${N32G457_STD_PERIPH_DRIVER_SOURCES} ${N32G457_CMSIS_SOURCES})

foreach (item IN LISTS N32G457_SOURCE_DIR)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

target_sources(${PROJECT_NAME} PUBLIC ${N32G457_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${N32G457_INCLUDE_DIR})
target_compile_options(${PROJECT_NAME} PUBLIC ${CPU_FLAGS} ${COMPILER_FLAGS})
target_compile_definitions(${PROJECT_NAME} PUBLIC USE_STDPERIPH_DRIVER N32G45X __FPU_PRESENT=1)

