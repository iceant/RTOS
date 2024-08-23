cmake_minimum_required(VERSION 3.5)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake/ARMCC/toolchain-armcc.cmake)
project(UB_GD32F470VGT6 C)
enable_language(ASM)

########################################################################################################################
## PROJECT
add_executable(${PROJECT_NAME} "")

########################################################################################################################
## Definitions
add_definitions(-DGD32F470)
add_definitions(-DUSE_STDPERIPH_DRIVER)
add_definitions(-DHXTAL_VALUE=12000000)
add_definitions(-D__MICROLIB)
add_definitions(-DNDEBUG)
add_definitions(-DCPU_HARDFAULT_ENABLE=1)

set(CMAKE_OBJCOPY_CPU_NAME Cortex-M4)
set(CPU_MODEL ARM-Cortex-M4)
set(CPU_FACTORY_TYPE GD32F470)

set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} --c99 --gnu -c --cpu Cortex-M4.fp.sp -g -W -O0 --cpu Cortex-M4.fp.sp --apcs=interwork --split_sections")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} --cpu Cortex-M4.fp.sp -g --apcs=interwork --pd \"__MICROLIB SETA 1\" --pd \"__UVISION_VERSION SETA 538\" --pd \"GD32F470 SETA 1\" --xref ")
add_link_options(--cpu Cortex-M4.fp.sp --library_type=microlib --strict --summary_stderr --info summarysizes --map --xref --callgraph --symbols )

set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "--scatter ${CMAKE_CURRENT_SOURCE_DIR}/ARMCC/link.sct")

########################################################################################################################
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../SDK ${CMAKE_CURRENT_BINARY_DIR}/SDK)

target_link_libraries(${PROJECT_NAME} PUBLIC SDK)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Application)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Board)

########################################################################################################################
## FWLIB
set(FWLIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../Firmware/GD32F4xx_Firmware_Library_V3.2.0/Firmware)
#file(GLOB FWLIB_CMSIS_SOURCES ${FWLIB_DIR}/CMSIS/GD/GD32F4xx/Source/*.c)
if (CMAKE_C_COMPILER_ID MATCHES ARMCC)
    list(APPEND FWLIB_CMSIS_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/ARMCC/startup_gd32f450_470.s)
endif ()
foreach (item IN LISTS FWLIB_CMSIS_SOURCES)
    message(STATUS "[${PROJECT_NAME}] FWLIB_CMSIS_SOURCES: ${item}")
endforeach ()


file(GLOB FWLIB_PERIPHERAL_SOURCES ${FWLIB_DIR}/GD32F4xx_standard_peripheral/Source/*.c)
foreach (item IN LISTS FWLIB_PERIPHERAL_SOURCES)
    message(STATUS "[${PROJECT_NAME}] FWLIB_PERIPHERAL_SOURCES: ${item}")
endforeach ()

target_sources(${PROJECT_NAME} PUBLIC ${FWLIB_CMSIS_SOURCES})
target_sources(${PROJECT_NAME} PUBLIC ${FWLIB_PERIPHERAL_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${FWLIB_DIR}/CMSIS)
target_include_directories(${PROJECT_NAME} PUBLIC ${FWLIB_DIR}/CMSIS/GD/GD32F4xx/Include)
target_include_directories(${PROJECT_NAME} PUBLIC ${FWLIB_DIR}/GD32F4xx_standard_peripheral/Include)

########################################################################################################################
file(GLOB BOARD_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Board/*.c)
file(GLOB APPLICATION_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Application/*.c)


foreach (item IN LISTS BOARD_SOURCES)
    message(STATUS "[${PROJECT_NAME}] BOARD_SOURCES: ${item}")
endforeach ()

foreach (item IN LISTS APPLICATION_SOURCES)
    message(STATUS "[${PROJECT_NAME}] APPLICATION_SOURCES: ${item}")
endforeach ()

target_sources(${PROJECT_NAME} PUBLIC ${BOARD_SOURCES})
target_sources(${PROJECT_NAME} PUBLIC ${APPLICATION_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Board/)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Application/)


########################################################################################################################
## ARMCC

if (CMAKE_C_COMPILER_ID MATCHES ARMCC)
    set(HEX_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
    set(ASM_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.asm)
    set(BIN_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.bin)

    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} --i32 $<TARGET_FILE:${PROJECT_NAME}> --output=${HEX_FILE}
            COMMAND ${CMAKE_OBJCOPY} --text -c --cpu=${CMAKE_OBJCOPY_CPU_NAME} $<TARGET_FILE:${PROJECT_NAME}> --output=${ASM_FILE}
            COMMAND ${CMAKE_OBJCOPY} --bin $<TARGET_FILE:${PROJECT_NAME}> --output=${BIN_FILE}
            COMMAND ${CMAKE_OBJCOPY} -z $<TARGET_FILE:${PROJECT_NAME}>
            COMMENT "Building ${HEX_FILE}
                    Building ${ASM_FILE}
                    Building ${BIN_FILE}")
endif ()