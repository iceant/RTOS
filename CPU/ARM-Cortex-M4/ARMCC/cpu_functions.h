#ifndef INCLUDED_CPU_FUNCTIONS_H
#define INCLUDED_CPU_FUNCTIONS_H

#ifndef INCLUDED_C_COM
#include <c_compiler.h>
#endif /*INCLUDED_C_COM*/

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
////
extern int __disable_fiq(void);
extern void __enable_fiq(void);
extern int __disable_irq(void);
extern void __enable_irq(void);
extern unsigned char __clz(unsigned int val);
extern void __wfi(void);
extern unsigned int __ldrex(volatile void *ptr);
extern int __strex(unsigned int val, volatile void *ptr);
extern void __clrex(void);
extern unsigned int __rbit(unsigned int val);
extern void __wfe(void);
extern void __sev(void);
extern void __schedule_barrier(void);

/* -------------------------------------------------------------------------------------------------------------- */
/* FUNCTIONS */

#define cpu_disable_irq() __disable_irq()
#define cpu_enable_irq() __enable_irq()


C_STATIC_FORCEINLINE uint32_t cpu_get_control(void)
{
    register uint32_t __regControl         C_ASM("control");
    return(__regControl);
}

C_STATIC_FORCEINLINE void cpu_set_control(uint32_t control)
{
    register uint32_t __regControl         C_ASM("control");
    __regControl = control;
}

C_STATIC_FORCEINLINE uint32_t cpu_get_ipsr(void)
{
    register uint32_t __regIPSR          C_ASM("ipsr");
    return(__regIPSR);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_apsr(void)
{
    register uint32_t __regAPSR          C_ASM("apsr");
    return(__regAPSR);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_xpsr(void)
{
    register uint32_t __regXPSR          C_ASM("xpsr");
    return(__regXPSR);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_psp(void)
{
    register uint32_t __regProcessStackPointer  C_ASM("psp");
    return(__regProcessStackPointer);
}

C_STATIC_FORCEINLINE void cpu_set_psp(uint32_t topOfProcStack)
{
    register uint32_t __regProcessStackPointer  C_ASM("psp");
    __regProcessStackPointer = topOfProcStack;
}

C_STATIC_FORCEINLINE uint32_t cpu_get_msp(void)
{
    register uint32_t __regMainStackPointer     C_ASM("msp");
    return(__regMainStackPointer);
}

C_STATIC_FORCEINLINE void cpu_set_msp(uint32_t topOfMainStack)
{
    register uint32_t __regMainStackPointer     C_ASM("msp");
    __regMainStackPointer = topOfMainStack;
}

C_STATIC_FORCEINLINE uint32_t cpu_get_primask(void)
{
    register uint32_t __regPriMask         C_ASM("primask");
    return(__regPriMask);
}

C_STATIC_FORCEINLINE void cpu_set_primask(uint32_t priMask)
{
    register uint32_t __regPriMask         C_ASM("primask");
    __regPriMask = (priMask);
}

#define cpu_enable_fault_irq    __enable_fiq
#define cpu_disable_fault_irq   __disable_fiq


C_STATIC_FORCEINLINE uint32_t cpu_get_basepri(void)
{
    register uint32_t __regBasePri         C_ASM("basepri");
    return(__regBasePri);
}

C_STATIC_FORCEINLINE void cpu_set_basepri(uint32_t basePri)
{
    register uint32_t __regBasePri         C_ASM("basepri");
    __regBasePri = (basePri & 0xFFU);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_faultmask(void)
{
    register uint32_t __regFaultMask       C_ASM("faultmask");
    return(__regFaultMask);
}

C_STATIC_FORCEINLINE void cpu_set_faultmask(uint32_t faultMask)
{
    register uint32_t __regFaultMask       C_ASM("faultmask");
    __regFaultMask = (faultMask & (uint32_t)1U);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_fpscr(void)
{
    register uint32_t __regfpscr         C_ASM("fpscr");
    return(__regfpscr);
}

C_STATIC_FORCEINLINE void cpu_set_fpscr(uint32_t fpscr)
{
    register uint32_t __regfpscr         C_ASM("fpscr");
    __regfpscr = (fpscr);
}

////////////////////////////////////////////////////////////////////////////////
////
#define cpu_nop()                            __nop
#define cpu_wfi()                            __wfi
#define cpu_wfe()                            __wfe
#define cpu_sev()                            __sev


#define cpu_isb() do {\
                   __schedule_barrier();\
                   __isb(0xF);\
                   __schedule_barrier();\
                } while (0U)

#define cpu_dsb() do {\
                   __schedule_barrier();\
                   __dsb(0xF);\
                   __schedule_barrier();\
                } while (0U)

#define cpu_dmb() C_ASM{DMB 0xF}

#define cpu_rev __rev

C_SECTION(.rev16_text) C_STATIC_FORCEINLINE C_ASM uint32_t cpu_rev16(uint32_t value)
{
    rev16 r0, r0
    bx lr
}

C_SECTION(.revsh_text) C_STATIC_FORCEINLINE C_ASM int32_t cpu_revsh(int32_t value)
{
    revsh r0, r0
    bx lr
}

#define cpu_ror                             __ror
#define cpu_bkpt(value)                     __breakpoint(value)
#define cpu_rbit                            __rbit
#define cpu_clz                             (uint8_t)__clz

#define cpu_ldrexb(ptr)                     ((uint8_t ) __ldrex(ptr))
#define cpu_ldrexh(ptr)                     ((uint16_t ) __ldrex(ptr))
#define cpu_ldrexw(ptr)                     ((uint32_t ) __ldrex(ptr))

#define cpu_strexb(value, ptr)              __strex(value, ptr)
#define cpu_strexh(value, ptr)              __strex(value, ptr)
#define cpu_strexw(value, ptr)              __strex(value, ptr)
#define cpu_clrex                           __clrex

/* -------------------------------------------------------------------------------------------------------------- */

#define cpu_svc(n) __asm{SVC n}

C_STATIC_FORCEINLINE cpu_uint_t cpu_local_irq_save(void){
    cpu_uint_t value = cpu_get_primask();
    cpu_disable_irq();
    return value;
}

C_STATIC_FORCEINLINE void cpu_local_irq_restore(cpu_uint_t value){
    cpu_set_primask(value);
    cpu_enable_irq();
}

#endif /*INCLUDED_CPU_FUNCTIONS_H*/
