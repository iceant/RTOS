#include <WindowsUtil.h>

void WindowsUtil_Free(void* memory){
    if(memory) free(memory);
}

TCHAR* WindowsUtil_GetCurrentDirectory(void)
{
    DWORD size = GetCurrentDirectory(0, NULL);
    TCHAR* buffer = (TCHAR*) malloc(size * sizeof(TCHAR));
    DWORD result = GetCurrentDirectory(size, buffer);
    return buffer;
}



