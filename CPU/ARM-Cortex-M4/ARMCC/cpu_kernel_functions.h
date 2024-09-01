#ifndef INCLUDED_CPU_KERNEL_FUNCTIONS_H
#define INCLUDED_CPU_KERNEL_FUNCTIONS_H

int __svc(0)  cpu_kernel_startup( void ) ;
int __svc(1)  cpu_kernel_schedule( void ) ;
int __svc(2)  cpu_kernel_thread_resume( void* ) ;
int __svc(3)  cpu_kernel_thread_yield( void* ) ;
int __svc(4)  cpu_kernel_thread_delay( void* thread, int ticks) ;


#endif /* INCLUDED_CPU_KERNEL_FUNCTIONS_H */
