#ifndef INCLUDED_LUAVM_H
#define INCLUDED_LUAVM_H

#ifndef INCLUDED_LUA_H
#define INCLUDED_LUA_H
#include <lua.h>
#endif /* INCLUDED_LUA_H */

#ifndef INCLUDED_LUACONF_H
#define INCLUDED_LUACONF_H
#include <luaconf.h>
#endif /* INCLUDED_LUACONF_H */

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


lua_State * LuaVM_Open(void);

void LuaVM_Close(lua_State* vm);

void LuaVM_Debug(lua_State *L, int err, const char *msg, void (*put)(const char* file, int line, const char* fmt, ...)
                 , const char* file, int line);

#endif /* INCLUDED_LUAVM_H */
