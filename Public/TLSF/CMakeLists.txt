cmake_minimum_required(VERSION 3.10)
project(TLSF C)

include(FetchContent)
FetchContent_Declare(
        TLSF-SRC
        URL http://www.gii.upv.es/tlsf/files/src/TLSF-2.4.6.tbz2
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)

FetchContent_MakeAvailable(TLSF-SRC)
message(STATUS "tlsf-src_SOURCE_DIR: ${tlsf-src_SOURCE_DIR}")

file(GLOB SOURCES ${tlsf-src_SOURCE_DIR}/src/*.c)
foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()


add_library(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${tlsf-src_SOURCE_DIR}/src)
