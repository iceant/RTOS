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

#define cpu_enable_irq __enable_irq
#define cpu_disable_irq __disable_irq

C_STATIC_FORCEINLINE uint32_t cpu_get_control(void)
{
    register uint32_t __regControl         C_ASN("control");
    return(__regControl);
}

C_STATIC_FORCEINLINE void cpu_set_control(uint32_t control)
{
    register uint32_t __regControl         C_ASN("control");
    __regControl = control;
}

C_STATIC_FORCEINLINE uint32_t cpu_get_ipsr(void)
{
    register uint32_t __regIPSR          C_ASN("ipsr");
    return(__regIPSR);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_apsr(void)
{
    register uint32_t __regAPSR          C_ASN("apsr");
    return(__regAPSR);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_xpsr(void)
{
    register uint32_t __regXPSR          C_ASN("xpsr");
    return(__regXPSR);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_psp(void)
{
    register uint32_t __regProcessStackPointer  C_ASN("psp");
    return(__regProcessStackPointer);
}

C_STATIC_FORCEINLINE void cpu_set_psp(uint32_t topOfProcStack)
{
    register uint32_t __regProcessStackPointer  C_ASN("psp");
    __regProcessStackPointer = topOfProcStack;
}

C_STATIC_FORCEINLINE uint32_t cpu_get_msp(void)
{
    register uint32_t __regMainStackPointer     C_ASN("msp");
    return(__regMainStackPointer);
}

C_STATIC_FORCEINLINE void cpu_set_msp(uint32_t topOfMainStack)
{
    register uint32_t __regMainStackPointer     C_ASN("msp");
    __regMainStackPointer = topOfMainStack;
}

C_STATIC_FORCEINLINE uint32_t cpu_get_primask(void)
{
    register uint32_t __regPriMask         C_ASN("primask");
    return(__regPriMask);
}

C_STATIC_FORCEINLINE void cpu_set_primask(uint32_t priMask)
{
    register uint32_t __regPriMask         C_ASN("primask");
    __regPriMask = (priMask);
}

#define cpu_enable_fault_irq    __enable_fiq
#define cpu_disable_fault_irq   __disable_fiq


C_STATIC_FORCEINLINE uint32_t cpu_get_basepri(void)
{
    register uint32_t __regBasePri         C_ASN("basepri");
    return(__regBasePri);
}

C_STATIC_FORCEINLINE void cpu_set_basepri(uint32_t basePri)
{
    register uint32_t __regBasePri         C_ASN("basepri");
    __regBasePri = (basePri & 0xFFU);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_faultmask(void)
{
    register uint32_t __regFaultMask       C_ASN("faultmask");
    return(__regFaultMask);
}

C_STATIC_FORCEINLINE void cpu_set_faultmask(uint32_t faultMask)
{
    register uint32_t __regFaultMask       C_ASN("faultmask");
    __regFaultMask = (faultMask & (uint32_t)1U);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_fpscr(void)
{
    register uint32_t __regfpscr         C_ASN("fpscr");
    return(__regfpscr);
}

C_STATIC_FORCEINLINE void cpu_set_fpscr(uint32_t fpscr)
{
    register uint32_t __regfpscr         C_ASN("fpscr");
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

#define cpu_dmb() do {\
                   __schedule_barrier();\
                   __dmb(0xF);\
                   __schedule_barrier();\
                } while (0U)

#define cpu_rev __rev

C_STATIC_FORCEINLINE uint32_t cpu_rev16(uint32_t value)
{
    uint32_t result;
    C_ASM volatile ("rev16 %0, %1" : CPU_CMSIS_GCC_OUT_REG (result) : CPU_CMSIS_GCC_USE_REG (value) );
    return result;
}

C_SECTION(.rev16_text) C_STATIC_FORCEINLINE C_ASN uint32_t cpu_rev16(uint32_t value)
{
    rev16 r0, r0
    bx lr
}

C_SECTION(.revsh_text) C_STATIC_FORCEINLINE C_ASN int16_t cpu_revsh(int16_t value)
{
    revsh r0, r0
    bx lr
}

#define cpu_ror                         __ror
#define cpu_bkpt(value)                 __breakpoint(value)
#define cpu_rbit                         __rbit
#define cpu_clz                         (uint8_t)__clz

#define cpu_ldrexb(ptr)          _Pragma("push") _Pragma("diag_suppress 3731") ((uint8_t ) __ldrex(ptr))  _Pragma("pop")
#define cpu_ldrexh(ptr)          _Pragma("push") _Pragma("diag_suppress 3731") ((uint16_t ) __ldrex(ptr))  _Pragma("pop")
#define cpu_ldrexw(ptr)          _Pragma("push") _Pragma("diag_suppress 3731") ((uint32_t ) __ldrex(ptr))  _Pragma("pop")

#define cpu_strexb(value, ptr)   _Pragma("push") _Pragma("diag_suppress 3731") __strex(value, ptr)        _Pragma("pop")
#define cpu_strexh(value, ptr)   _Pragma("push") _Pragma("diag_suppress 3731") __strex(value, ptr)        _Pragma("pop")
#define cpu_strexw(value, ptr)   _Pragma("push") _Pragma("diag_suppress 3731") __strex(value, ptr)        _Pragma("pop")
#define cpu_clrex                           __clrex

#endif /*INCLUDED_CPU_FUNCTIONS_H*/
