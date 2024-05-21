#include <bsp_timdelay.h>

////////////////////////////////////////////////////////////////////////////////
////

#define TIMx_CLOCKS             (SystemCoreClock/2/1000000)
//#define SYSTEM_CLOCK            (HAL_RCC_GetPCLK1Freq()*2/1000000)
#define TIMx                    TIM3
#define TIMx_CLK_ENABLE()       __HAL_RCC_TIM3_CLK_ENABLE()
#define TIMx_CLK_DISABLE()      __HAL_RCC_TIM3_CLK_DISABLE()
////////////////////////////////////////////////////////////////////////////////
////

static TIM_HandleTypeDef    TimHandle;
////////////////////////////////////////////////////////////////////////////////
////

void BSP_TIMDelay_Init(void)
{
    TimHandle.Instance = TIMx;
    TIMx_CLK_ENABLE();
    
    TimHandle.Init.Period            = 100-1;
    TimHandle.Init.Prescaler         = (TIMx_CLOCKS-1);
    TimHandle.Init.ClockDivision     = 0;
    TimHandle.Init.CounterMode       = TIM_COUNTERMODE_DOWN;
    TimHandle.Init.RepetitionCounter = 0;
    TimHandle.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
    HAL_TIM_Base_Init(&TimHandle);
}

void BSP_TIMDelay_DeInit(void)
{
//    uint32_t tim14_cnt;
//    tim14_cnt = tim14_tick_count * 65536;
//    tim14_cnt += __HAL_TIM_GET_COUNTER(&TimHandle);
    HAL_TIM_Base_Stop_IT(&TimHandle);
    HAL_NVIC_DisableIRQ(TIM3_IRQn);
    HAL_TIM_Base_DeInit(&TimHandle);
    TIMx_CLK_DISABLE();
}

void BSP_TIMDelay_Us(volatile uint32_t us)
{
    TIMx->CNT = us-1;
    TIMx->CR1 |= TIM_CR1_CEN;            // 启动计数
    while((TIMx->SR & TIM_FLAG_UPDATE)!=SET);
    TIMx->SR = (uint16_t)~TIM_FLAG_UPDATE;
    TIMx->CR1 &= ~TIM_CR1_CEN;         // 停止计数
}

void BSP_TIMDelay_Ms(volatile uint32_t nms)
{
    volatile uint32_t ms = nms;
    while(ms--)
    {
        BSP_TIMDelay_Us(1000);
    }
}

