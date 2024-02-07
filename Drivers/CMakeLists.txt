cmake_minimum_required(VERSION 3.6)
project(RTOS-Drivers C)

################################################################################

option(USE_DS1307 "Support DS1307" OFF)
option(USE_ESP01S "Support ESP01S" OFF)
option(USE_OLED "Support OLED" OFF)
option(USE_N32L40X "Support N32L40x" OFF)

################################################################################

set(INCLUDE_IDR ${CMAKE_CURRENT_SOURCE_DIR}/Common)

if (USE_DS1307)
    file(GLOB DS1307_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/DS1307/*.c)
    list(APPEND INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/DS1307)
endif ()

if (USE_ESP01S)
    file(GLOB ESP01S_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/ESP01S/*.c)
    list(APPEND INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ESP01S)
endif ()

if (USE_OLED)
    file(GLOB OLED_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/OLED/*.c)
    list(APPEND INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/OLED)
endif ()

file(GLOB COMMON_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Common/*.c)

set(SOURCES
        ${COMMON_SOURCES}
        ${DS1307_SOURCES}
        ${ESP01S_SOURCES}
        ${OLED_SOURCES})

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIR})


