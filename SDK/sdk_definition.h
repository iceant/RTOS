#ifndef INCLUDED_SDK_DEFINITION_H
#define INCLUDED_SDK_DEFINITION_H

////////////////////////////////////////////////////////////////////////////////
////

#if defined __has_include
#  if __has_include (<os_config.h>)
#    include <os_config.h>
#  endif
#endif

////////////////////////////////////////////////////////////////////////////////
////

#ifndef SDK_NAME_SIZE
#define SDK_NAME_SIZE 32
#endif

#ifndef sdk_fmt_putc
#define sdk_fmt_putc putc
#endif

#endif /*INCLUDED_SDK_DEFINITION_H*/
