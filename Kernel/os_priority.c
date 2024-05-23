#include <os_priority.h>
#include <cpu.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
//// STATIC VARIABLES

os_uint_t os_priority__table[OS_PRIORITY_TABLE_SIZE];

////////////////////////////////////////////////////////////////////////////////
////
void os_priority_init(void)
{
    os_size_t i;
    for(i=0; i<OS_PRIORITY_TABLE_SIZE; i++){
        os_priority__table[i] = (os_uint_t)0;
    }
}

os_priority_t os_priority_get_highest(void){
    os_uint_t* table_p;
    os_priority_t priority;

    priority = 0;
//    table_p = &os_priority__table[0];
//    while(*table_p == 0){
//        priority += OS_UINTPTR_BITS;
//        table_p++;
//    }
    for(int i=0; i<OS_PRIORITY_TABLE_SIZE; i++){
        table_p = &os_priority__table[i];
        if(table_p==0){
            priority+=OS_UINTPTR_BITS;
        }else{
            break;
        }
    }
    
    priority += (os_priority_t)cpu_CLZ(cpu_RBIT(*table_p));
    return (priority==OS_PRIORITY_MAX)?OS_PRIORITY_INVALID:(priority);
}

//void os_priority_mark(os_priority_t priority)
//{
//
//    //assert(priority>=0 && priority<OS_PRIORITY_MAX);
//#if 0
//    os_uintptr_t bit;
//    os_uintptr_t bit_nbr;
//    os_size_t ix;
//
//    ix = priority/OS_UINTPTR_BITS;
//    bit_nbr = priority & (OS_UINTPTR_BITS - 1u);
//    bit = 1;
//    bit <<= (OS_UINTPTR_BITS -1u) - bit_nbr;
//    os_priority__table[ix] |= bit;
//#endif
//    ((uint8_t *)os_priority__table)[priority/8]|=(1<<(priority % 8));
//}
//
//void os_priority_unmark(os_priority_t priority)
//{
//#if 0
//    os_uintptr_t bit;
//    os_uintptr_t bit_nbr;
//    os_size_t ix;
//
//    ix = priority/OS_UINTPTR_BITS;
//    bit_nbr = priority & (OS_UINTPTR_BITS - 1u);
//    bit = 1u;
//    bit <<=(OS_UINTPTR_BITS -1u) - bit_nbr;
//    os_priority__table[ix] &=~bit;
//#endif
//    ((uint8_t *)os_priority__table)[priority/8] &= ~(1<<(priority % 8));
//}

//bool os_priority_is_marked(os_priority_t priority){
//    //assert(priority>=0 && priority<OS_PRIORITY_MAX);
//    return ((((uint8_t*)os_priority__table)[priority/8] >> (priority%8))&1);
//}


void os_priority_swap(os_priority_t a, os_priority_t b){
    os_priority_t tmp;
    tmp = a;
    a = b;
    b = tmp;
}


