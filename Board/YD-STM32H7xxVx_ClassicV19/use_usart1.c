#include <use_usart1.h>
#include <os_kernel.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////

// Returns a pointer to the first byte of needle inside haystack,
static uint8_t* bytes_find(uint8_t* haystack, size_t haystackLen, uint8_t* needle, size_t needleLen) {
    if (needleLen > haystackLen) {
        return false;
    }
    uint8_t* match = memchr(haystack, needle[0], haystackLen);
    if (match != NULL) {
        size_t remaining = haystackLen - ((uint8_t*)match - haystack);
        if (needleLen <= remaining) {
            if (memcmp(match, needle, needleLen) == 0) {
                return match;
            }
        }
    }
    return NULL;
}
////////////////////////////////////////////////////////////////////////////////
////
static uint8_t RxBuffer[256];
static int write_idx = 0;
static os_sem_t RxSem;
static os_thread_t RxThread;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t RxThreadStack[1024];

static void USART1_RxHandler(uint8_t data, void* ud){
    RxBuffer[write_idx++] = data;
    if(write_idx==OS_ARRAY_SIZE(RxBuffer)){
        write_idx = 0;
    }
    os_sem_release(&RxSem);
}

static void USART1_RxThread(void* p){
    while(1){
        os_sem_take(&RxSem, OS_WAIT_INFINITY);
        if(bytes_find(RxBuffer, write_idx, (uint8_t *)"reboot", 6)!=NULL){
            cpu_reboot();
        }
        if(RxBuffer[write_idx-1]=='\n'){
            printf("[USART1] Rx: ");
            for(int i=0; i<write_idx; i++){
                printf("%c", RxBuffer[i]);
            }
            write_idx = 0;
        }
    }
}
////////////////////////////////////////////////////////////////////////////////
////

void USE_USART1_Init(void)
{
    os_semaphore_init(&RxSem, "USART1_RxSem", 0, OS_QUEUE_FIFO);
    os_thread_init(&RxThread, "USART1_RxThd", USART1_RxThread, 0, RxThreadStack, sizeof(RxThreadStack), 20, 10);
    os_thread_startup(&RxThread);
    BSP_USART1_SetRxHandler(USART1_RxHandler, 0);
}