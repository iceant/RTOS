cmake_minimum_required(VERSION 3.6)
project(RTOS_SDK C)
enable_language(ASM)

file(GLOB SOURCES *.c)
list(FILTER SOURCES EXCLUDE REGEX \\.t\\.c)

add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} )
target_link_libraries(${PROJECT_NAME} PUBLIC RTOS_Kernel)

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
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
