cmake_minimum_required(VERSION 3.5)
project(Compiler C)
enable_language(ASM)

########################################################################################################################

if(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_C_COMPILER_ID})

file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_C_COMPILER_ID}/*.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_library(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_C_COMPILER_ID}/)

endif ()