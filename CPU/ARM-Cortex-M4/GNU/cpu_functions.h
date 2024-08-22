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

C_STATIC_FORCEINLINE void cpu_enable_irq(void)
{
    C_ASM volatile ("cpsie i" : : : "memory");
}

C_STATIC_FORCEINLINE void cpu_disable_irq(void)
{
    C_ASM volatile ("cpsid i" : : : "memory");
}

C_STATIC_FORCEINLINE uint32_t cpu_get_control(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, control" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_control(uint32_t control)
{
    C_ASM volatile ("MSR control, %0" : : "r" (control) : "memory");
}

C_STATIC_FORCEINLINE uint32_t cpu_get_ipsr(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, ipsr" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_apsr(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, apsr" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_xpsr(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, xpsr" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE uint32_t cpu_get_psp(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, psp"  : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_psp(uint32_t topOfProcStack)
{
    C_ASM volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}

C_STATIC_FORCEINLINE uint32_t cpu_get_msp(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, msp" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_msp(uint32_t topOfMainStack)
{
    C_ASM volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}

C_STATIC_FORCEINLINE uint32_t cpu_get_primask(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, primask" : "=r" (result) :: "memory");
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_primask(uint32_t priMask)
{
    C_ASM volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}

C_STATIC_FORCEINLINE void cpu_enable_fault_irq(void)
{
    C_ASM volatile ("cpsie f" : : : "memory");
}

C_STATIC_FORCEINLINE void cpu_disable_fault_irq(void)
{
    C_ASM volatile ("cpsid f" : : : "memory");
}

C_STATIC_FORCEINLINE uint32_t cpu_get_basepri(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, basepri" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_basepri(uint32_t basePri)
{
    C_ASM volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}

C_STATIC_FORCEINLINE uint32_t cpu_get_faultmask(void)
{
    uint32_t result;

    C_ASM volatile ("MRS %0, faultmask" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_faultmask(uint32_t faultMask)
{
    C_ASM volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}

C_STATIC_FORCEINLINE uint32_t cpu_get_fpscr(void)
{
    uint32_t result;

    C_ASM volatile ("VMRS %0, fpscr" : "=r" (result) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_set_fpscr(uint32_t fpscr)
{
#if __has_builtin(__builtin_arm_set_fpscr)
    __builtin_arm_set_fpscr(fpscr);
#else
    C_ASM volatile ("VMSR fpscr, %0" : : "r" (fpscr) : "vfpcc", "memory");
#endif
}

////////////////////////////////////////////////////////////////////////////////
////
#define cpu_nop()                            C_ASM volatile ("nop")
#define cpu_wfi()                            C_ASM volatile ("wfi")
#define cpu_wfe()                            C_ASM volatile ("wfe")
#define cpu_sev()                            C_ASM volatile ("sev")

#define CPU_CMSIS_GCC_OUT_REG(r) "=r" (r)
#define CPU_CMSIS_GCC_RW_REG(r) "+r" (r)
#define CPU_CMSIS_GCC_USE_REG(r) "r" (r)

C_STATIC_FORCEINLINE void cpu_isb(void)
{
    C_ASM volatile ("isb 0xF":::"memory");
}

C_STATIC_FORCEINLINE void cpu_dsb(void)
{
    C_ASM volatile ("dsb 0xF":::"memory");
}

C_STATIC_FORCEINLINE void cpu_dmb(void)
{
    C_ASM volatile ("dmb 0xF":::"memory");
}

C_STATIC_FORCEINLINE uint32_t cpu_rev(uint32_t value)
{
#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
return __builtin_bswap32(value);
#else
  uint32_t result;
  C_ASM volatile ("rev %0, %1" : CPU_CMSIS_GCC_OUT_REG (result) : CPU_CMSIS_GCC_USE_REG (value) );
  return result;
#endif
}

C_STATIC_FORCEINLINE uint32_t cpu_rev16(uint32_t value)
{
    uint32_t result;
    C_ASM volatile ("rev16 %0, %1" : CPU_CMSIS_GCC_OUT_REG (result) : CPU_CMSIS_GCC_USE_REG (value) );
    return result;
}

C_STATIC_FORCEINLINE int16_t cpu_revsh(int16_t value)
{
#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
return (int16_t)__builtin_bswap16(value);
#else
  int16_t result;
  C_ASM volatile ("revsh %0, %1" : CPU_CMSIS_GCC_OUT_REG (result) : CPU_CMSIS_GCC_USE_REG (value) );
  return result;
#endif
}

C_STATIC_FORCEINLINE uint32_t cpu_ror(uint32_t op1, uint32_t op2)
{
    op2 %= 32U;
    if (op2 == 0U)
    {
        return op1;
    }
    return (op1 >> op2) | (op1 << (32U - op2));
}

#define cpu_bkpt(value)                       C_ASM volatile ("bkpt "#value)


C_STATIC_FORCEINLINE uint32_t cpu_rbit(uint32_t value)
{
    uint32_t result;
    C_ASM volatile ("rbit %0, %1" : "=r" (result) : "r" (value) );
    return result;
}

#define cpu_clz (uint8_t)__builtin_clz

C_STATIC_FORCEINLINE uint8_t cpu_ldrexb(volatile uint8_t *addr)
{
    uint32_t result;
    C_ASM volatile ("ldrexb %0, %1" : "=r" (result) : "Q" (*addr) );
//    C_ASM volatile ("ldrexb %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
    return ((uint8_t) result);    /* Add explicit type cast here */
}

C_STATIC_FORCEINLINE uint16_t cpu_ldrexh(volatile uint16_t *addr)
{
    uint32_t result;
    C_ASM volatile ("ldrexh %0, %1" : "=r" (result) : "Q" (*addr) );
//    C_ASM volatile ("ldrexh %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
    return ((uint16_t) result);    /* Add explicit type cast here */
}

C_STATIC_FORCEINLINE uint32_t cpu_ldrexw(volatile uint32_t *addr)
{
    uint32_t result;
    C_ASM volatile ("ldrex %0, %1" : "=r" (result) : "Q" (*addr) );
//    C_ASM volatile ("ldrex %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
    return(result);
}

C_STATIC_FORCEINLINE uint32_t cpu_strexb(uint8_t value, volatile uint8_t *addr)
{
    uint32_t result;
    C_ASM volatile ("strexb %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
//    C_ASM volatile ("strexb %0, %2, [%1]" : "=&r" (result), "=r" (addr) : "r" ((uint32_t)value) );
    return(result);
}

C_STATIC_FORCEINLINE uint32_t cpu_strexh(uint16_t value, volatile uint16_t *addr)
{
    uint32_t result;
    C_ASM volatile ("strexh %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
    return(result);
}

C_STATIC_FORCEINLINE uint32_t cpu_strexw(uint32_t value, volatile uint32_t *addr)
{
    uint32_t result;
    C_ASM volatile ("strex %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" (value) );
    return(result);
}

C_STATIC_FORCEINLINE void cpu_clrex(void)
{
    C_ASM volatile ("clrex" ::: "memory");
}

/* -------------------------------------------------------------------------------------------------------------- */


#endif /*INCLUDED_CPU_FUNCTIONS_H*/
