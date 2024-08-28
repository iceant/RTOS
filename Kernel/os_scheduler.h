#ifndef INCLUDED_OS_SCHEDULER_H
#define INCLUDED_OS_SCHEDULER_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_READYLIST_H
#include <os_readylist.h>
#endif /*INCLUDED_OS_READYLIST_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/


////////////////////////////////////////////////////////////////////////////////
////

extern volatile os_thread_t * os_scheduler__current_thread;
extern volatile os_size_t os_scheduler__lock_nest;
extern volatile os_size_t os_scheduler__interrupt_nest;
extern volatile os_bool_t os_scheduler__need_schedule_flag;
extern volatile os_tick_t os_scheduler__systick_ticks;
////////////////////////////////////////////////////////////////////////////////
////
#define OS_SCHEDULER_ERR_NOT_START                  0x1000
#define OS_SCHEDULER_ERR_IN_IRQ                     0x1001
#define OS_SCHEDULER_ERR_LOCKED                     0x1002
#define OS_SCHEDULER_ERR_CURR_THREAD_RUNNING        0x1003
#define OS_SCHEDULER_ERR_SAME_THREAD                0x1004
#define OS_SCHEDULER_ERR_NO_REQ                     0x1005
#define OS_SCHEDULER_ERR_WIP                        0x1006


////////////////////////////////////////////////////////////////////////////////
////

#if (OS_SCHEDULER_LOCK_POLICY==OS_SCHEDULER_LOCK_POLICY_USE_SPINLOCK)
#define OS_SCHEDULER_LOCK_VARIABLE()    cpu_spinlock_t os_scheduler__lock={0}
#define OS_SCHEDULER_LOCK()             do{cpu_spinlock_lock(&os_scheduler__lock);}while(0)
#define OS_SCHEDULER_UNLOCK()           do{cpu_spinlock_unlock(&os_scheduler__lock);}while(0)
#elif (OS_SCHEDULER_LOCK_POLICY==OS_SCHEDULER_LOCK_POLICY_DISABLE_IRQ)
#define OS_SCHEDULER_LOCK_VARIABLE()    cpu_interrupt_context_t os_scheduler__ctx__
#define OS_SCHEDULER_LOCK()             do{cpu_interrupt_disable(&os_scheduler__ctx__);}while(0)
#define OS_SCHEDULER_UNLOCK()           do{cpu_interrupt_enable(&os_scheduler__ctx__);}while(0)
#elif (OS_SCHEDULER_LOCK_POLICY==OS_SCHEDULER_LOCK_POLICY_DISABLE_PRIO)
#define OS_SCHEDULER_LOCK_BASE_PRIO     0x10
#define OS_SCHEDULER_LOCK_VARIABLE()    cpu_uint_t os_scheduler__lock_var__=0;
#define OS_SCHEDULER_LOCK()             do{ \
                                            os_scheduler__lock_var__=cpu_get_basepri(); \
                                            if(os_scheduler__lock_var__!=0){printf("[sch] os_scheduler__lock_var__=%d\n", os_scheduler__lock_var__);} \
                                            if(os_scheduler__lock_var__==0){cpu_set_basepri(OS_SCHEDULER_LOCK_BASE_PRIO);cpu_dsb();cpu_isb();}        \
                                        }while(0)
#define OS_SCHEDULER_UNLOCK()           do{ \
                                            cpu_set_basepri(os_scheduler__lock_var__); \
                                            cpu_dsb();cpu_isb();                    \
                                        }while(0)
#endif

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_scheduler_init(void);

os_err_t os_scheduler_startup(void);

void os_scheduler_schedule(os_err_t* error);

os_err_t os_scheduler_systick(void);

void os_scheduler_schedule_in_thread(os_err_t* error);

void os_scheduler_timed_wait(os_thread_t * thread, os_tick_t tick);

os_err_t os_scheduler_readylist_push_back(os_thread_t * thread);

os_err_t os_scheduler_readylist_push_front(os_thread_t * thread);

os_err_t os_scheduler_yield(os_thread_t * thread);

os_err_t os_scheduler_suspend(os_thread_t * thread);

os_err_t os_scheduler_resume(os_thread_t * thread);

os_err_t os_scheduler_mark_need_schedule(os_thread_t* thread);

os_err_t os_scheduler_detach(os_thread_t* thread);

void os_scheduler_push_back_to_delay_list(os_thread_t * thread);

os_bool_t os_scheduler_has_delay_task(void);

C_STATIC_FORCEINLINE volatile os_thread_t* os_scheduler_current_thread(void)
{
    return os_scheduler__current_thread;
}

C_STATIC_FORCEINLINE void os_scheduler_disable(void){
    os_scheduler__lock_nest++;
}

C_STATIC_FORCEINLINE void os_scheduler_enable(void){
    os_scheduler__lock_nest--;
}

C_STATIC_FORCEINLINE os_bool_t os_scheduler_disabled(void){
    return (os_scheduler__lock_nest>0u)?OS_TRUE:OS_FALSE;
}

#endif /*INCLUDED_OS_SCHEDULER_H*/
