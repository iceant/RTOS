#include <bsp_led4.h>

////////////////////////////////////////////////////////////////////////////////
////
#define LED_GPIO_CLOCK_ENABLE       __HAL_RCC_GPIOA_CLK_ENABLE()
#define LED_GPIO                    GPIOA
#define LED_PIN                     GPIO_PIN_15

////////////////////////////////////////////////////////////////////////////////
////

void BSP_LED4_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;
    LED_GPIO_CLOCK_ENABLE;
    
    GPIO_InitStructure.Pin = LED_PIN;
    GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStructure.Pull = GPIO_NOPULL;
    GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    HAL_GPIO_Init(LED_GPIO, &GPIO_InitStructure);
}

void BSP_LED4_On(void)
{
    HAL_GPIO_WritePin(LED_GPIO, LED_PIN, GPIO_PIN_SET);
}

void BSP_LED4_Off(void){
    HAL_GPIO_WritePin(LED_GPIO, LED_PIN, GPIO_PIN_RESET);
}

void BSP_LED4_Toggle(void)
{
    HAL_GPIO_TogglePin(LED_GPIO, LED_PIN);
}
