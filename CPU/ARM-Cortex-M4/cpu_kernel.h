#ifndef INCLUDED_CPU_KERNEL_H
#define INCLUDED_CPU_KERNEL_H

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

/* -------------------------------------------------------------------------------------------------------------- */
typedef void (*cpu_kernel_function_t)(cpu_uint_t* args, cpu_uint_t* result);

/* -------------------------------------------------------------------------------------------------------------- */

void cpu_kernel_init(void);

cpu_kernel_function_t cpu_kernel_register(uint8_t function_code, cpu_kernel_function_t function);

/* -------------------------------------------------------------------------------------------------------------- */
/* KERNEL FUNCTIONS */
#ifndef INCLUDED_CPU_KERNEL_FUNCTIONS_H
#include <cpu_kernel_functions.h>
#endif /*INCLUDED_CPU_KERNEL_FUNCTIONS_H*/




#endif /* INCLUDED_CPU_KERNEL_H */
