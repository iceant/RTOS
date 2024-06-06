cmake_minimum_required(VERSION 3.10)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../CMake)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../CMake/arm-armcc-toolchain.cmake)

project(UB_GD32F303CGT6 C)
enable_language(ASM)

########################################################################################################################
## Options


########################################################################################################################
## Definitions
add_definitions(-DGD32F30X_XD)
add_definitions(-DUSE_STDPERIPH_DRIVER)
add_definitions(-DHXTAL_VALUE=12000000)
add_definitions(-D__MICROLIB)
add_definitions(-DNDEBUG)

set(CMAKE_OBJCOPY_CPU_NAME Cortex-M4)
set(CPU_MODEL "ARM_CortexM4")
set(CPU_FACTORY_TYPE GD32F303)
set(COMPILER_CPU_TYPE Cortex-M4.fp.sp)

set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} --c99 --gnu -c --cpu ${COMPILER_CPU_TYPE} -g -W -O0 --cpu Cortex-M4.fp.sp --apcs=interwork --split_sections")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} --cpu ${COMPILER_CPU_TYPE} -g --apcs=interwork --pd \"__MICROLIB SETA 1\" --pd \"__UVISION_VERSION SETA 538\" --pd \"GD32F470 SETA 1\" --xref ")
add_link_options(--cpu Cortex-M4.fp.sp --library_type=microlib --strict --scatter "${CMAKE_CURRENT_SOURCE_DIR}/ARMCC/link.sct" --summary_stderr --info summarysizes --map --xref --callgraph --symbols )

include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/Application)
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/Board)
########################################################################################################################
## Firmware
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Firmware/GD32F30x ${CMAKE_CURRENT_BINARY_DIR}/Firmware/GD32F30x)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Kernel ${CMAKE_CURRENT_BINARY_DIR}/Kernel)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../SDK ${CMAKE_CURRENT_BINARY_DIR}/SDK)

########################################################################################################################
## Devices


########################################################################################################################
## Application

file(GLOB ARMCC_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/ARMCC/startup_gd32f30x_xd.s)
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
)
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS_Kernel)
target_link_libraries(${PROJECT_NAME} PUBLIC GD32F30x)
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS_SDK)


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

