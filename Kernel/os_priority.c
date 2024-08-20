#include <os_priority.h>
#include <cpu.h>
#include <os_macros.h>
////////////////////////////////////////////////////////////////////////////////
////

C_ALIGNED(OS_ALIGN_SIZE)
static os_uint_t os_priority__table[OS_KERNEL_PRIORITY_TABLE_SIZE];

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_priority_init(void){
    os_size_t i;
    for(i=0; i<OS_KERNEL_PRIORITY_TABLE_SIZE; i++){
        os_priority__table[i] = 0;
    }

    return OS_ERR_OK;
}

os_priority_t os_priority_highest()
{
    os_uint_t * table_p;
    os_priority_t priority;

    priority = 0;
    table_p = &os_priority__table[0];

    while(*table_p==0){
        priority+=OS_KERNEL_CPU_NBR_BITS;
        table_p++;
    }
    priority+=cpu_clz(*table_p);
    return (priority);
}

void os_priority_mark(os_priority_t priority)
{
    os_uint_t bit;
    os_uint_t bit_nbr;
    os_priority_t idx;

    idx = priority/OS_KERNEL_CPU_NBR_BITS;
    bit_nbr = priority & (OS_KERNEL_CPU_NBR_BITS - 1u);
    bit = OS_BIT((OS_KERNEL_CPU_NBR_BITS-1u)-bit_nbr);
    os_priority__table[idx] |= bit;
}

void os_priority_unmark(os_priority_t priority){
    os_uint_t bit;
    os_uint_t bit_nbr;
    os_priority_t idx;

    idx = priority/OS_KERNEL_CPU_NBR_BITS;
    bit_nbr = priority & (OS_KERNEL_CPU_NBR_BITS - 1u);
    bit = OS_BIT((OS_KERNEL_CPU_NBR_BITS - 1u) - bit_nbr);
    os_priority__table[idx] &= ~bit;
}