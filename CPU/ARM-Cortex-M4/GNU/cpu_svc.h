#ifndef INCLUDED_CPU_SVC_H
#define INCLUDED_CPU_SVC_H

#define cpu_svc_context_switch(from_stack_p, to_stack_p) __asm("SVC #1")

#endif /*INCLUDED_CPU_SVC_H*/
