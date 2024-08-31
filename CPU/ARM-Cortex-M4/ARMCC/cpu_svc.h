#ifndef INCLUDED_CPU_SVC_H
#define INCLUDED_CPU_SVC_H

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

/* -------------------------------------------------------------------------------------------------------------- */
extern void SVC_Handler(void);

typedef void (*cpu_svc_function_t)(cpu_uint_t* svc_args, cpu_uint_t* result);

/* -------------------------------------------------------------------------------------------------------------- */
void cpu_svc_init(void);

cpu_svc_function_t cpu_svc_register(uint8_t svc_number, cpu_svc_function_t function);

#endif /*INCLUDED_CPU_SVC_H*/
