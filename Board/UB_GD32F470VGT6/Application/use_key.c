#include <use_key.h>
#include <os_kernel.h>
#include <bsp_lock.h>

#define USE_KEY_UNLOCK 0
#define USE_KEY_LOCKED 1

static int USE_KEY__State = USE_KEY_UNLOCK;

void USE_KEY_OnKeyDownHandler(int state)
{
    for(int i=0; i<0x3ffff;i++);
    int state2 = BSP_Key_State();
    if(state2==1){
        if(USE_KEY__State == USE_KEY_UNLOCK) return;
        USE_KEY__State = USE_KEY_UNLOCK;
        BSP_Lock_Disable();
    }else{
        if(USE_KEY__State == USE_KEY_LOCKED) return;
        USE_KEY__State = USE_KEY_LOCKED;
        BSP_Lock_Enable();

    }
}

void USE_KEY_Init(void)
{
    BSP_Key_SetHandler(USE_KEY_OnKeyDownHandler);
}
