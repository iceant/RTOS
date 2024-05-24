#ifndef INCLUDED_CPU_FUNCTIONS_H
#define INCLUDED_CPU_FUNCTIONS_H

#ifndef INCLUDED_RTOS_COMPILER_H
#include <rtos_compiler.h>
#endif /*INCLUDED_RTOS_COMPILER_H*/

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_REGISTERS_H
#include <cpu_registers.h>
#endif /*INCLUDED_CPU_REGISTERS_H*/



////////////////////////////////////////////////////////////////////////////////
////

#define __has_builtin(x) 0

/**
  \brief   Enable IRQ Interrupts
  \details Enables IRQ interrupts by clearing the I-bit in the CPSR.
           Can only be executed in Privileged modes.
 */
C__STATIC_FORCEINLINE void cpu_enable_irq(void)
{
    C__ASM volatile ("cpsie i" : : : "memory");
}


/**
  \brief   Disable IRQ Interrupts
  \details Disables IRQ interrupts by setting the I-bit in the CPSR.
           Can only be executed in Privileged modes.
 */
C__STATIC_FORCEINLINE void cpu_disable_irq(void)
{
    C__ASM volatile ("cpsid i" : : : "memory");
}

/**
  \brief   Get Control Register
  \details Returns the content of the Control Register.
  \return               Control Register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_CONTROL(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, control" : "=r" (result) );
    return(result);
}



/**
  \brief   Set Control Register
  \details Writes the given value to the Control Register.
  \param [in]    control  Control Register value to set
 */
C__STATIC_FORCEINLINE void cpu_set_CONTROL(uint32_t control)
{
    C__ASM volatile ("MSR control, %0" : : "r" (control) : "memory");
}

/**
  \brief   Get IPSR Register
  \details Returns the content of the IPSR Register.
  \return               IPSR Register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_IPSR(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, ipsr" : "=r" (result) );
    return(result);
}



/**
  \brief   Get APSR Register
  \details Returns the content of the APSR Register.
  \return               APSR Register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_APSR(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, apsr" : "=r" (result) );
    return(result);
}


/**
  \brief   Get xPSR Register
  \details Returns the content of the xPSR Register.
  \return               xPSR Register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_xPSR(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, xpsr" : "=r" (result) );
    return(result);
}

/**
  \brief   Get Process Stack Pointer
  \details Returns the current value of the Process Stack Pointer (PSP).
  \return               PSP Register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_PSP(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, psp"  : "=r" (result) );
    return(result);
}

/**
  \brief   Set Process Stack Pointer
  \details Assigns the given value to the Process Stack Pointer (PSP).
  \param [in]    topOfProcStack  Process Stack Pointer value to set
 */
C__STATIC_FORCEINLINE void cpu_set_PSP(uint32_t topOfProcStack)
{
    C__ASM volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}

/**
  \brief   Get Main Stack Pointer
  \details Returns the current value of the Main Stack Pointer (MSP).
  \return               MSP Register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_MSP(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, msp" : "=r" (result) );
    return(result);
}


/**
  \brief   Set Main Stack Pointer
  \details Assigns the given value to the Main Stack Pointer (MSP).
  \param [in]    topOfMainStack  Main Stack Pointer value to set
 */
C__STATIC_FORCEINLINE void cpu_set_MSP(uint32_t topOfMainStack)
{
    C__ASM volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}

/**
  \brief   Get Priority Mask
  \details Returns the current state of the priority mask bit from the Priority Mask Register.
  \return               Priority Mask value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_PRIMASK(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, primask" : "=r" (result) :: "memory");
    return(result);
}


/**
  \brief   Set Priority Mask
  \details Assigns the given value to the Priority Mask Register.
  \param [in]    priMask  Priority Mask
 */
C__STATIC_FORCEINLINE void cpu_set_PRIMASK(uint32_t priMask)
{
    C__ASM volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}

/**
  \brief   Enable FIQ
  \details Enables FIQ interrupts by clearing the F-bit in the CPSR.
           Can only be executed in Privileged modes.
 */
C__STATIC_FORCEINLINE void cpu_enable_fault_irq(void)
{
    C__ASM volatile ("cpsie f" : : : "memory");
}


/**
  \brief   Disable FIQ
  \details Disables FIQ interrupts by setting the F-bit in the CPSR.
           Can only be executed in Privileged modes.
 */
C__STATIC_FORCEINLINE void cpu_disable_fault_irq(void)
{
    C__ASM volatile ("cpsid f" : : : "memory");
}

/**
  \brief   Get Base Priority
  \details Returns the current value of the Base Priority register.
  \return               Base Priority register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_BASEPRI(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, basepri" : "=r" (result) );
    return(result);
}

/**
  \brief   Set Base Priority
  \details Assigns the given value to the Base Priority register.
  \param [in]    basePri  Base Priority value to set
 */
C__STATIC_FORCEINLINE void cpu_set_BASEPRI(uint32_t basePri)
{
    C__ASM volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}

/**
  \brief   Get Fault Mask
  \details Returns the current value of the Fault Mask register.
  \return               Fault Mask register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_FAULTMASK(void)
{
    uint32_t result;
    
    C__ASM volatile ("MRS %0, faultmask" : "=r" (result) );
    return(result);
}

/**
  \brief   Set Fault Mask
  \details Assigns the given value to the Fault Mask register.
  \param [in]    faultMask  Fault Mask value to set
 */
C__STATIC_FORCEINLINE void cpu_set_FAULTMASK(uint32_t faultMask)
{
    C__ASM volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}



/**
  \brief   Get FPSCR
  \details Returns the current value of the Floating Point Status/Control register.
  \return               Floating Point Status/Control register value
 */
C__STATIC_FORCEINLINE uint32_t cpu_get_FPSCR(void)
{
#if ((defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)) && \
     (defined (__FPU_USED   ) && (__FPU_USED    == 1U))     )
    #if __has_builtin(__builtin_arm_get_fpscr)
// Re-enable using built-in when GCC has been fixed
// || (__GNUC__ > 7) || (__GNUC__ == 7 && __GNUC_MINOR__ >= 2)
  /* see https://gcc.gnu.org/ml/gcc-patches/2017-04/msg00443.html */
  return __builtin_arm_get_fpscr();
#else
  uint32_t result;

  C__ASM volatile ("VMRS %0, fpscr" : "=r" (result) );
  return(result);
#endif
#else
    return(0U);
#endif
}

/**
  \brief   Set FPSCR
  \details Assigns the given value to the Floating Point Status/Control register.
  \param [in]    fpscr  Floating Point Status/Control value to set
 */
C__STATIC_FORCEINLINE void cpu_set_FPSCR(uint32_t fpscr)
{
#if ((defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)) && \
     (defined (__FPU_USED   ) && (__FPU_USED    == 1U))     )
    #if __has_builtin(__builtin_arm_set_fpscr)
// Re-enable using built-in when GCC has been fixed
// || (__GNUC__ > 7) || (__GNUC__ == 7 && __GNUC_MINOR__ >= 2)
  /* see https://gcc.gnu.org/ml/gcc-patches/2017-04/msg00443.html */
  __builtin_arm_set_fpscr(fpscr);
#else
  C__ASM volatile ("VMSR fpscr, %0" : : "r" (fpscr) : "vfpcc", "memory");
#endif
#else
    (void)fpscr;
#endif
}


/**
  \brief   No Operation
  \details No Operation does nothing. This instruction can be used for code alignment purposes.
 */
#define cpu_NOP()                             C__ASM volatile ("nop")

/**
  \brief   Wait For Interrupt
  \details Wait For Interrupt is a hint instruction that suspends execution until one of a number of events occurs.
 */
#define cpu_WFI()                             C__ASM volatile ("wfi")


/**
  \brief   Wait For Event
  \details Wait For Event is a hint instruction that permits the processor to enter
           a low-power state until one of a number of events occurs.
 */
#define cpu_WFE()                             C__ASM volatile ("wfe")


/**
  \brief   Send Event
  \details Send Event is a hint instruction. It causes an event to be signaled to the CPU.
 */
#define cpu_SEV()                             C__ASM volatile ("sev")


/**
  \brief   Instruction Synchronization Barrier
  \details Instruction Synchronization Barrier flushes the pipeline in the processor,
           so that all instructions following the ISB are fetched from cache or memory,
           after the instruction has been completed.
 */
C__STATIC_FORCEINLINE void cpu_ISB(void)
{
    C__ASM volatile ("isb 0xF":::"memory");
}


/**
  \brief   Data Synchronization Barrier
  \details Acts as a special kind of Data Memory Barrier.
           It completes when all explicit memory accesses before this instruction complete.
 */
C__STATIC_FORCEINLINE void cpu_DSB(void)
{
    C__ASM volatile ("dsb 0xF":::"memory");
}


/**
  \brief   Data Memory Barrier
  \details Ensures the apparent order of the explicit memory operations before
           and after the instruction, without ensuring their completion.
 */
C__STATIC_FORCEINLINE void cpu_DMB(void)
{
    C__ASM volatile ("dmb 0xF":::"memory");
}



/**
  \brief   Breakpoint
  \details Causes the processor to enter Debug state.
           Debug tools can use this to investigate system state when the instruction at a particular address is reached.
  \param [in]    value  is ignored by the processor.
                 If required, a debugger can use it to store additional information about the breakpoint.
 */
#define cpu_BKPT(value)                       C__ASM volatile ("bkpt "#value)


/**
  \brief   Reverse bit order of value
  \details Reverses the bit order of the given value.
  \param [in]    value  Value to reverse
  \return               Reversed value
 */
C__STATIC_FORCEINLINE uint32_t cpu_RBIT(uint32_t value)
{
    uint32_t result;
    C__ASM volatile ("rbit %0, %1" : "=r" (result) : "r" (value) );
    return result;
}

/**
  \brief   Count leading zeros
  \details Counts the number of leading zeros of a data value.
  \param [in]  value  Value to count the leading zeros
  \return             number of leading zeros in value
 */
#define cpu_CLZ             (uint8_t)__builtin_clz

/**
  \brief   LDR Exclusive (8 bit)
  \details Executes a exclusive LDR instruction for 8 bit value.
  \param [in]    ptr  Pointer to data
  \return             value of type uint8_t at (*ptr)
 */
C__STATIC_FORCEINLINE uint8_t cpu_LDREXB(volatile uint8_t *addr)
{
    uint32_t result;

#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
    C__ASM volatile ("ldrexb %0, %1" : "=r" (result) : "Q" (*addr) );
#else
    /* Prior to GCC 4.8, "Q" will be expanded to [rx, #0] which is not
       accepted by assembler. So has to use following less efficient pattern.
    */
   C__ASM volatile ("ldrexb %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
#endif
    return ((uint8_t) result);    /* Add explicit type cast here */
}


/**
  \brief   LDR Exclusive (16 bit)
  \details Executes a exclusive LDR instruction for 16 bit values.
  \param [in]    ptr  Pointer to data
  \return        value of type uint16_t at (*ptr)
 */
C__STATIC_FORCEINLINE uint16_t cpu_LDREXH(volatile uint16_t *addr)
{
    uint32_t result;

#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
    C__ASM volatile ("ldrexh %0, %1" : "=r" (result) : "Q" (*addr) );
#else
    /* Prior to GCC 4.8, "Q" will be expanded to [rx, #0] which is not
       accepted by assembler. So has to use following less efficient pattern.
    */
   C__ASM volatile ("ldrexh %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
#endif
    return ((uint16_t) result);    /* Add explicit type cast here */
}


/**
  \brief   LDR Exclusive (32 bit)
  \details Executes a exclusive LDR instruction for 32 bit values.
  \param [in]    ptr  Pointer to data
  \return        value of type uint32_t at (*ptr)
 */
C__STATIC_FORCEINLINE uint32_t cpu_LDREXW(volatile uint32_t *addr)
{
    uint32_t result;
    
    C__ASM volatile ("ldrex %0, %1" : "=r" (result) : "Q" (*addr) );
    return(result);
}


/**
  \brief   STR Exclusive (8 bit)
  \details Executes a exclusive STR instruction for 8 bit values.
  \param [in]  value  Value to store
  \param [in]    ptr  Pointer to location
  \return          0  Function succeeded
  \return          1  Function failed
 */
C__STATIC_FORCEINLINE uint32_t cpu_STREXB(uint8_t value, volatile uint8_t *addr)
{
uint32_t result;

C__ASM volatile ("strexb %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
return(result);
}


/**
  \brief   STR Exclusive (16 bit)
  \details Executes a exclusive STR instruction for 16 bit values.
  \param [in]  value  Value to store
  \param [in]    ptr  Pointer to location
  \return          0  Function succeeded
  \return          1  Function failed
 */
C__STATIC_FORCEINLINE uint32_t cpu_STREXH(uint16_t value, volatile uint16_t *addr)
{
uint32_t result;

C__ASM volatile ("strexh %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
return(result);
}


/**
  \brief   STR Exclusive (32 bit)
  \details Executes a exclusive STR instruction for 32 bit values.
  \param [in]  value  Value to store
  \param [in]    ptr  Pointer to location
  \return          0  Function succeeded
  \return          1  Function failed
 */
C__STATIC_FORCEINLINE uint32_t cpu_STREXW(uint32_t value, volatile uint32_t *addr)
{
uint32_t result;

C__ASM volatile ("strex %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" (value) );
return(result);
}


/**
  \brief   Remove the exclusive lock
  \details Removes the exclusive lock which is created by LDREX.
 */
C__STATIC_FORCEINLINE void cpu_CLREX(void)
{
    C__ASM volatile ("clrex" ::: "memory");
}

////////////////////////////////////////////////////////////////////////////////
////

C__STATIC_FORCEINLINE int cpu_in_privilege(void){
    if(cpu_get_IPSR()!=0) return  1;
    else if((cpu_get_CONTROL() & 0x01)==0) return 1;
    else return 0;
}


C__STATIC_FORCEINLINE void cpu_reboot(void)
{
    cpu_DSB();                                                      /* Ensure all outstanding memory accesses included
                                                                       buffered write are completed before reset */
    CPU_REG(SCB_AIRCR)  = (uint32_t)((0x5FAUL << SCB_AIRCR_VECTKEY_Pos)    |
                                     (CPU_REG(SCB_AIRCR) & SCB_AIRCR_PRIGROUP_Msk) |
                                     SCB_AIRCR_SYSRESETREQ_Msk    );    /* Keep priority group unchanged */
    cpu_DSB();                                                          /* Ensure completion of memory access */
    
    for(;;)                                                           /* wait until reset */
    {
        cpu_NOP();
    }
}

#endif /*INCLUDED_CPU_FUNCTIONS_H*/
