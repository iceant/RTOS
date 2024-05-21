#ifndef INCLUDED_CPU_FUNCTIONS_H
#define INCLUDED_CPU_FUNCTIONS_H

////////////////////////////////////////////////////////////////////////////////
////
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

#define cpu_disable_irq() __disable_irq()

#define cpu_enable_irq() __enable_irq()

C__STATIC_FORCEINLINE cpu_uint_t cpu_get_CONTROL(void)
{
    register cpu_uint_t __regControl C__ASM("control");
    return __regControl;
}

/**
  \brief   Set Control Register
  \details Writes the given value to the Control Register.
  \param [in]    control  Control Register value to set
 */
C__STATIC_INLINE void cpu_set_CONTROL(uint32_t control)
{
    register cpu_uint_t __regControl  C__ASM("control");
    __regControl = control;
}



/**
  \brief   Get IPSR Register
  \details Returns the content of the IPSR Register.
  \return               IPSR Register value
 */
C__STATIC_FORCEINLINE cpu_uint_t cpu_get_IPSR(void)
{
    register cpu_uint_t __regIPSR C__ASM("ipsr");
    return(__regIPSR);
}

/**
  \brief   Get APSR Register
  \details Returns the content of the APSR Register.
  \return               APSR Register value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_APSR(void)
{
    register cpu_uint_t __regAPSR          C__ASM("apsr");
    return(__regAPSR);
}

/**
  \brief   Get xPSR Register
  \details Returns the content of the xPSR Register.
  \return               xPSR Register value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_xPSR(void)
{
    register cpu_uint_t __regXPSR          C__ASM("xpsr");
    return(__regXPSR);
}

/**
  \brief   Get Process Stack Pointer
  \details Returns the current value of the Process Stack Pointer (PSP).
  \return               PSP Register value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_PSP(void)
{
    register cpu_uint_t __regProcessStackPointer  C__ASM("psp");
    return(__regProcessStackPointer);
}

/**
  \brief   Set Process Stack Pointer
  \details Assigns the given value to the Process Stack Pointer (PSP).
  \param [in]    topOfProcStack  Process Stack Pointer value to set
 */
C__STATIC_INLINE void cpu_set_PSP(uint32_t topOfProcStack)
{
    register cpu_uint_t __regProcessStackPointer  C__ASM("psp");
    __regProcessStackPointer = topOfProcStack;
}


/**
  \brief   Get Main Stack Pointer
  \details Returns the current value of the Main Stack Pointer (MSP).
  \return               MSP Register value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_MSP(void)
{
    register cpu_uint_t  __regMainStackPointer     C__ASM("msp");
    return(__regMainStackPointer);
}


/**
  \brief   Set Main Stack Pointer
  \details Assigns the given value to the Main Stack Pointer (MSP).
  \param [in]    topOfMainStack  Main Stack Pointer value to set
 */
C__STATIC_INLINE void cpu_set_MSP(cpu_uint_t topOfMainStack)
{
    register cpu_uint_t __regMainStackPointer     C__ASM("msp");
    __regMainStackPointer = topOfMainStack;
}

/**
  \brief   Get Priority Mask
  \details Returns the current state of the priority mask bit from the Priority Mask Register.
  \return               Priority Mask value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_PRIMASK(void)
{
    register cpu_uint_t __regPriMask         C__ASM("primask");
    return(__regPriMask);
}


/**
  \brief   Set Priority Mask
  \details Assigns the given value to the Priority Mask Register.
  \param [in]    priMask  Priority Mask
 */
C__STATIC_INLINE void cpu_set_PRIMASK(cpu_uint_t priMask)
{
    register cpu_uint_t __regPriMask         C__ASM("primask");
    __regPriMask = (priMask);
}

/**
  \brief   Enable FIQ
  \details Enables FIQ interrupts by clearing the F-bit in the CPSR.
           Can only be executed in Privileged modes.
 */
#define cpu_enable_fault_irq                __enable_fiq


/**
  \brief   Disable FIQ
  \details Disables FIQ interrupts by setting the F-bit in the CPSR.
           Can only be executed in Privileged modes.
 */
#define cpu_disable_fault_irq               __disable_fiq


/**
  \brief   Get Base Priority
  \details Returns the current value of the Base Priority register.
  \return               Base Priority register value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_BASEPRI(void)
{
    register cpu_uint_t __regBasePri         C__ASM("basepri");
    return(__regBasePri);
}


/**
  \brief   Set Base Priority
  \details Assigns the given value to the Base Priority register.
  \param [in]    basePri  Base Priority value to set
 */
C__STATIC_INLINE void cpu_set_BASEPRI(cpu_uint_t basePri)
{
    register cpu_uint_t __regBasePri         C__ASM("basepri");
    __regBasePri = (basePri & 0xFFU);
}


/**
  \brief   Set Fault Mask
  \details Assigns the given value to the Fault Mask register.
  \param [in]    faultMask  Fault Mask value to set
 */
C__STATIC_INLINE void cpu_set_FAULTMASK(cpu_uint_t faultMask)
{
    register cpu_uint_t __regFaultMask       C__ASM("faultmask");
    __regFaultMask = (faultMask & (cpu_uint_t)1U);
}

/**
  \brief   Get FPSCR
  \details Returns the current value of the Floating Point Status/Control register.
  \return               Floating Point Status/Control register value
 */
C__STATIC_INLINE cpu_uint_t cpu_get_FPSCR(void)
{
#if ((defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)) && \
     (defined (__FPU_USED   ) && (__FPU_USED    == 1U))     )
    register cpu_uint_t __regfpscr         C__ASM("fpscr");
  return(__regfpscr);
#else
    return(0U);
#endif
}


/**
  \brief   Set FPSCR
  \details Assigns the given value to the Floating Point Status/Control register.
  \param [in]    fpscr  Floating Point Status/Control value to set
 */
C__STATIC_INLINE void cpu_set_FPSCR(cpu_uint_t fpscr)
{
#if ((defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)) && \
     (defined (__FPU_USED   ) && (__FPU_USED    == 1U))     )
    register cpu_uint_t __regfpscr         C__ASM("fpscr");
  __regfpscr = (fpscr);
#else
    (void)fpscr;
#endif
}


/**
  \brief   No Operation
  \details No Operation does nothing. This instruction can be used for code alignment purposes.
 */
#define cpu_NOP                             __nop


/**
  \brief   Wait For Interrupt
  \details Wait For Interrupt is a hint instruction that suspends execution until one of a number of events occurs.
 */
#define cpu_WFI                             __wfi


/**
  \brief   Wait For Event
  \details Wait For Event is a hint instruction that permits the processor to enter
           a low-power state until one of a number of events occurs.
 */
#define cpu_WFE                             __wfe


/**
  \brief   Send Event
  \details Send Event is a hint instruction. It causes an event to be signaled to the CPU.
 */
#define cpu_SEV                             __sev

/**
  \brief   Instruction Synchronization Barrier
  \details Instruction Synchronization Barrier flushes the pipeline in the processor,
           so that all instructions following the ISB are fetched from cache or memory,
           after the instruction has been completed.
 */
#define cpu_ISB() do {\
                   __schedule_barrier();\
                   __isb(0xF);\
                   __schedule_barrier();\
                } while (0U)

/**
  \brief   Data Synchronization Barrier
  \details Acts as a special kind of Data Memory Barrier.
           It completes when all explicit memory accesses before this instruction complete.
 */
#define cpu_DSB() do {\
                   __schedule_barrier();\
                   __dsb(0xF);\
                   __schedule_barrier();\
                } while (0U)

/**
  \brief   Data Memory Barrier
  \details Ensures the apparent order of the explicit memory operations before
           and after the instruction, without ensuring their completion.
 */
#define cpu_DMB() do {\
                   __schedule_barrier();\
                   __dmb(0xF);\
                   __schedule_barrier();\
                } while (0U)

#define cpu_RBIT                          __rbit


/**
  \brief   Count leading zeros
  \details Counts the number of leading zeros of a data value.
  \param [in]  value  Value to count the leading zeros
  \return             number of leading zeros in value
 */
#define cpu_CLZ                             __clz

#define cpu_CTZ(V) cpu_CLZ(cpu_RBIT(V))


////////////////////////////////////////////////////////////////////////////////
////
/**
  \brief   LDR Exclusive (8 bit)
  \details Executes a exclusive LDR instruction for 8 bit value.
  \param [in]    ptr  Pointer to data
  \return             value of type uint8_t at (*ptr)
 */
#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION < 5060020)
#define cpu_LDREXB(ptr)                                                        ((uint8_t ) __ldrex(ptr))
#else
#define cpu_LDREXB(ptr)          _Pragma("push") _Pragma("diag_suppress 3731") ((uint8_t ) __ldrex(ptr))  _Pragma("pop")
#endif


/**
  \brief   LDR Exclusive (16 bit)
  \details Executes a exclusive LDR instruction for 16 bit values.
  \param [in]    ptr  Pointer to data
  \return        value of type uint16_t at (*ptr)
 */
#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION < 5060020)
#define cpu_LDREXH(ptr)                                                        ((uint16_t) __ldrex(ptr))
#else
#define cpu_LDREXH(ptr)          _Pragma("push") _Pragma("diag_suppress 3731") ((uint16_t) __ldrex(ptr))  _Pragma("pop")
#endif


/**
  \brief   LDR Exclusive (32 bit)
  \details Executes a exclusive LDR instruction for 32 bit values.
  \param [in]    ptr  Pointer to data
  \return        value of type uint32_t at (*ptr)
 */
#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION < 5060020)
#define cpu_LDREXW(ptr)                                                        ((uint32_t ) __ldrex(ptr))
#else
#define cpu_LDREXW(ptr)          _Pragma("push") _Pragma("diag_suppress 3731") ((uint32_t ) __ldrex(ptr))  _Pragma("pop")
#endif


/**
  \brief   STR Exclusive (8 bit)
  \details Executes a exclusive STR instruction for 8 bit values.
  \param [in]  value  Value to store
  \param [in]    ptr  Pointer to location
  \return          0  Function succeeded
  \return          1  Function failed
 */
#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION < 5060020)
#define cpu_STREXB(value, ptr)                                                 __strex(value, ptr)
#else
#define cpu_STREXB(value, ptr)   _Pragma("push") _Pragma("diag_suppress 3731") __strex(value, ptr)        _Pragma("pop")
#endif


/**
  \brief   STR Exclusive (16 bit)
  \details Executes a exclusive STR instruction for 16 bit values.
  \param [in]  value  Value to store
  \param [in]    ptr  Pointer to location
  \return          0  Function succeeded
  \return          1  Function failed
 */
#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION < 5060020)
#define cpu_STREXH(value, ptr)                                                 __strex(value, ptr)
#else
#define cpu_STREXH(value, ptr)   _Pragma("push") _Pragma("diag_suppress 3731") __strex(value, ptr)        _Pragma("pop")
#endif


/**
  \brief   STR Exclusive (32 bit)
  \details Executes a exclusive STR instruction for 32 bit values.
  \param [in]  value  Value to store
  \param [in]    ptr  Pointer to location
  \return          0  Function succeeded
  \return          1  Function failed
 */
#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION < 5060020)
#define cpu_STREXW(value, ptr)                                                 __strex(value, ptr)
#else
#define cpu_STREXW(value, ptr)   _Pragma("push") _Pragma("diag_suppress 3731") __strex(value, ptr)        _Pragma("pop")
#endif


/**
  \brief   Remove the exclusive lock
  \details Removes the exclusive lock which is created by LDREX.
 */
#define cpu_CLREX                           __clrex

////////////////////////////////////////////////////////////////////////////////
////
C__STATIC_FORCEINLINE int cpu_in_privilege(void){
    if(cpu_get_IPSR()!=0) return  1;
    else if((cpu_get_CONTROL() & 0x01)==0) return 1;
    else return 0;
}


C__STATIC_FORCEINLINE void cpu_reboot(void)
{
    cpu_DSB();                                                          /* Ensure all outstanding memory accesses included
                                                                       buffered write are completed before reset */
    CPU_REG(SCB_AIRCR)  = (uint32_t)((0x5FAUL << SCB_AIRCR_VECTKEY_Pos)    |
                                     (CPU_REG(SCB_AIRCR) & SCB_AIRCR_PRIGROUP_Msk) |
                                     SCB_AIRCR_SYSRESETREQ_Msk    );         /* Keep priority group unchanged */
    cpu_DSB();                                                          /* Ensure completion of memory access */

    for(;;)                                                           /* wait until reset */
    {
        cpu_NOP();
    }
}


#endif /*INCLUDED_CPU_FUNCTIONS_H*/
