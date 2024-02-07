#include <luawin.h>
#include <luawin_gc.h>
#include <windows.h>

#include <luawin_MessageBox.h>
////////////////////////////////////////////////////////////////////////////////
////
typedef struct luawin_s{
    HWND hwnd;
    HINSTANCE hInstance;
}luawin_t;

////////////////////////////////////////////////////////////////////////////////
////

static const struct luaL_Reg luawin_f[]={
        {"MessageBox", luawin_MessageBox},
        {NULL, NULL}
};

/*meta functions*/
static const struct luaL_Reg luawin_m[]={
        {"__gc", luawin_gc},
        {NULL, NULL}
};

////////////////////////////////////////////////////////////////////////////////
////

int luaopen_luawin(lua_State* L)
{
    luaL_newmetatable(L, LUAWIN_METATABLE_NAME);
    luaL_setfuncs(L, luawin_m, 0);
    luaL_newlib(L, luawin_f);
    return 1;
}

