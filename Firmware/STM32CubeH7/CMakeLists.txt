cmake_minimum_required(VERSION 3.10)
project(STM32CubeH7 C)

include(FetchContent)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../CMake/GitCheckout.cmake)

Set(FETCHCONTENT_QUIET FALSE)
FetchContent_Declare(
        STM32H7xx_CMSIS_Device
        GIT_REPOSITORY https://github.com/STMicroelectronics/cmsis_device_h7.git
        USES_TERMINAL_DOWNLOAD TRUE
        GIT_PROGRESS TRUE
        OVERRIDE_FIND_PACKAGE
)

FetchContent_Declare(
        STM32H7xx_HAL_Driver
        GIT_REPOSITORY https://github.com/STMicroelectronics/stm32h7xx_hal_driver.git
        USES_TERMINAL_DOWNLOAD TRUE
        GIT_PROGRESS TRUE
        OVERRIDE_FIND_PACKAGE
)

FetchContent_GetProperties(STM32H7xx_CMSIS_Device)
FetchContent_GetProperties(STM32H7xx_HAL_Driver)

if(NOT stm32h7xx_cmsis_POPULATED)
    message(STATUS "Fetching STM32H7xx_CMSIS_Device")
    FetchContent_Populate(STM32H7xx_CMSIS_Device)
    message(STATUS "Fetching STM32H7xx_CMSIS_Device - done")
    set(STM32H7XX_CMSIS_SOURCE_DIR ${stm32h7xx_cmsis_device_SOURCE_DIR} CACHE STRING "" FORCE)
    message(STATUS "stm32h7xx_cmsis_SOURCE_DIR: ${stm32h7xx_cmsis_SOURCE_DIR}")
endif()

if(NOT stm32h7xx_hal_driver_POPULATED)
    message(STATUS "Fetching STM32H7xx_CMSIS")
    FetchContent_Populate(STM32H7xx_HAL_Driver)
    message(STATUS "Fetching STM32H7xx_CMSIS - done")
    set(STM32H7XX_HAL_DRIVER_SOURCE_DIR ${stm32h7xx_hal_driver_SOURCE_DIR} CACHE STRING "" FORCE)
    message(STATUS "stm32h7xx_hal_driver_SOURCE_DIR: ${stm32h7xx_hal_driver_SOURCE_DIR}")
endif()

git_checkout(
        "https://github.com/STMicroelectronics/STM32CubeH7"
        DIRECTORY ${stm32h7xx_hal_driver_SOURCE_DIR}/../stm32h7xx_cmsis_include
        SPARSE_CHECKOUT Drivers/CMSIS/Include
)
set(STM32H7XX_CMSIS_INCLUDE_DIR ${stm32h7xx_hal_driver_SOURCE_DIR}/../stm32h7xx_cmsis_include CACHE STRING "" FORCE)
