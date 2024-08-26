# 场景一：SysTick 调度

基于 SysTick 对当前线程的 `remain_ticks` 进行判断，当 `remain_ticks=0`时，表示当前线程的时间用完了，需要调度



# 场景二：线程主动让出`os_thread_yield()`



# 场景三：线程进入睡眠状态`os_thread_delay()`



# 场景四：线程等待中`PEND`

比如调用`os_sem_take(...)` 会让当前线程进入 `PEND` 状态，直到 `os_sem_release()`时，线程会被重新加入



# 场景五：中断事件触发调度



# 场景六：关闭调度



# 线程需要紧急调度

# 线程退出时