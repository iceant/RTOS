#ifndef INCLUDED_CPU_HARDFAULT_C_H
#define INCLUDED_CPU_HARDFAULT_C_H


#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#if defined(CPU_HARDFAULT_ENABLE) && (CPU_HARDFAULT_ENABLE==1)

////////////////////////////////////////////////////////////////////////////////
////

typedef void (*cpu_exception_handler_t)(void*);
extern cpu_exception_handler_t cpu_exception_handler;

////////////////////////////////////////////////////////////////////////////////
////

typedef struct ContextStateFrame {
    uint32_t r0;
    uint32_t r1;
    uint32_t r2;
    uint32_t r3;
    uint32_t r12;
    uint32_t lr;
    uint32_t pc;
    uint32_t xpsr;
} sContextStateFrame;

////////////////////////////////////////////////////////////////////////////////
////


void HardFault_Handler_C(sContextStateFrame * frame, unsigned int lr_value);

#endif

#endif /*INCLUDED_CPU_HARDFAULT_C_H*/
