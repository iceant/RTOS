# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-src"
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-build"
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix"
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix/tmp"
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix/src/tlsf-src-populate-stamp"
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix/src"
  "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix/src/tlsf-src-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix/src/tlsf-src-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-subbuild/tlsf-src-populate-prefix/src/tlsf-src-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
