SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)
SET(CMAKE_SYSTEM_PROCESSOR arm)
SET(CMAKE_C_COMPILER_WORKS 1)

set(TOOLCHAIN_ROOT_PATH "C:/Keil_v5/ARM/ARMCC")
if(NOT EXISTS ${TOOLCHAIN_ROOT_PATH}/bin/armcc.exe)
    if(CMAKE_HOST_SYSTEM_NAME STREQUAL Windows)
        message(STATUS "Please specify the TOOLCHAIN_ROOT_PATH !\n For example: -DTOOLCHAIN_ROOT_PATH=\"C:/Keil_v5/ARM/ARMCC\" " )
    endif()
endif ()

if(NOT DEFINED TOOLCHAIN_ROOT_PATH)
    SET(TOOLCHAIN_ROOT_PATH "$ENV{TOOLCHAIN_ROOT_PATH}")
endif ()

# 指定交叉编译器，路径需要使用cygwin形式的路径，否则找不到

SET(CMAKE_C_COMPILER "${TOOLCHAIN_ROOT_PATH}/bin/armcc.exe")
SET(CMAKE_CXX_COMPILER "${TOOLCHAIN_ROOT_PATH}/bin/armcc.exe")
SET(CMAKE_ASM_COMPILER "${TOOLCHAIN_ROOT_PATH}/bin/armasm.exe")
SET(CMAKE_OBJCOPY "${TOOLCHAIN_ROOT_PATH}/bin/fromelf.exe")
SET(CMAKE_AR "${TOOLCHAIN_ROOT_PATH}/bin/armar.exe" CACHE FILEPATH "Archiver")

# 清除缺省的编译、连接器选项
UNSET(CMAKE_C_FLAGS CACHE)
UNSET(CMAKE_CXX_FLAGS CACHE)
UNSET(CMAKE_EXE_LINKER_FLAGS CACHE)
UNSET(CMAKE_AR_FLAGS CACHE)

# 设置编译、打包工具命令格式
SET(CMAKE_C_ARCHIVE_CREATE "<CMAKE_AR> ${CMAKE_AR_FLAGS} -o <TARGET> <OBJECTS>" CACHE STRING "C Archive Create")
SET(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> ${CMAKE_AR_FLAGS} -o <TARGET> <OBJECTS>" CACHE STRING "CXX Archive Create")

# 设置编译器提供的头文件路径
include_directories("${TOOLCHAIN_ROOT_PATH}/include")

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_ROOT_PATH}")

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
