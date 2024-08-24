# CPU_STACK_INIT_WITH_PRIVILEGE=0

当 `CPU_STACK_INIT_WITH_PRIVILEGE=0` 时， 调度会失败，以两个相同优先级的线程，相互 `yield` 时，最后只有一个线程活着