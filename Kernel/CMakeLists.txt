cmake_minimum_required(VERSION 3.10)
project(RTOS_Kernel C)
enable_language(ASM)

########################################################################################################################
#### Options
option(RTOS_KERNEL_USE_TLSF "Use TLSF Memory Pool" ON)


########################################################################################################################
#### Dependencies
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../Compiler ${CMAKE_CURRENT_BINARY_DIR}/Compiler)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../CPU ${CMAKE_CURRENT_BINARY_DIR}/CPU)

########################################################################################################################
####
if (DEFINED RTOS_KERNEL_USE_TLSF)
    add_definitions(-DRTOS_KERNEL_USE_TLSF)
    include_directories(${CMAKE_CURRENT_SOURCE_DIR})
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../Public/TLSF ${CMAKE_CURRENT_BINARY_DIR}/TLSF)
endif ()

########################################################################################################################
#### SOURCE
file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_library(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME}
        PUBLIC RTOS_CPU
        PUBLIC RTOS_COMPILER
        PUBLIC TLSF
)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

