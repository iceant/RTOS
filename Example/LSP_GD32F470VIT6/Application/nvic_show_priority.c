#include <nvic_show_priority.h>
#include <stdio.h>
#include <gd32f4xx.h>

#define SHOW_SYS_IRQ(SysIRQn)   \
printf("%s: %d(0x%x)\n" \
       , #SysIRQn   \
       , SCB->SHP[((uint32_t)(SysIRQn) & 0xF)-4]  \
       , SCB->SHP[((uint32_t)(SysIRQn) & 0xF)-4]  \
       )

void nvic_show_priority(void )
{

    SHOW_SYS_IRQ(MemoryManagement_IRQn);
    SHOW_SYS_IRQ(BusFault_IRQn);
    SHOW_SYS_IRQ(UsageFault_IRQn);
    SHOW_SYS_IRQ(SVCall_IRQn);
    SHOW_SYS_IRQ(DebugMonitor_IRQn);
    SHOW_SYS_IRQ(PendSV_IRQn);
    SHOW_SYS_IRQ(SysTick_IRQn);

    for(uint32_t i=WWDGT_IRQn; i<=IPA_IRQn; i++){
        if(NVIC->IP[i]!=0){
            printf("IRQ_%d: Priority = %d(0x%x)\n", i, NVIC->IP[i], NVIC->IP[i]);
        }
    }

    for(int i=0; i<0x3ffffff; i++);
}