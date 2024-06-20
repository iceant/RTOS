#include "main.h"
#include "board.h"

////////////////////////////////////////////////////////////////////////////////
////
#define HW32_ADDR(ADDR) (*(volatile uint32_t*)(ADDR))
#define APPLICATION_ADDRESS (0x08010000U)

////////////////////////////////////////////////////////////////////////////////
////
typedef void (*pFunction)(void);


static void delay_ms(uint32_t ms){
    for(uint32_t m=0; m<ms; m++){
        for(int i=0; i<1000; i++){
            for(int j=0; j<60; j++){
            }
        }
    }
}

static bool bootloader_need_upgrade(void){
    return false;
}

static void bootloader_exec_upgrade(void){
    while(1);
}

static void bootloader_jump(void* address){
    /* Test if user code is programmed starting from address "APPLICATION_ADDRESS" */
    {
        printf("Jump To: 0x%p\n", address);
        delay_ms(100);

        /* Jump to user application */
        uint32_t JumpAddress = HW32_ADDR(address + 4);
        pFunction JumpToApplication = (pFunction) JumpAddress;
        /* Initialize user application's Stack Pointer */
        __set_MSP(HW32_ADDR(address));

        BSP_USART0_DeInit();

        JumpToApplication();
    }
}

////////////////////////////////////////////////////////////////////////////////
////


int main(void){

    Board_Init();

    printf("========== BOOTLOADER ==========\n");

    if(bootloader_need_upgrade()){
        bootloader_exec_upgrade();
    }

    /* no need to upgrade */
    bootloader_jump((void*)APPLICATION_ADDRESS);


    while(1);

    return 0;
}