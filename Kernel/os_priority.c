#include <os_priority.h>
#include <os_list.h>
#include <cpu.h>
/* -------------------------------------------------------------------------------------------------------------- */


#define OS_PRIORITY_TABLE_SIZE (((OS_PRIORITY_MAX - 1u) / OS_CPU_NBR_BITS) + 1u)


/* -------------------------------------------------------------------------------------------------------------- */

static os_size_t os_priority__table[OS_PRIORITY_TABLE_SIZE];

/* -------------------------------------------------------------------------------------------------------------- */

os_err_t os_priority_init(void){
    os_size_t i;
    for(i=0; i<OS_PRIORITY_TABLE_SIZE; i++){
        os_priority__table[i] = 0;
    }
}

os_priority_t os_priority_highest(void){
    os_size_t * table_p;
    os_priority_t priority = 0u;
    
    table_p = &os_priority__table[0];
    while(*table_p == 0){
        priority += OS_CPU_NBR_BITS;
        table_p++;
    }
    priority += cpu_clz(*table_p);
    return priority;
}

void os_priority_mark(os_priority_t priority){
    os_size_t bit;
    os_size_t bit_nbr;
    os_priority_t idx;
    
    idx = priority / OS_CPU_NBR_BITS;
    bit_nbr = (os_size_t)priority & (OS_CPU_NBR_BITS - 1u);
    bit = 1u;
    bit <<= (OS_CPU_NBR_BITS - 1u) - bit_nbr;
    os_priority__table[idx] |= bit;
}


void os_priority_unmark(os_priority_t priority){
    os_size_t bit;
    os_size_t bit_nbr;
    os_priority_t idx;
    
    idx = priority / OS_CPU_NBR_BITS;
    bit_nbr = (os_size_t)priority & (OS_CPU_NBR_BITS - 1u);
    bit = 1u;
    bit <<= (OS_CPU_NBR_BITS - 1u) - bit_nbr;
    os_priority__table[idx] &= ~bit;
}


