# CPU_STACK_INIT_WITH_PRIVILEGE=0

当 `CPU_STACK_INIT_WITH_PRIVILEGE=0` 时， 调度会失败，以两个相同优先级的线程，相互 `yield` 时，最后只有一个线程活着

# Inline 复杂的方法可能导致程序状态错误
ready table 原来使用 inline 方式在 .h 文件中实现，后来发现程序状态会错误，改成方法调用后暂时未发现程序异常

# 死锁

调用链

```text 
cpu_spinlock_lock cpu_spinlock.h:30
os_cpulock_lock os_cpulock.c:10
os_sem_release os_sem.c:154
USART0_RxHandler main.c:60
USART0_IRQHandler bsp_usart0.c:82
os_thread_self os_thread.c:126
os_sem_take os_sem.c:135
USART0_ThreadEntry main.c:69
```