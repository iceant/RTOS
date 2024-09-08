#ifndef INCLUDED_CPU_EXCEPTION_H
#define INCLUDED_CPU_EXCEPTION_H



typedef void (*cpu_exception_handler_t)(void*);

void cpu_set_exception_handler(cpu_exception_handler_t handler);

cpu_exception_handler_t cpu_exception_get_handler(void);

#endif /* INCLUDED_CPU_EXCEPTION_H */
