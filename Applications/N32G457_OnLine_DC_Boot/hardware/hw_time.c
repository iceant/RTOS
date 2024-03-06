#include <hw_time.h>

////////////////////////////////////////////////////////////////////////////////
////
static hw_time_irq_handler hw_time_TIM1_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM2_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM3_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM4_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM5_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM6_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM7_IRQHandler=0;
static hw_time_irq_handler hw_time_TIM8_IRQHandler=0;
////////////////////////////////////////////////////////////////////////////////
////

void hw_time_init(TIM_Module * TIMx, uint16_t arr, uint16_t psc, hw_time_irq_handler irq_handler)
{
    TIM_TimeBaseInitType TIM_TimeBaseInitStruct;
    NVIC_InitType NVIC_InitStruct;

    if(TIMx==TIM1){
        RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_TIM1, ENABLE);
        hw_time_TIM1_IRQHandler = irq_handler;
    }else if(TIMx==TIM2){
        RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_TIM2, ENABLE);
        hw_time_TIM2_IRQHandler = irq_handler;
    }else if(TIMx==TIM3){
        RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_TIM3, ENABLE);
        hw_time_TIM3_IRQHandler = irq_handler;
    }else if(TIMx==TIM4){
        RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_TIM4, ENABLE);
        hw_time_TIM4_IRQHandler = irq_handler;
    }else if(TIMx==TIM5){
        RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_TIM5, ENABLE);
        hw_time_TIM5_IRQHandler = irq_handler;
    }else if(TIMx==TIM6){
        RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_TIM6, ENABLE);
        hw_time_TIM6_IRQHandler = irq_handler;
    }else if(TIMx==TIM7){
        RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_TIM7, ENABLE);
        hw_time_TIM7_IRQHandler = irq_handler;
    }else if(TIMx==TIM8){
        RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_TIM8, ENABLE);
        hw_time_TIM8_IRQHandler = irq_handler;
    }else{
        return;
    }

    TIM_InitTimBaseStruct(&TIM_TimeBaseInitStruct);
    TIM_TimeBaseInitStruct.Prescaler = psc;
    TIM_TimeBaseInitStruct.CntMode = TIM_CNT_MODE_UP;
    TIM_TimeBaseInitStruct.Period = arr;
    TIM_TimeBaseInitStruct.ClkDiv = 0;
    TIM_InitTimeBase(TIMx, &TIM_TimeBaseInitStruct);

    if(TIMx==TIM1){
        NVIC_InitStruct.NVIC_IRQChannel = TIM1_UP_IRQn;
    }else if(TIMx==TIM2){
        NVIC_InitStruct.NVIC_IRQChannel = TIM2_IRQn;
    }else if(TIMx==TIM3){
        NVIC_InitStruct.NVIC_IRQChannel = TIM3_IRQn;
    }else if(TIMx==TIM4){
        NVIC_InitStruct.NVIC_IRQChannel = TIM4_IRQn;
    }else if(TIMx==TIM5){
        NVIC_InitStruct.NVIC_IRQChannel = TIM5_IRQn;
    }else if(TIMx==TIM6){
        NVIC_InitStruct.NVIC_IRQChannel = TIM6_IRQn;
    }else if(TIMx==TIM7){
        NVIC_InitStruct.NVIC_IRQChannel = TIM7_IRQn;
    }else if(TIMx==TIM8){
        NVIC_InitStruct.NVIC_IRQChannel = TIM8_UP_IRQn;
    }
    NVIC_InitStruct.NVIC_IRQChannelSubPriority = 2;
    NVIC_InitStruct.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStruct);

    TIM_ConfigInt(TIMx, TIM_INT_UPDATE, ENABLE);
    TIM_Enable(TIMx, ENABLE);
}

////////////////////////////////////////////////////////////////////////////////
////
void TIM1_UP_IRQHandler(void){
    if(TIM_GetIntStatus(TIM1, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM1_IRQHandler){
            hw_time_TIM1_IRQHandler();
        }else{
            TIM_ConfigInt(TIM1, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM1, TIM_INT_UPDATE);
    }
}

void TIM2_IRQHandler(void){
    if(TIM_GetIntStatus(TIM2, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM2_IRQHandler){
            hw_time_TIM2_IRQHandler();
        }else{
            TIM_ConfigInt(TIM2, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM2, TIM_INT_UPDATE);
    }
}

void TIM3_IRQHandler(void){
    if(TIM_GetIntStatus(TIM3, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM3_IRQHandler){
            hw_time_TIM3_IRQHandler();
        }else{
            TIM_ConfigInt(TIM3, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM3, TIM_INT_UPDATE);
    }
}

void TIM4_IRQHandler(void){
    if(TIM_GetIntStatus(TIM4, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM4_IRQHandler){
            hw_time_TIM4_IRQHandler();
        }else{
            TIM_ConfigInt(TIM4, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM4, TIM_INT_UPDATE);
    }
}

void TIM5_IRQHandler(void){
    if(TIM_GetIntStatus(TIM5, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM5_IRQHandler){
            hw_time_TIM5_IRQHandler();
        }else{
            TIM_ConfigInt(TIM5, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM5, TIM_INT_UPDATE);
    }
}

void TIM6_IRQHandler(void){
    if(TIM_GetIntStatus(TIM6, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM6_IRQHandler){
            hw_time_TIM6_IRQHandler();
        }else{
            TIM_ConfigInt(TIM6, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM6, TIM_INT_UPDATE);
    }
}

void TIM7_IRQHandler(void){
    if(TIM_GetIntStatus(TIM7, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM7_IRQHandler){
            hw_time_TIM7_IRQHandler();
        }else{
            TIM_ConfigInt(TIM7, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM7, TIM_INT_UPDATE);
    }
}

void TIM8_UP_IRQHandler(void){
    if(TIM_GetIntStatus(TIM8, TIM_INT_UPDATE)!=RESET){
        if(hw_time_TIM8_IRQHandler){
            hw_time_TIM8_IRQHandler();
        }else{
            TIM_ConfigInt(TIM8, TIM_INT_UPDATE, DISABLE);
        }
        TIM_ClrIntPendingBit(TIM8, TIM_INT_UPDATE);
    }
}

