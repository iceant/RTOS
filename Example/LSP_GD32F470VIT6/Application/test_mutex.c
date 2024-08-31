//#include <test_mutex.h>
//#include <os_kernel.h>
//#include <stdio.h>
//#include <os_mutex.h>
//
//static uint8_t stacks1[1024];
//static uint8_t stacks2[1024];
//static os_thread_t thread1;
//static os_thread_t thread2;
//static os_mutex_t mutex;
//
//static void thread_entry(void* p){
//    while(1)
//    {
//        os_err_t err = os_mutext_lock(&mutex, OS_WAITING_INFINITY);
//        if(err==OS_ERR_OK){
//            printf("%s | own:%s locked!\n", os_thread_self()->name, mutex.owner->name);
//        }else{
//            printf("%s lock failed(%d)!\n", os_thread_self()->name, err);
//        }
//        os_thread_delay(10);
//        err = os_mutext_unlock(&mutex);
//        if(err==OS_ERR_OK){
//            printf("%s unlocked!\n", os_thread_self()->name);
//        }else{
//            printf("%s unlock failed(%d)!\n", os_thread_self()->name, err);
//        }
//
//    }
//}
//
//
//void TestMutex(void){
//    os_mutex_init(&mutex, "mx_lock", OS_MUTEX_FLAG_FIFO);
//
//    os_thread_init(&thread1, "thread1", thread_entry, 0, stacks1, OS_ARRAY_SIZE(stacks1), 20, 10, 0);
//    os_thread_startup(&thread1);
//
//    os_thread_init(&thread2, "thread2", thread_entry, 0, stacks2, OS_ARRAY_SIZE(stacks2), 20, 10, 0);
//    os_thread_startup(&thread2);
//}