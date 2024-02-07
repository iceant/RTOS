#include <LuaVM.h>
#include <luawin.h>
#include <Logger.h>
#include <stdarg.h>
////////////////////////////////////////////////////////////////////////////////
////
static const luaL_Reg loadedlibs[]={
        {"luawin", luaopen_luawin},
        {NULL, NULL}
};

static Logger_t LuaVM__Logger;

////////////////////////////////////////////////////////////////////////////////
////

static void LuaVM_Put(const char* fmt, ...){
    va_list ap;
    va_start(ap, fmt);
    Logger_VLog(&LuaVM__Logger, LOGGER_LEVEL_DEBUG, __FILE__, __LINE__, fmt, ap);
    va_end(ap);
}
////////////////////////////////////////////////////////////////////////////////
////

void LuaVM_Debug(lua_State *L, int err, const char *msg, void (*put_fn)(const char* file, int line, const char* fmt, ...), const char* file, int line)
{
    if( err ){
        put_fn(file, line, "%s: Error while executing file\n", msg);
        switch( err ){
            case LUA_ERRFILE:
                put_fn(file, line, "couldn't open the given file\n");
                break;
            case LUA_ERRSYNTAX:
                put_fn(file, line, "syntax error during pre-compilation\n");
                luaL_traceback(L, L, msg, 1);
                put_fn(file, line, "%s\n", lua_tostring(L, -1));
                break;
            case LUA_ERRMEM:
                put_fn(file, line, "memory allocation error\n");
                break;
            case LUA_ERRRUN:
            {
                const char * msg2 = lua_tostring(L, -1);
                luaL_traceback(L, L, msg2, 1);
                put_fn(file, line, "%s\n", lua_tostring(L, -1));
                break;
            }
            case LUA_ERRERR:
                put_fn(file, line, "error while running the error handler function\n");
                break;
            default:
                put_fn(file, line, "unknown error %i\n", err);
                break;
        }
    }
}


lua_State * LuaVM_Open(void)
{
    Logger_Init(&LuaVM__Logger, "lua_debug.log", LOGGER_LEVEL_DEBUG, 2048, 4);
    Logger_Startup(&LuaVM__Logger);
    luabind_set_put_fn(LuaVM_Put);
    
    lua_State * L= luaL_newstate();
    luaL_openlibs(L);
    luabind_openlibs(L, loadedlibs);
    return L;
}

void LuaVM_Close(lua_State* vm)
{
    lua_close(vm);
}