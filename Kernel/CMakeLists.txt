cmake_minimum_required(VERSION 3.5)
project(Kernel C)
enable_language(ASM)

########################################################################################################################
option(OS_KERNEL_USE_TLSF "Use TLSF Allocator" ON)

########################################################################################################################

add_subdirectory(../CPU ${CMAKE_CURRENT_BINARY_DIR}/CPU)
########################################################################################################################

file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
list(FILTER SOURCES EXCLUDE REGEX \\.t\\.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_library(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(${PROJECT_NAME} PUBLIC CPU)

if(OS_KERNEL_USE_TLSF)
    add_subdirectory(../Pub/TLSF-2.4.6 ${CMAKE_CURRENT_BINARY_DIR}/TLSF)
    target_compile_definitions(${PROJECT_NAME} PUBLIC OS_KERNEL_USE_TLSF=1)
    target_link_libraries(${PROJECT_NAME} PUBLIC TLSF)
endif ()

if(CMAKE_SIZEOF_VOID_P)
    target_compile_definitions(${PROJECT_NAME} PUBLIC OS_SIZEOF_VOID_P=${CMAKE_SIZEOF_VOID_P})
endif ()

########################################################################################################################
file(GLOB TEST_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.t.c)
foreach (item IN LISTS TEST_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

