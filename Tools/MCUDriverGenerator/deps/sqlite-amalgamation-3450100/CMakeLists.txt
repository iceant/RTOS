cmake_minimum_required(VERSION 3.6)
project(sqlite3 C)

file(GLOB SOURCES *.c)
list(FILTER SOURCES EXCLUDE REGEX "shell.c")

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

