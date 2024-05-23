cmake_minimum_required(VERSION 3.10)
########################################################################################################################
include(${CMAKE_CURRENT_SOURCE_DIR}/../../CMake/toolchain-arm-none-eabi.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../CMake/binutils-arm-none-eabi.cmake)
########################################################################################################################
project(YD-STM32H7xxVx C)
enable_language(ASM)

########################################################################################################################
set(CMAKE_C_STANDARD 11)
set(PROJECT_VERSION B1)
set(CPU_MODEL ARM_CortexM4)

add_definitions(-DNDEBUG)

if (CMAKE_C_COMPILER_ID MATCHES GNU)
    add_compile_options(
            -save-temps
            -mcpu=cortex-m7
            -mfpu=fpv5-d16
            -mfloat-abi=hard
            -mthumb
            -ffunction-sections
            -fdata-sections
            -fno-exceptions
            -fstack-protector-all
    )
    add_link_options(
            -mcpu=cortex-m7
            -mthumb
            -mfloat-abi=hard
            --specs=nano.specs
            -lc
            -lm
            -Wl,--gc-sections
            -Wl,--print-memory-usage
    )
endif ()

########################################################################################################################
## STM32H7XX
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Firmware/STM32CubeH7 ${CMAKE_CURRENT_BINARY_DIR}/Firmware/STM32CubeH7)
message(STATUS "APPLICATION:: STM32H7XX_CMSIS_SOURCE_DIR: ${STM32H7XX_CMSIS_SOURCE_DIR}")
message(STATUS "APPLICATION:: STM32H7XX_HAL_DRIVER_SOURCE_DIR: ${STM32H7XX_HAL_DRIVER_SOURCE_DIR}")
message(STATUS "APPLICATION:: STM32H7XX_CMSIS_INCLUDE_DIR: ${STM32H7XX_CMSIS_INCLUDE_DIR}")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Kernel ${CMAKE_CURRENT_BINARY_DIR}/Kernel)
target_include_directories(RTOS_Kernel PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(RTOS_CPU PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
########################################################################################################################
## PROJECT
add_executable(${PROJECT_NAME} "")
file(GLOB SOURCES *.c)

if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/system_stm32h7xx.c)
    file(COPY ${STM32H7XX_CMSIS_SOURCE_DIR}/Source/Templates/system_stm32h7xx.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
endif ()
if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/stm32h7xx_hal_conf.h)
    file(COPY_FILE ${STM32H7XX_HAL_DRIVER_SOURCE_DIR}/Inc/stm32h7xx_hal_conf_template.h ${CMAKE_CURRENT_SOURCE_DIR}/stm32h7xx_hal_conf.h)
endif ()
message(STATUS "CMAKE_C_COMPILER_ID:${CMAKE_C_COMPILER_ID}")
if (CMAKE_C_COMPILER_ID MATCHES GNU)
    if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/GNU)
        file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/GNU)
    endif()
    if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/GNU/startup_stm32h743xx.s)
        file(COPY ${STM32H7XX_CMSIS_SOURCE_DIR}/Source/Templates/gcc/startup_stm32h743xx.s DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/GNU)
    endif ()
    if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/GNU/link.ld)
        file(COPY_FILE ${STM32H7XX_CMSIS_SOURCE_DIR}/Source/Templates/gcc/linker/stm32h745xx_flash_CM4.ld ${CMAKE_CURRENT_SOURCE_DIR}/GNU/link.ld)
    endif ()
    set(LINK_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/GNU/link.ld)
    list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/GNU/startup_stm32h743xx.s)

    target_compile_options(${PROJECT_NAME} PUBLIC
            -mcpu=cortex-m7
            -mfpu=fpv5-d16
            -mfloat-abi=hard
            -mthumb
            -ffunction-sections
            -fdata-sections
            -fno-exceptions
            -fstack-protector
            $<$<COMPILE_LANGUAGE:CXX>:-fno-use-cxa-atexit>
            $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
    target_link_options(
            ${PROJECT_NAME} PRIVATE
#                -mcpu=cortex-m7
#                -mthumb
#                -mfloat-abi=hard
#                -mthumb
#                --specs=nano.specs
#                -lc
#                -lm
                -Wl,-Map=${PROJECT_NAME}.map,--cref
                -Wl,--gc-sections
                -T${LINK_SCRIPT}
            )

endif ()

file(GLOB STM32H7XX_HAL_DRIVER_SOURCES ${STM32H7XX_HAL_DRIVER_SOURCE_DIR}/Src/*.c)
list(FILTER  STM32H7XX_HAL_DRIVER_SOURCES EXCLUDE REGEX _template.c)

file(GLOB BSP_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/BSP/*.c)

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()
foreach (item IN LISTS STM32H7XX_HAL_DRIVER_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()
foreach (item IN LISTS BSP_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()


target_sources(${PROJECT_NAME}
        PUBLIC ${SOURCES}
        PUBLIC ${BSP_SOURCES}
        PUBLIC ${STM32H7XX_HAL_DRIVER_SOURCES}
)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/BSP)
target_include_directories(${PROJECT_NAME} PUBLIC ${STM32H7XX_CMSIS_SOURCE_DIR}/Include)
target_include_directories(${PROJECT_NAME} PUBLIC ${STM32H7XX_HAL_DRIVER_SOURCE_DIR}/Inc)
target_include_directories(${PROJECT_NAME} PUBLIC ${STM32H7XX_CMSIS_INCLUDE_DIR}/Drivers/CMSIS/Include)
target_compile_definitions(${PROJECT_NAME} PUBLIC USE_HAL_DRIVER STM32H743xx)
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS_Kernel)


if (CMAKE_C_COMPILER_ID MATCHES GNU)
add_custom_command(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_NAME} ${PROJECT_NAME}.elf
        COMMAND ${CMAKE_OBJCOPY} -O ihex ${PROJECT_NAME}
        ${PROJECT_NAME}_${PROJECT_VERSION}.hex
        COMMAND ${CMAKE_OBJCOPY} -O binary ${PROJECT_NAME}
        ${PROJECT_NAME}_${PROJECT_VERSION}.bin
        COMMAND ${CMAKE_OBJDUMP} --source --all-headers --demangle --line-numbers
        --wide ${PROJECT_NAME} > ${PROJECT_NAME}.lst
        COMMAND ${CMAKE_SIZE} --format=berkeley ${PROJECT_NAME} DEPENDS
        ${PROJECT_NAME}
        COMMENT "Generate .hex, .bin and .lst from .elf file")
endif ()


########################################################################################################################
## Examples
git_checkout(
        "https://github.com/STMicroelectronics/STM32CubeH7"
        DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Examples
        SPARSE_CHECKOUT
            Projects/STM32H743I-EVAL/Applications
            Projects/STM32H743I-EVAL/Examples
)

