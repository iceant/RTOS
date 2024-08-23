#ifndef INCLUDED_CPU_SVC_H
#define INCLUDED_CPU_SVC_H

void __svc(1) cpu_svc_context_switch(void** from_stack_p, void** to_stack_p);
void __svc(2) cpu_svc_set_msp(void* msp);

#endif /*INCLUDED_CPU_SVC_H*/
