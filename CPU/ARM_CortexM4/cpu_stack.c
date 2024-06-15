#include <cpu_stack.h>
#include <cpu_functions.h>
#include <cpu_lock.h>
#include <os_definitions.h>

////////////////////////////////////////////////////////////////////////////////
////

#define ALIGN_DOWN(x, a)     ((x)&~((a) - 1))
#define ALIGN_UP(x, a)       (((x) + (a) - 1)&~((a) - 1))

#ifndef CPU_REG
#define CPU_REG(ADDRESS)  (*((volatile cpu_uint_t *)(ADDRESS)))
#endif


////////////////////////////////////////////////////////////////////////////////
////
volatile uint8_t cpu_stack__switch_flag = CPU_STACK_SWITCH_FLAG_OFF;
void** cpu_stack__curr_p=0;
void** cpu_stack__next_p=0;
static cpu_lock_t cpu_stack__lock = {0};

////////////////////////////////////////////////////////////////////////////////
////

/*
00 0000  EXC_RETURN/LR          <<-- sp; 存放初始返回值
01 0004  CONTROL                <<-- CONTROL
02 0008  R4
03 000C  R5
04 0010  R6
05 0014  R7
06 0018  R8
07 001C  R9
08 0020  R10
09 0024  R11
10 0028  R0                     << -- Thread Parameter
11 002C  R1
12 0030  R2
13 0034  R3
14 0038  R12
15 003C  LR(R14)
16 0040  PC                     << -- Thread Entry
17 0044  PSR                    << --[stack_addr + stack_size] 0x01000000
 
--------------------
 */

int cpu_stack_init(void* thread_entry, void* parameter, uint8_t * stack_addr, int stack_size, void** return_sp)
{
    if (stack_size < CPU_STACK_INIT_REGISTER_SIZE) return -1;

    cpu_uint_t sp = ((cpu_uint_t) stack_addr + stack_size - CPU_STACK_INIT_REGISTER_SIZE);
    
    for(int i=0; i<CPU_STACK_REGISTER_COUNT; i++){
        CPU_REG(sp + (i<<2)) = (cpu_uint_t )0xdeadbeefUL;
    }

    CPU_REG(sp + (17 << 2)) = (cpu_uint_t) 0x01000000; /*xPSR*/
    CPU_REG(sp + (16 << 2)) = (cpu_uint_t) thread_entry; /*PC*/
    CPU_REG(sp + (10 << 2)) = (cpu_uint_t) parameter; /*R0*/
    #if (defined(CPU_STACK_INIT_WITH_PRIVILEGE) && CPU_STACK_INIT_WITH_PRIVILEGE==1)
    CPU_REG(sp + (1 << 2)) = (cpu_uint_t) 0x02; /*Init CONTROL register with NO_PRIVILEGE|NO_FP*/
    #else
    CPU_REG(sp + (1 << 2)) = (cpu_uint_t) 0x03; /*Init CONTROL register with NO_PRIVILEGE|NO_FP*/
    #endif
    CPU_REG(sp) = (cpu_uint_t) 0xFFFFFFFDUL; /*EXC_RETURN*/

    if (return_sp) {
        *return_sp = (void *) sp;
    }
    
    return 0;

}

#if defined(__CC_ARM)
void __svc( 0 ) cpu_stack_switch_in_privilege( void ) ;
#elif defined(__GNUC__)
#define cpu_stack_switch_in_privilege() C__ASM volatile ("svc #0":::"memory")
#endif

int cpu_stack_switch(void** from_stack_p, void** to_stack_p)
{
    if(cpu_stack__switch_flag==CPU_STACK_SWITCH_FLAG_ON){
        return -1;
    }

    if(to_stack_p==0 || *to_stack_p==0){
        return -2;
    }
    if(from_stack_p!=0){
        if(*from_stack_p==0){
            return -3;
        }
    }

    cpu_lock_lock(&cpu_stack__lock);
    cpu_stack__switch_flag = CPU_STACK_SWITCH_FLAG_ON;
    cpu_stack__curr_p = from_stack_p;
    cpu_stack__next_p = to_stack_p;
    cpu_lock_unlock(&cpu_stack__lock);

    if(cpu_in_privilege()){
        /*设置中断需要特权，已在特权模式，直接设置*/
        CPU_REG(SCB_ICSR) |= SCB_ICSR_PENDSVSET_Msk;
    }else{
        cpu_stack_switch_in_privilege();
    }

    return 0;
}

int cpu_stack_is_switch_in_progress(void)
{
    return (cpu_stack__switch_flag==CPU_STACK_SWITCH_FLAG_ON)?1:0;
}
