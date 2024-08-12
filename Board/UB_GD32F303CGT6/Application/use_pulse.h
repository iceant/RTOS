#ifndef INCLUDED_USE_PULSE_H
#define INCLUDED_USE_PULSE_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/


////////////////////////////////////////////////////////////////////////////////
////

void use_pulse_init(void);

void use_pulse_generate(uint32_t nTick, uint32_t nCount);






#endif /*INCLUDED_USE_PULSE_H*/
