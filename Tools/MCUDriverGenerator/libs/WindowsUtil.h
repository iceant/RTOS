#ifndef INCLUDED_WINDOWSUTIL_H
#define INCLUDED_WINDOWSUTIL_H

#ifndef INCLUDED_WINDOWS_H
#define INCLUDED_WINDOWS_H
#include <windows.h>
#endif /* INCLUDED_WINDOWS_H */

////////////////////////////////////////////////////////////////////////////////
////

TCHAR* WindowsUtil_GetCurrentDirectory(void);

void WindowsUtil_Free(void* memory);

#endif /* INCLUDED_WINDOWSUTIL_H */
