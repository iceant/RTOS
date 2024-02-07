cmake_minimum_required(VERSION 3.6)
project(lua_scripts)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/init.lua DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
