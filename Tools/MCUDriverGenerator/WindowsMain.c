#include <WindowsMain.h>

#define STRICT
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <windowsx.h>
#include <LuaVM.h>
#include <WindowsUtil.h>
#include <string.h>
#include <Logger.h>
////////////////////////////////////////////////////////////////////////////////
////

#if !defined(_WIN32_) && !defined(_WIN32)
    #define EXPORT16 _export
#else
    #define EXPORT16
#endif
////////////////////////////////////////////////////////////////////////////////
////
static Logger_t s_logger;
static char szAppName[] = "MCUDriverGenerator";
static HWND s_MainWindow;
static lua_State* L;
////////////////////////////////////////////////////////////////////////////////
////

static void WindowsMain_LuaDebug(const char* file, int line, const char* fmt, ...){
    va_list ap;
    va_start(ap, fmt);
    Logger_VLog(&s_logger, LOGGER_LEVEL_DEBUG, file, line, fmt, ap);
    va_end(ap);
}

static void WindowsMain_Destroy(HWND hwnd)
{
    LuaVM_Close(L);
    Logger_Close(&s_logger);
    PostQuitMessage(0);
}

static WINBOOL WindowsMain_OnCreate(HWND hwnd, LPCREATESTRUCT lpCreateStruct){
    L = LuaVM_Open();
    unsigned char buffer[1024];
    TCHAR* szCurrentPath = WindowsUtil_GetCurrentDirectory();
    LOG_DEBUG("szCurrentPath: %s", szCurrentPath);
    int size = sprintf(buffer, "%s/lua/init.lua", szCurrentPath);
    WindowsUtil_Free(szCurrentPath);
    LOG_DEBUG("lua_file: %s", buffer);
    int err = luaL_loadfile(L, buffer);
    if(err){
        LuaVM_Debug(L, err, "init.lua", WindowsMain_LuaDebug, __FILE__, __LINE__);
        MessageBox(hwnd, "Can not load init.lua!", "ERROR", MB_OK);
        return FALSE;
    }
    err = lua_pcall(L, 0, LUA_MULTRET, 0);
    if(err){
        LuaVM_Debug(L, err, "init.lua", WindowsMain_LuaDebug, __FILE__, __LINE__);
        MessageBox(hwnd, "Can not run init.lua!", "ERROR", MB_OK);
        return FALSE;
    }
    return TRUE;
}

static LRESULT CALLBACK EXPORT16 WndProc(HWND hWindow, UINT Message, WPARAM wParam, LPARAM lParam)
{
    switch (Message) {
        HANDLE_MSG(hWindow, WM_CREATE, WindowsMain_OnCreate);
        HANDLE_MSG(hWindow, WM_DESTROY, WindowsMain_Destroy);
        default:
            return DefWindowProc(hWindow, Message, wParam, lParam);
    }
}


static BOOL Register(HINSTANCE hInstance)
{
    WNDCLASS  WndClass;
    WndClass.style = CS_HREDRAW | CS_VREDRAW;
    WndClass.lpfnWndProc = WndProc;
    WndClass.cbClsExtra = 0;
    WndClass.cbWndExtra = 0;
    WndClass.hInstance = hInstance;
    WndClass.hIcon = LoadIconA(NULL, IDI_APPLICATION);
    WndClass.hCursor = LoadCursorA(NULL, IDC_ARROW);
    WndClass.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
    WndClass.lpszMenuName = NULL;
    WndClass.lpszClassName = szAppName;
    
    return (RegisterClassA(&WndClass)!=0);
}

static HWND Create(HINSTANCE hInstance, int nCmdShow)
{
    HWND hWindow = CreateWindowEx(0, szAppName, szAppName,
                                  WS_OVERLAPPEDWINDOW,
                                  CW_USEDEFAULT, CW_USEDEFAULT,
                                  CW_USEDEFAULT, CW_USEDEFAULT,
                                  NULL, NULL, hInstance, NULL);
    if(hWindow==NULL){
        return hWindow;
    }
    
    ShowWindow(hWindow, nCmdShow);
    UpdateWindow(hWindow);
    
    return hWindow;
}


////////////////////////////////////////////////////////////////////////////////
////

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInstance, LPSTR lpszCmdParam, int nCmdShow)
{
    Logger_Init(&s_logger, "log.log", LOGGER_LEVEL_DEBUG, 4096, 3);
    Logger_Startup(&s_logger);
    
    MSG Msg;
    if(!hPrevInstance){
        if(Register(hInst)==FALSE){
            return FALSE;
        }
    }
    s_MainWindow = Create(hInst, nCmdShow);
    if(!s_MainWindow) return FALSE;
    while(GetMessage(&Msg, NULL, 0, 0)){
        TranslateMessage(&Msg);
        DispatchMessage(&Msg);
    }
    return (int)Msg.wParam;
}




