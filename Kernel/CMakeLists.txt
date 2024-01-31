cmake_minimum_required(VERSION 3.6)
project(RTOS-Kernel C)
enable_language(ASM)

configure_file(os_kernel_config.h.in os_kernel_config.h)

set(RTOS_KERNEL_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})

file(GLOB SOURCES *.c)
list(FILTER SOURCES EXCLUDE REGEX \\.t\\.c)

add_library(${PROJECT_NAME} "")

set(RTOS_KERNEL_SOURCES ${SOURCES})

if (USE_TLSF)
    set(TLSF_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../ThirdParty/TLSF-2.4.6/src)
    message(STATUS "TLSF_INCLUDE_DIR:${TLSF_INCLUDE_DIR}")
    target_compile_definitions(${PROJECT_NAME} PUBLIC USE_TLSF)
    target_include_directories(${PROJECT_NAME} PUBLIC ${TLSF_INCLUDE_DIR})
    target_link_libraries(${PROJECT_NAME} PUBLIC TLSF)

    list(APPEND RTOS_KERNEL_INCLUDE_DIR ${TLSF_INCLUDE_DIR})
    list(APPEND RTOS_KERNEL_SOURCES ${TLSF_INCLUDE_DIR}/tlsf.c)

endif ()

#set(RTOS_KERNEL_INCLUDE_DIR ${RTOS_KERNEL_INCLUDE_DIR} CACHE STRING "" FORCE)
#set(RTOS_KERNEL_SOURCES ${RTOS_KERNEL_SOURCES} CACHE STRING "" FORCE)

target_sources(${PROJECT_NAME} PUBLIC ${RTOS_KERNEL_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${RTOS_KERNEL_INCLUDE_DIR} )
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS-CPU)


foreach (item IN LISTS RTOS_KERNEL_SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

foreach (item IN LISTS RTOS_KERNEL_INCLUDE_DIR)
    message(STATUS "[${PROJECT_NAME}] INCLUDE: ${item}")
endforeach ()

################################################################################
## TEST

#file(GLOB TEST_SOURCES *.t.c)
#foreach (item IN LISTS TEST_SOURCES)
#    get_filename_component(TestUnit ${item} NAME_WLE)
#    message(STATUS "[${PROJECT_NAME}] TEST: ${TestUnit} - ${item}")
#    add_executable(${TestUnit} ${item})
#    target_link_libraries(${TestUnit} ${PROJECT_NAME})
#endforeach ()
