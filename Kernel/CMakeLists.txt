cmake_minimum_required(VERSION 3.6)
project(RTOS-Kernel C)
enable_language(ASM)

configure_file(os_kernel_config.h.in os_kernel_config.h)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CPU_INCLUDE_DIR})

file(GLOB SOURCES *.c)
list(FILTER SOURCES EXCLUDE REGEX \\.t\\.c)

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()


add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_link_libraries(${PROJECT_NAME} ${CPU})

if (USE_TLSF)
    target_compile_definitions(${PROJECT_NAME} PUBLIC USE_TLSF)
    target_include_directories(${PROJECT_NAME} PUBLIC ${TLSF_INCLUDE_DIR})
    target_link_libraries(${PROJECT_NAME} TLSF)
endif ()


################################################################################
## TEST

file(GLOB TEST_SOURCES *.t.c)
foreach (item IN LISTS TEST_SOURCES)
    get_filename_component(TestUnit ${item} NAME_WLE)
    message(STATUS "[${PROJECT_NAME}] TEST: ${TestUnit} - ${item}")
    add_executable(${TestUnit} ${item})
    target_link_libraries(${TestUnit} ${PROJECT_NAME})
endforeach ()
