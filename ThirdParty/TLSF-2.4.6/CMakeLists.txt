cmake_minimum_required(VERSION 3.6)
project(TLSF C)

set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/tlsf.c ${CMAKE_CURRENT_SOURCE_DIR}/src/tlsf.h)
set(TLSF_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src CACHE STRING "" FORCE)

add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${TLSF_INCLUDE_DIR})

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()



