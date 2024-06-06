cmake_minimum_required(VERSION 3.10)
project(GD32F30x C)
enable_language(ASM)

include(FetchContent)
FetchContent_Declare(
        GD32F30x_Firmware_Library
        URL https://www.gd32mcu.com/data/documents/toolSoftware/GD32F30x_Firmware_Library_V2.2.0.rar
        URL_HASH MD5=a8b1a952c326238a4ef4edce48eab57a
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)

FetchContent_MakeAvailable(GD32F30x_Firmware_Library)

message(STATUS "[${PROJECT_NAME}] gd32f30x_firmware_library_SOURCE_DIR:${gd32f30x_firmware_library_SOURCE_DIR}")

set(CMSIS_SOURCE_DIR ${gd32f30x_firmware_library_SOURCE_DIR}/Firmware/CMSIS)
set(PERIPHERAL_SOURCE_DIR ${gd32f30x_firmware_library_SOURCE_DIR}/Firmware/GD32F30x_standard_peripheral)
set(USB_D_SOURCE_DIR ${gd32f30x_firmware_library_SOURCE_DIR}/Firmware/GD32F30x_usbd_library)
set(USB_FS_SOURCE_DIR ${gd32f30x_firmware_library_SOURCE_DIR}/Firmware/GD32F30x_usbfs_library)


message(STATUS "CMAKE_C_COMPILER_ID: ${CMAKE_C_COMPILER_ID}")


add_library(${PROJECT_NAME} "")

#file(GLOB CMSIS_SOURCES ${CMSIS_SOURCE_DIR}/GD/GD32F30x/Source/*.c)

#if (CMAKE_C_COMPILER_ID MATCHES ARMCC)
#    message(STATUS "CPU_FACTORY_TYPE:${CPU_FACTORY_TYPE}")
#    if(CPU_FACTORY_TYPE MATCHES "GD32F450" OR CPU_FACTORY_TYPE MATCHES "GD32F470")
#        set(CMSIS_STARTUP_SOURCE ${CMSIS_SOURCE_DIR}/GD/GD32F4xx/Source/ARM/startup_gd32f450_470.s)
#        list(APPEND CMSIS_SOURCES ${CMSIS_STARTUP_SOURCE})
#        message(STATUS "CMSIS_STARTUP_SOURCE:${CMSIS_STARTUP_SOURCE}")
#    endif ()
#endif ()

foreach (item IN LISTS CMSIS_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB PERIPHERAL_SOURCES ${PERIPHERAL_SOURCE_DIR}/Source/*.c)
foreach (item IN LISTS PERIPHERAL_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

target_sources(${PROJECT_NAME}
        PUBLIC ${CMSIS_SOURCES}
        PUBLIC ${PERIPHERAL_SOURCES}
)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMSIS_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMSIS_SOURCE_DIR}/GD/GD32F30x/Include)
target_include_directories(${PROJECT_NAME} PUBLIC ${PERIPHERAL_SOURCE_DIR}/Include)
add_definitions(-D${CPU_FACTORY_TYPE})

