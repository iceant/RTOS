# 0 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c"
# 1 "D:\\RTOS\\Board\\YD-STM32H7xxVx_ClassicV19\\cmake-build-debug//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c"
# 1 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.h" 1
# 2 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c" 2
# 1 "D:/RTOS/Compiler/GCC/rtos_compiler.h" 1




#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 3 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c" 2
# 1 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
# 9 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
# 1 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h" 1







# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\lib\\gcc\\arm-none-eabi\\12.2.1\\include\\stdint.h" 1 3 4
# 9 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\lib\\gcc\\arm-none-eabi\\12.2.1\\include\\stdint.h" 3 4
# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 12 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 3 4
# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3 4







# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\features.h" 1 3 4
# 28 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\features.h" 3 4
# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\_newlib_version.h" 1 3 4
# 29 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\features.h" 2 3 4
# 9 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 2 3 4
# 41 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4

# 41 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_intsup.h" 1 3 4
# 35 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h" 1 3 4
# 20 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\lib\\gcc\\arm-none-eabi\\12.2.1\\include\\stdint.h" 2 3 4
# 9 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h" 2






# 14 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h"
typedef int32_t cpu_int_t;
typedef uint32_t cpu_uint_t;
typedef cpu_uint_t cpu_size_t;
# 10 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 2



# 1 "D:/RTOS/CPU/ARM_CortexM4/cpu_registers.h" 1
# 14 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 2
# 28 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline void cpu_enable_irq(void)
{
    __asm volatile ("cpsie i" : : : "memory");
}







__attribute__((always_inline)) static inline void cpu_disable_irq(void)
{
    __asm volatile ("cpsid i" : : : "memory");
}






__attribute__((always_inline)) static inline uint32_t cpu_get_CONTROL(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, control" : "=r" (result) );
    return(result);
}
# 64 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline void cpu_set_CONTROL(uint32_t control)
{
    __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}






__attribute__((always_inline)) static inline uint32_t cpu_get_IPSR(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, ipsr" : "=r" (result) );
    return(result);
}
# 89 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_get_APSR(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, apsr" : "=r" (result) );
    return(result);
}







__attribute__((always_inline)) static inline uint32_t cpu_get_xPSR(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, xpsr" : "=r" (result) );
    return(result);
}






__attribute__((always_inline)) static inline uint32_t cpu_get_PSP(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, psp" : "=r" (result) );
    return(result);
}






__attribute__((always_inline)) static inline void cpu_set_PSP(uint32_t topOfProcStack)
{
    __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}






__attribute__((always_inline)) static inline uint32_t cpu_get_MSP(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, msp" : "=r" (result) );
    return(result);
}







__attribute__((always_inline)) static inline void cpu_set_MSP(uint32_t topOfMainStack)
{
    __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}






__attribute__((always_inline)) static inline uint32_t cpu_get_PRIMASK(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, primask" : "=r" (result) :: "memory");
    return(result);
}







__attribute__((always_inline)) static inline void cpu_set_PRIMASK(uint32_t priMask)
{
    __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}






__attribute__((always_inline)) static inline void cpu_enable_fault_irq(void)
{
    __asm volatile ("cpsie f" : : : "memory");
}







__attribute__((always_inline)) static inline void cpu_disable_fault_irq(void)
{
    __asm volatile ("cpsid f" : : : "memory");
}






__attribute__((always_inline)) static inline uint32_t cpu_get_BASEPRI(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, basepri" : "=r" (result) );
    return(result);
}






__attribute__((always_inline)) static inline void cpu_set_BASEPRI(uint32_t basePri)
{
    __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}






__attribute__((always_inline)) static inline uint32_t cpu_get_FAULTMASK(void)
{
    uint32_t result;

    __asm volatile ("MRS %0, faultmask" : "=r" (result) );
    return(result);
}






__attribute__((always_inline)) static inline void cpu_set_FAULTMASK(uint32_t faultMask)
{
    __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 256 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_get_FPSCR(void)
{
# 272 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
    return(0U);

}






__attribute__((always_inline)) static inline void cpu_set_FPSCR(uint32_t fpscr)
{
# 294 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
    (void)fpscr;

}
# 333 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline void cpu_ISB(void)
{
    __asm volatile ("isb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void cpu_DSB(void)
{
    __asm volatile ("dsb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void cpu_DMB(void)
{
    __asm volatile ("dmb 0xF":::"memory");
}
# 378 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_RBIT(uint32_t value)
{
    uint32_t result;
    __asm volatile ("rbit %0, %1" : "=r" (result) : "r" (value) );
    return result;
}
# 399 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint8_t cpu_LDREXB(volatile uint8_t *addr)
{
    uint32_t result;


    __asm volatile ("ldrexb %0, %1" : "=r" (result) : "Q" (*addr) );






    return ((uint8_t) result);
}
# 421 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint16_t cpu_LDREXH(volatile uint16_t *addr)
{
    uint32_t result;


    __asm volatile ("ldrexh %0, %1" : "=r" (result) : "Q" (*addr) );






    return ((uint16_t) result);
}
# 443 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_LDREXW(volatile uint32_t *addr)
{
    uint32_t result;

    __asm volatile ("ldrex %0, %1" : "=r" (result) : "Q" (*addr) );
    return(result);
}
# 460 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_STREXB(uint8_t value, volatile uint8_t *addr)
{
uint32_t result;

__asm volatile ("strexb %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
return(result);
}
# 477 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_STREXH(uint16_t value, volatile uint16_t *addr)
{
uint32_t result;

__asm volatile ("strexh %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
return(result);
}
# 494 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
__attribute__((always_inline)) static inline uint32_t cpu_STREXW(uint32_t value, volatile uint32_t *addr)
{
uint32_t result;

__asm volatile ("strex %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" (value) );
return(result);
}






__attribute__((always_inline)) static inline void cpu_CLREX(void)
{
    __asm volatile ("clrex" ::: "memory");
}




__attribute__((always_inline)) static inline int cpu_in_privilege(void){
    if(cpu_get_IPSR()!=0) return 1;
    else if((cpu_get_CONTROL() & 0x01)==0) return 1;
    else return 0;
}


__attribute__((always_inline)) static inline void cpu_reboot(void)
{
    cpu_DSB();

    (*((volatile unsigned long *)((((0xE000E000UL) + 0x0D00UL) + 0x000CUL)))) = (uint32_t)((0x5FAUL << 16U) |
                                     ((*((volatile unsigned long *)((((0xE000E000UL) + 0x0D00UL) + 0x000CUL)))) & (7UL << 8U)) |
                                     (1UL << 2U) );
    cpu_DSB();

    for(;;)
    {
        __asm volatile ("nop");
    }
}
# 4 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c" 2
# 1 "D:/RTOS/CPU/ARM_CortexM4/cpu_stack.h" 1
# 22 "D:/RTOS/CPU/ARM_CortexM4/cpu_stack.h"
extern void** cpu_stack__curr_p;
extern void** cpu_stack__next_p;
extern volatile uint8_t cpu_stack__switch_flag;




int cpu_stack_init(void* thread_entry, void* parameter, uint8_t * stack_address, int stack_size, void** return_sp);


int cpu_stack_switch(void** from_stack_p, void** to_stack_p);

int cpu_stack_is_switch_in_progress(void);
# 5 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c" 2


void __attribute__((naked)) PendSV_Handler(void)
{
    __asm volatile(
            "    .global cpu_stack__switch_flag         \n"
            "    .global cpu_stack__curr_p              \n"
            "    .global cpu_stack__next_p              \n"
            "                                           \n"
            "        MRS R1, PRIMASK                    \n"
            "        CPSID I                            \n"
            "                                           \n"
            "        LDR R0, =cpu_stack__switch_flag    \n"
            "        LDR R2, [R0]                       \n"
            "        CBZ R2, __PendSV_Exit /* if(cpu__stack_switch_flag==0) goto __PendSV_Exit; */              \n"
            "                                                                                                   \n"
            "        MOV R2, #0x00                                                                              \n"
            "        STR R2, [R0]    /* cpu__stack_switch_flag=0 */                                             \n"
            "                                                                                                   \n"
            "        LDR R2, =cpu_stack__curr_p                                                                 \n"
            "        LDR R0, [R2]                                                                               \n"
            "        CBZ R0, __PendSV_SwitchTo /* if(cpu__stack_curr_p==0) goto __PendSV_SwitchTo; */           \n"
            "                                                                                                   \n"
            "        MRS R0, PSP     /* Save Current Stack From PSP */                                          \n"

            "        TST LR, #0x10                                                                              \n"
            "        IT EQ                                                                                      \n"
            "        VSTMDBEQ R0!, {S16-S31}                                                                    \n"

            "        MOV R2, LR                                                                                 \n"
            "        MRS R3, CONTROL                                                                            \n"
            "        STMDB R0!, {R2-R11}                                                                        \n"
            "                                                                                                   \n"
            "        LDR R2, =cpu_stack__curr_p                                                                 \n"
            "        LDR R3, [R2]                                                                               \n"
            "        STR R0, [R3] /* Save Current SP to cpu__stack_curr_p->sp */                                \n"
            "                                                                                                   \n"
            "__PendSV_SwitchTo:                                                                                 \n"
            "        LDR R0, =cpu_stack__next_p                                                                 \n"
            "        LDR R0, [R0]                                                                               \n"
            "        LDR R0, [R0]                                                                               \n"
            "                                                                                                   \n"
            "        LDMIA R0!, {R2-R11}                                                                        \n"
            "        MOV LR, R2                                                                                 \n"
            "        MSR CONTROL, R3                                                                            \n"
            "        ISB                                                                                        \n"

            "        TST LR, #0x10                                                                              \n"
            "        IT EQ                                                                                      \n"
            "        VLDMIAEQ R0!, {S16-S31}                                                                    \n"

            "        MSR PSP, R0                                                                                \n"
            "                                                                                                   \n"
            "__PendSV_Exit:                                                                                     \n"
            "        MSR PRIMASK, R1                                                                            \n"
            "        ISB                                                                                        \n"
            "        BX LR                                                                                      \n"
            "        .align 4                                                                                   "
            :
            :
            : "cc", "memory");

}
