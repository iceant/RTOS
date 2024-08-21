cmake_minimum_required(VERSION 3.5)
project(CPU C)
enable_language(ASM)

if(NOT DEFINED CPU_MODEL)
    message(FATAL_ERROR "[${PROJECT_NAME}] Missing `CPU_MODEL` Option!!!")
endif ()

add_subdirectory(../Compiler ${CMAKE_CURRENT_BINARY_DIR}/Compiler)

file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/${CPU_MODEL}/*.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB CPU_COMPILER_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/${CPU_MODEL}/${CMAKE_C_COMPILER_ID}/*.c)
foreach (item IN LISTS CPU_COMPILER_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

file(GLOB CPU_COMPILER_ASM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/${CPU_MODEL}/${CMAKE_C_COMPILER_ID}/*.s)
foreach (item IN LISTS CPU_COMPILER_ASM_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()


add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES}
        PUBLIC ${CPU_COMPILER_SOURCES}
        PUBLIC ${CPU_COMPILER_ASM_SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/${CPU_MODEL})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/${CPU_MODEL}/${CMAKE_C_COMPILER_ID})
target_link_libraries(${PROJECT_NAME} PUBLIC Compiler)