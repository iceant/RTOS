#ifndef INCLUDED_CPU_KERNEL_FUNCTIONS_H
#define INCLUDED_CPU_KERNEL_FUNCTIONS_H

int __svc(0)  cpu_kernel_startup( void ) ;
int __svc(1)  cpu_kernel_schedule( void ) ;
int __svc(2)  cpu_kernel_thread_resume( void* ) ;
int __svc(3)  cpu_kernel_thread_yield( void* ) ;
int __svc(4)  cpu_kernel_thread_delay( void* thread, int ticks) ;
int __svc(5)  cpu_kernel_sem_take(void* sem, int ticks) ;
int __svc(6)  cpu_kernel_sem_release(void* sem) ;
int __svc(7)  cpu_kernel_mutex_take(void* sem, int ticks) ;
int __svc(8)  cpu_kernel_mutex_release(void* sem);
int __svc(9)  cpu_kernel_thread_exit(void* thread_p);

#endif /* INCLUDED_CPU_KERNEL_FUNCTIONS_H */
