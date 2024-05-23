#ifndef INCLUDED_OS_PRIORITY_H
#define INCLUDED_OS_PRIORITY_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef os_int_t os_priority_t;

////////////////////////////////////////////////////////////////////////////////
////
#ifndef OS_PRIORITY_MAX
#define OS_PRIORITY_MAX 32
#endif

#define OS_PRIORITY_LOWEST (OS_PRIORITY_MAX-1)

#define OS_PRIORITY_INVALID (-1)

////////////////////////////////////////////////////////////////////////////////
////
#define OS_PRIORITY_CMP_HIGH    (1)
#define OS_PRIORITY_CMP_LOW     (-1)
#define OS_PRIORITY_CMP_EQUAL   (0)

#define OS_UINTPTR_BITS (8*sizeof(os_uint_t))
#define OS_PRIORITY_TABLE_SIZE (((OS_PRIORITY_MAX-1)/OS_UINTPTR_BITS)+1)
////////////////////////////////////////////////////////////////////////////////
////
extern os_uint_t os_priority__table[OS_PRIORITY_TABLE_SIZE];

void os_priority_init(void);

os_priority_t os_priority_get_highest(void);

C__STATIC_FORCEINLINE void os_priority_mark(os_priority_t priority){
    ((uint8_t *)os_priority__table)[priority/8]|=(1<<(priority % 8));
}

C__STATIC_FORCEINLINE void os_priority_unmark(os_priority_t priority){
    ((uint8_t *)os_priority__table)[priority/8] &= ~(1<<(priority % 8));
}

C__STATIC_FORCEINLINE bool os_priority_is_marked(os_priority_t priority)
{
    return ((((uint8_t*)os_priority__table)[priority/8] >> (priority%8))&1);
}

C__STATIC_FORCEINLINE int os_priority_cmp(os_priority_t a, os_priority_t b)
{
    return (a==b)?OS_PRIORITY_CMP_EQUAL:((a)<(b)?OS_PRIORITY_CMP_HIGH:OS_PRIORITY_CMP_LOW);
}

void os_priority_swap(os_priority_t a, os_priority_t b);

#endif /*INCLUDED_OS_PRIORITY_H*/
