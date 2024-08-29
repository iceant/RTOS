#ifndef INCLUDED_CPU_SVC_H
#define INCLUDED_CPU_SVC_H

int __svc(1) cpu_svc_context_switch(void** from_stack_p, void** to_stack_p, void* callback);

#endif /*INCLUDED_CPU_SVC_H*/
