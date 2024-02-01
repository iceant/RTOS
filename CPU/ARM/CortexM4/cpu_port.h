#ifndef INCLUDED_CPU_PORT_H
#define INCLUDED_CPU_PORT_H

#define CPU_32BIT
#define CPU_CLZ_ASM_PRESENT
#define CPU_ALIGN_SIZE          4

#ifndef CPU_TICKS_PER_SECOND
#define CPU_TICKS_PER_SECOND    100
#endif


////////////////////////////////////////////////////////////////////////////////
////
typedef unsigned char   cpu_uint8_t;
typedef char            cpu_int8_t;
typedef unsigned short  cpu_uint16_t;
typedef short           cpu_int16_t;
typedef unsigned long   cpu_uint_t;
typedef long            cpu_int_t;
typedef cpu_uint_t      cpu_uintptr_t;
typedef cpu_int_t       cpu_intptr_t;


////////////////////////////////////////////////////////////////////////////////
////
#define CPU_REG(ADDRESS)  (*((volatile cpu_uintptr_t *)(ADDRESS)))

#define SCB_ICSR  0xE000ED04

#ifndef SCB_ICSR_PENDSVSET_Msk
#define SCB_ICSR_PENDSVSET_Msk 0x10000000
#endif

////////////////////////////////////////////////////////////////////////////////
//// GET CPU Register Value, USE ASM
extern cpu_uintptr_t cpu_reg_IPSR(void);
extern cpu_uintptr_t cpu_reg_CONTROL(void);

////////////////////////////////////////////////////////////////////////////////
////
#if defined(__GNUC__)
#define __svc(sNum) __asm volatile("SVC %0" ::"M" (sNum))
#endif


#endif /*INCLUDED_CPU_PORT_H*/




