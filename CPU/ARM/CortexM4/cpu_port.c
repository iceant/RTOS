#include <cpu_port.h>

int cpu_stack_init(void* thread_entry, void* parameter, void* stack_addr, int stack_size, void** cpu_sp)
{
    if(stack_size < 18*4) return -1;

    cpu_uintptr_t sp = ((cpu_uintptr_t)stack_addr + stack_size - 18*4);

    CPU_REG(sp+(17<<2))     = (cpu_uintptr_t)0x01000000; /*xPSR*/
    CPU_REG(sp+(16<<2))     = (cpu_uintptr_t)thread_entry; /*PC*/
    CPU_REG(sp + (1<<2))    = (cpu_uintptr_t)0x03; /*Init CONTROL register with NO_PRIVILEGE|NO_FP*/
    CPU_REG(sp)             = (cpu_uintptr_t)0xFFFFFFFDUL; /*EXC_RETURN*/

    if(cpu_sp){
        *cpu_sp = (void*)sp;
    }

    return 0;
}