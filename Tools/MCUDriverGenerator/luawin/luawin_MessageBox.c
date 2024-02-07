#include <luawin_MessageBox.h>
#include <windows.h>

/*
 * luawin.MessageBox(HWND, Text, Caption, Type)
 * */
int luawin_MessageBox(lua_State* L)
{
    HWND hwnd = lua_touserdata(L, 1);
    char* text = lua_tostring(L, 2);
    char* caption= lua_tostring(L, 3);
    unsigned int type = lua_tointeger(L, 4);
    int ret = MessageBoxA(hwnd, text, caption, type);
    lua_pushinteger(L, ret);
    return 1;
}

