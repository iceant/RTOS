#ifndef INCLUDED_LUABIND_H
#define INCLUDED_LUABIND_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_LUA_H
#define INCLUDED_LUA_H
#include <lua.h>
#endif /* INCLUDED_LUA_H */

#ifndef INCLUDED_LUALIB_H
#define INCLUDED_LUALIB_H
#include <lualib.h>
#endif /* INCLUDED_LUALIB_H */

#ifndef INCLUDED_LAUXLIB_H
#define INCLUDED_LAUXLIB_H
#include <lauxlib.h>
#endif /* INCLUDED_LAUXLIB_H */

////////////////////////////////////////////////////////////////////////////////
////

typedef void (*luabind_put)(const char* fmt, ...);

void luabind_stackdump(lua_State* L);

void luabind_openlibs(lua_State* L, const luaL_Reg * loadedlibs);

luabind_put luabind_set_put_fn(luabind_put put_fn);

#endif /* INCLUDED_LUABIND_H */
