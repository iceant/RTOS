#ifndef INCLUDED_CPU_SVC_C_H
#define INCLUDED_CPU_SVC_C_H

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

void SVC_Handler_C(cpu_uint_t* svc_args, uint32_t* exc_return);

#endif /*INCLUDED_CPU_SVC_C_H*/
