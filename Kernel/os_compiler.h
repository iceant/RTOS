#ifndef INCLUDED_OS_COMPILER_H
#define INCLUDED_OS_COMPILER_H

#if   defined ( __CC_ARM )
#include "compiler/os_armcc.h"
#elif defined (__ARMCC_VERSION) && (__ARMCC_VERSION >= 6010050)
#include "compiler/os_armclang.h"
#elif defined ( __GNUC__ )
#include "compiler/os_gcc.h"
#elif defined ( __ICCARM__ )
#include "compiler/os_iccarm.h"
#elif defined ( __TI_ARM__ )
#include "compiler/os_tiarm.h"
#elif defined ( __TASKING__ )
#include "compiler/os_tasking.h"
#elif defined ( __CSMC__ )
#include "compiler/os_csmc.h"
#else
  #error Unknown compiler.
#endif


#endif /*INCLUDED_OS_COMPILER_H*/
