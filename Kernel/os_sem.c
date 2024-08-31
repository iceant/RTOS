#include <os_sem.h>
#include <os_memory.h>
#include <os_critical.h>
#include <os_thread.h>
#include <os_scheduler.h>
#include <os_timewheel.h>
#include <cpu_kernel_functions.h>
#include <os_kernel_lock.h>
#include <os_macros.h>
#include <cpu.h>
/* -------------------------------------------------------------------------------------------------------------- */
/*  */
C_STATIC_FORCEINLINE void os_sem__push_back(os_sem_t * sem, os_thread_t* thread)
{
    os_list_node_t * node;
    os_thread_t* t;
    int cmp;
    
    thread->state = OS_THREAD_STATE_PENDING;
    thread->remain_ticks = 0;
    OS_LIST_REMOVE(&thread->pend_node);
    
    if(sem->flag == OS_SEM_FLAG_PRIO){
        for(node = OS_LIST_NEXT(&sem->pend_list); node!=&sem->pend_list; ){
            t = OS_LIST_CONTAINER(node, os_thread_t, pend_node);
            node = OS_LIST_NEXT(node);
            cmp = os_priority_cmp(t->current_priority, thread->current_priority);
            
            if(cmp==OS_PRIORITY_CMP_LOW){
                OS_LIST_INSERT_BEFORE(&t->pend_node, &thread->pend_node);
                return;
            }else if(cmp==OS_PRIORITY_CMP_EQ){
                OS_LIST_INSERT_AFTER(&t->pend_node, &thread->pend_node);
                return;
            }
        }
        /* 找遍了，没有找到合适的位置，插在最后 */
        OS_LIST_INSERT_BEFORE(&sem->pend_list, &thread->pend_node);
    }else{
        OS_LIST_INSERT_BEFORE(&sem->pend_list, &thread->pend_node);
    }
    
}

C_STATIC_FORCEINLINE os_thread_t * os_sem__pop_one(os_sem_t* sem){
    os_thread_t * t;
    os_list_node_t * node;
    if(OS_LIST_IS_EMPTY(&sem->pend_list)){
        return 0;
    }
    node = OS_LIST_NEXT(&sem->pend_list);
    t = OS_LIST_CONTAINER(node, os_thread_t, pend_node);
    OS_LIST_REMOVE(node);
    
    return t;
}

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

#define OS_SEM_LOCK(sem) do{os_critical_enter(); os_cpulock_lock(&sem->lock); }while(0)
#define OS_SEM_UNLOCK(sem) do{os_cpulock_unlock(&sem->lock); os_critical_leave();}while(0)

//#define OS_SEM_LOCK(sem) OS_KERNEL_LOCK_VAR();OS_KERNEL_LOCK()
//#define OS_SEM_UNLOCK(sem) OS_KERNEL_UNLOCK()

/* -------------------------------------------------------------------------------------------------------------- */

os_err_t os_sem_init(os_sem_t* sem, const char* name, os_uint_t value, int flag)
{
    if(name){
        os_size_t name_size = strlen(name);
        name_size = (name_size > (OS_NAME_MAX_SIZE-1))?(OS_NAME_MAX_SIZE-1):name_size;
        memcpy(sem->name, name, name_size);
        sem->name[name_size] = '\0';
    }else{
        sem->name[0] = '\0';
    }
    
    sem->value = value;
    sem->flag = flag;
    OS_LIST_INIT(&sem->pend_list);
    os_cpulock_init(&sem->lock);
    
    return OS_ERR_OK;
}

#if 0
os_err_t os_sem_take_in_kernel(os_sem_t * sem, os_tick_t ticks){
    os_err_t err;
    OS_KERNEL_LOCK_VAR();
    OS_KERNEL_LOCK();
    
    if(sem->value>0u){
        sem->value--;
        OS_KERNEL_UNLOCK();
        return OS_ERR_OK;
    }
    
    if(ticks==0){
        OS_KERNEL_UNLOCK();
        return OS_ERR_TIMEOUT;
    }else if(ticks==OS_WAITING_INFINITY){
        os_sem__push_back(sem,  os_thread_self());
        OS_KERNEL_UNLOCK();
        os_scheduler_schedule();
        return OS_ERR_EAGAIN;
    }else{
        os_thread_t* thread = os_thread_self();
        os_sem__push_back(sem,  thread);
        OS_KERNEL_UNLOCK();
        os_scheduler_delay(thread, ticks);
        if(OS_BIT_GET(thread->error, OS_THREAD_ERR_TIMEOUT_POS)){
            return OS_ERR_TIMEOUT;
        }
        return OS_ERR_EAGAIN;
    }
}
#endif

os_err_t os_sem_take(os_sem_t* sem, os_tick_t ticks){
    os_err_t err;
    os_thread_t* thread;
    
    OS_SEM_LOCK(sem);
    if(sem->value>0u){
        sem->value--;
        OS_SEM_UNLOCK(sem);
        return OS_ERR_OK;
    }
    
    if(ticks==0){
        OS_SEM_UNLOCK(sem);
        return OS_ERR_TIMEOUT;
    }else if(ticks==OS_WAITING_INFINITY){
        os_sem__push_back(sem,  os_thread_self());
        OS_SEM_UNLOCK(sem);
        cpu_kernel_schedule();
    }else{
        thread = os_thread_self();
        os_sem__push_back(sem,  thread);
        OS_SEM_UNLOCK(sem);
        cpu_kernel_thread_delay(thread, ticks);
        if(OS_BIT_GET(thread->error, OS_THREAD_ERR_TIMEOUT_POS)){
            return OS_ERR_TIMEOUT;
        }
    }
    return OS_ERR_EAGAIN;
}

os_err_t os_sem_release(os_sem_t* sem){
    os_thread_t * thread;
    OS_SEM_LOCK(sem);
    thread = os_sem__pop_one(sem);
    OS_SEM_UNLOCK(sem);
    
    if(cpu_in_privilege()){
        os_err_t err =  os_scheduler_resume(thread);
        if(err==OS_SCHEDULER_ERR_IRQ_NEST){
            os_scheduler__need_schedule = OS_TRUE;
        }
        return err;
    }else{
        cpu_kernel_thread_resume(thread);
    }
    return OS_ERR_OK;
}

/* -------------------------------------------------------------------------------------------------------------- */
/* KERNEL FUNCTIONS */
