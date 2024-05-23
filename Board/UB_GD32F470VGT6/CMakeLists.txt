cmake_minimum_required(VERSION 3.10)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../CMake/arm-armcc-toolchain.cmake)

project(UB_GD32F470VGT6 C)
enable_language(ASM)

########################################################################################################################
## Options


########################################################################################################################
## Definitions
add_definitions(-DGD32F470)
add_definitions(-DUSE_STDPERIPH_DRIVER)
add_definitions(-DHXTAL_VALUE=12000000)
add_definitions(-D__MICROLIB)
add_definitions(-DNDEBUG)

set(CMAKE_OBJCOPY_CPU_NAME Cortex-M4)
set(CPU_MODEL "ARM_CortexM4")
set(CPU_FACTORY_TYPE GD32F470)

set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} --c99 --gnu -c --cpu Cortex-M4.fp.sp -g -W -O0 --cpu Cortex-M4.fp.sp --apcs=interwork --split_sections")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} --cpu Cortex-M4.fp.sp -g --apcs=interwork --pd \"__MICROLIB SETA 1\" --pd \"__UVISION_VERSION SETA 538\" --pd \"GD32F470 SETA 1\" --xref ")
add_link_options(--cpu Cortex-M4.fp.sp --library_type=microlib --strict --scatter "${CMAKE_CURRENT_SOURCE_DIR}/ARMCC/link.sct" --summary_stderr --info summarysizes --map --xref --callgraph --symbols )

include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/Application)
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/Board)
########################################################################################################################
## Firmware
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Firmware/GD32F4xx ${CMAKE_CURRENT_BINARY_DIR}/Firmware/GD32F4xx)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Kernel ${CMAKE_CURRENT_BINARY_DIR}/Kernel)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../SDK ${CMAKE_CURRENT_BINARY_DIR}/SDK)

########################################################################################################################
## Devices


## ---------------------------------------------------------------------------------------------------- ##
## ---- A7670C

file(GLOB A7670C_ROOT_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/*.c)
file(GLOB A7670C_COMMON_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/Common/*.c)
file(GLOB A7670C_HTTP_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/HTTP/*.c)
file(GLOB A7670C_InternetService_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/InternetService/*.c)
file(GLOB A7670C_MQTT_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/MQTT/*.c)
file(GLOB A7670C_NETWORK_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/Network/*.c)
file(GLOB A7670C_PacketDomain_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/PacketDomain/*.c)
file(GLOB A7670C_SIMCard_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/SIMCard/*.c)
file(GLOB A7670C_StatusControl_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/StatusControl/*.c)
file(GLOB A7670C_V25TER_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/V25TER/*.c)

set(A7670C_SOURCES
        ${A7670C_ROOT_SOURCES}
        ${A7670C_COMMON_SOURCES}
        ${A7670C_HTTP_SOURCES}
        ${A7670C_InternetService_SOURCES}
        ${A7670C_MQTT_SOURCES}
        ${A7670C_NETWORK_SOURCES}
        ${A7670C_PacketDomain_SOURCES}
        ${A7670C_SIMCard_SOURCES}
        ${A7670C_StatusControl_SOURCES}
        ${A7670C_V25TER_SOURCES})

foreach (item IN LISTS A7670C_SOURCES)
    message(STATUS "[${PROJECT_NAME}::Devices::A7670C] SOURCE: ${item}")
endforeach ()

## ---------------------------------------------------------------------------------------------------- ##
## ---- DS1307
file(GLOB DS1307_SOURCES ./Devices/DS1307/*.c)

foreach (item IN LISTS DS1307_SOURCES)
    message(STATUS "[${PROJECT_NAME}::Devices::DS1307] SOURCE: ${item}")
endforeach ()

## ---------------------------------------------------------------------------------------------------- ##
## ---- OLED
file(GLOB OLED_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/OLED/*.c)

foreach (item IN LISTS OLED_SOURCES)
    message(STATUS "[${PROJECT_NAME}::Devices::OLED] SOURCE: ${item}")
endforeach ()


## ---------------------------------------------------------------------------------------------------- ##
## ---- SDCard
file(GLOB SDCARD_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/SDCard/*.c)

foreach (item IN LISTS SDCARD_SOURCES)
    message(STATUS "[${PROJECT_NAME}::Devices::SDCard] SOURCE: ${item}")
endforeach ()


## ---------------------------------------------------------------------------------------------------- ##
## ---- SPIFlash
file(GLOB SPIFLASH_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Devices/SPIFlash/*.c)

foreach (item IN LISTS SPIFLASH_SOURCES)
    message(STATUS "[${PROJECT_NAME}::Devices::SPIFlash] SOURCE: ${item}")
endforeach ()


########################################################################################################################
## Application

file(GLOB ARMCC_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/ARMCC/startup_gd32f450_470.s)
foreach (item IN LISTS ARMCC_SOURCES)
    message(STATUS "[${PROJECT_NAME}::ARMCC] SOURCE: ${item}")
endforeach ()

file(GLOB APPLICATION_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Application/*.c)
foreach (item IN LISTS APPLICATION_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB BOARD_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Board/*.c)
foreach (item IN LISTS BOARD_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_executable(${PROJECT_NAME} ${APPLICATION_SOURCES}
        ${ARMCC_SOURCES}
        ${BOARD_SOURCES}
        ${A7670C_SOURCES}
        ${DS1307_SOURCES}
        ${OLED_SOURCES}
        ${SDCARD_SOURCES}
        ${SPIFLASH_SOURCES}

)
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS_Kernel)
target_link_libraries(${PROJECT_NAME} PUBLIC GD32F4xx)
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS_SDK)

target_include_directories(${PROJECT_NAME}
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/Common
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/HTTP
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/InternetService
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/MQTT
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/Network
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/PacketDomain
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/SIMCard
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/StatusControl
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/A7670C/V25TER
)

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/DS1307)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/OLED)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/SDCard)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Devices/SPIFlash)



if (CMAKE_C_COMPILER_ID MATCHES ARMCC)
    set(HEX_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
    set(ASM_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.asm)
    set(BIN_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.bin)

    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} --i32 $<TARGET_FILE:${PROJECT_NAME}> --output=${HEX_FILE}
            COMMAND ${CMAKE_OBJCOPY} --text -c --cpu=${CMAKE_OBJCOPY_CPU_NAME} $<TARGET_FILE:${PROJECT_NAME}> --output=${ASM_FILE}
            COMMAND ${CMAKE_OBJCOPY} --bin $<TARGET_FILE:${PROJECT_NAME}> --output=${BIN_FILE}
            COMMENT "Building ${HEX_FILE}
                    Building ${ASM_FILE}
                    Building ${BIN_FILE}")
endif ()

