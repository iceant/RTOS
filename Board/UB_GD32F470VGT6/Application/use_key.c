#include <use_key.h>
#include <os_kernel.h>
#include <bsp_lock.h>

void USE_KEY_OnKeyDownHandler(int state)
{
    printf("[USE_KEY] State = %d\n", state);
    for(int i=0; i<0x3ffff;i++);
    int state2 = BSP_Key_State();
    if(state2==1){
        BSP_Lock_Enable();
    }else{
        BSP_Lock_Disable();
    }
}

void USE_KEY_Init(void)
{
    BSP_Key_SetHandler(USE_KEY_OnKeyDownHandler);
}
