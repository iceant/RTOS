cmake_minimum_required(VERSION 3.6)
project(luabind C)

file(GLOB SOURCES *.c)

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_link_libraries(${PROJECT_NAME} PUBLIC lua)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

