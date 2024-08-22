#ifndef INCLUDED_SDK_HEX_H
#define INCLUDED_SDK_HEX_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STDDEF_H
#define INCLUDED_STDDEF_H
#include <stddef.h>
#endif /*INCLUDED_STDDEF_H*/



////////////////////////////////////////////////////////////////////////////////
////

typedef void (*sdk_hex_printf)(const char* fmt, ...);

void sdk_hex_dump(void* data, size_t size, sdk_hex_printf put);


#endif /* INCLUDED_SDK_HEX_H */
