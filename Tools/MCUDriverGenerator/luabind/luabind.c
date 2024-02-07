#include <luabind.h>


static luabind_put luabind__put_fn = (luabind_put)printf;


void luabind_stackdump(lua_State* L)
{
    int top=lua_gettop(L);
    for (int i=1; i <= top; i++) {
        //luabind__put_fn("%d/%d\t%s\t", i, (i-top-1), luaL_typename(L,i));
        switch (lua_type(L, i)) {
            case LUA_TNUMBER:
                luabind__put_fn("%d/%d\t%s\t%g",i, (i-top-1), luaL_typename(L,i), lua_tonumber(L,i));
                break;
            case LUA_TSTRING:
                luabind__put_fn("%d/%d\t%s\t%s", i, (i-top-1), luaL_typename(L,i) ,lua_tostring(L,i));
                break;
            case LUA_TBOOLEAN:
                luabind__put_fn("%d/%d\t%s\t%s", i, (i-top-1), luaL_typename(L,i), (lua_toboolean(L, i) ? "true" : "false"));
                break;
            case LUA_TNIL:
                luabind__put_fn("%d/%d\t%s\t%s", i, (i-top-1), luaL_typename(L,i), "nil");
                break;
            default:
                luabind__put_fn("%d/%d\t%s\t%p", i, (i-top-1), luaL_typename(L,i),lua_topointer(L,i));
                break;
        }
    }
}

void luabind_openlibs(lua_State* L, const luaL_Reg * loadedlibs)
{
    const luaL_Reg * lib;
    for(lib = loadedlibs; lib->func; lib++){
        luaL_requiref(L, lib->name, lib->func, 1);
        lua_pop(L, 1);
    }
}

luabind_put luabind_set_put_fn(luabind_put fn)
{
    luabind_put old_put = luabind__put_fn;
    luabind__put_fn = fn;
    return old_put;
}

