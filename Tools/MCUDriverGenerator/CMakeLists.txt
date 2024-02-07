cmake_minimum_required(VERSION 3.6)
project(MCUDriverGenerator C)

add_subdirectory(deps/lua-5.4.6/src)
add_subdirectory(deps/sqlite-amalgamation-3450100)
add_subdirectory(luawin)
add_subdirectory(luabind)
add_subdirectory(lua)

####################################################################################################
file(GLOB MAIN_SOURCES *.c)
file(GLOB LIBS_SOURCES libs/*.c)

set(SOURCES ${MAIN_SOURCES} ${LIBS_SOURCES})

foreach (item IN LISTS SOURCES)
    message(STATUS "[${PROJECT_NAME}] SOURCE: ${item}")
endforeach ()

add_executable(${PROJECT_NAME} WIN32 "")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/libs)
target_link_libraries(${PROJECT_NAME} PUBLIC sqlite3)
target_link_libraries(${PROJECT_NAME} PUBLIC luabind)
target_link_libraries(${PROJECT_NAME} PUBLIC luawin)

