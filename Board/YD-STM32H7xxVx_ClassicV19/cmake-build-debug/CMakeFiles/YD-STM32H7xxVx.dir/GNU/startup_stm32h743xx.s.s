# 0 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/GNU/startup_stm32h743xx.s"
# 1 "D:\\RTOS\\Board\\YD-STM32H7xxVx_ClassicV19\\cmake-build-debug//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/GNU/startup_stm32h743xx.s"
# 27 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/GNU/startup_stm32h743xx.s"
  .syntax unified
  .cpu cortex-m7
  .fpu softvfp
  .thumb

.global g_pfnVectors
.global Default_Handler



.word _sidata

.word _sdata

.word _edata

.word _sbss

.word _ebss
# 57 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/GNU/startup_stm32h743xx.s"
    .section .text.Reset_Handler
  .weak Reset_Handler
  .type Reset_Handler, %function
Reset_Handler:
  ldr sp, =_estack


  bl SystemInit


  ldr r0, =_sdata
  ldr r1, =_edata
  ldr r2, =_sidata
  movs r3, #0
  b LoopCopyDataInit

CopyDataInit:
  ldr r4, [r2, r3]
  str r4, [r0, r3]
  adds r3, r3, #4

LoopCopyDataInit:
  adds r4, r0, r3
  cmp r4, r1
  bcc CopyDataInit

  ldr r2, =_sbss
  ldr r4, =_ebss
  movs r3, #0
  b LoopFillZerobss

FillZerobss:
  str r3, [r2]
  adds r2, r2, #4

LoopFillZerobss:
  cmp r2, r4
  bcc FillZerobss


    bl __libc_init_array

  bl main
  bx lr
.size Reset_Handler, .-Reset_Handler
# 110 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/GNU/startup_stm32h743xx.s"
    .section .text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
  b Infinite_Loop
  .size Default_Handler, .-Default_Handler







   .section .isr_vector,"a",%progbits
  .type g_pfnVectors, %object


g_pfnVectors:
  .word _estack
  .word Reset_Handler

  .word NMI_Handler
  .word HardFault_Handler
  .word MemManage_Handler
  .word BusFault_Handler
  .word UsageFault_Handler
  .word 0
  .word 0
  .word 0
  .word 0
  .word SVC_Handler
  .word DebugMon_Handler
  .word 0
  .word PendSV_Handler
  .word SysTick_Handler


  .word WWDG_IRQHandler
  .word PVD_AVD_IRQHandler
  .word TAMP_STAMP_IRQHandler
  .word RTC_WKUP_IRQHandler
  .word FLASH_IRQHandler
  .word RCC_IRQHandler
  .word EXTI0_IRQHandler
  .word EXTI1_IRQHandler
  .word EXTI2_IRQHandler
  .word EXTI3_IRQHandler
  .word EXTI4_IRQHandler
  .word DMA1_Stream0_IRQHandler
  .word DMA1_Stream1_IRQHandler
  .word DMA1_Stream2_IRQHandler
  .word DMA1_Stream3_IRQHandler
  .word DMA1_Stream4_IRQHandler
  .word DMA1_Stream5_IRQHandler
  .word DMA1_Stream6_IRQHandler
  .word ADC_IRQHandler
  .word FDCAN1_IT0_IRQHandler
  .word FDCAN2_IT0_IRQHandler
  .word FDCAN1_IT1_IRQHandler
  .word FDCAN2_IT1_IRQHandler
  .word EXTI9_5_IRQHandler
  .word TIM1_BRK_IRQHandler
  .word TIM1_UP_IRQHandler
  .word TIM1_TRG_COM_IRQHandler
  .word TIM1_CC_IRQHandler
  .word TIM2_IRQHandler
  .word TIM3_IRQHandler
  .word TIM4_IRQHandler
  .word I2C1_EV_IRQHandler
  .word I2C1_ER_IRQHandler
  .word I2C2_EV_IRQHandler
  .word I2C2_ER_IRQHandler
  .word SPI1_IRQHandler
  .word SPI2_IRQHandler
  .word USART1_IRQHandler
  .word USART2_IRQHandler
  .word USART3_IRQHandler
  .word EXTI15_10_IRQHandler
  .word RTC_Alarm_IRQHandler
  .word 0
  .word TIM8_BRK_TIM12_IRQHandler
  .word TIM8_UP_TIM13_IRQHandler
  .word TIM8_TRG_COM_TIM14_IRQHandler
  .word TIM8_CC_IRQHandler
  .word DMA1_Stream7_IRQHandler
  .word FMC_IRQHandler
  .word SDMMC1_IRQHandler
  .word TIM5_IRQHandler
  .word SPI3_IRQHandler
  .word UART4_IRQHandler
  .word UART5_IRQHandler
  .word TIM6_DAC_IRQHandler
  .word TIM7_IRQHandler
  .word DMA2_Stream0_IRQHandler
  .word DMA2_Stream1_IRQHandler
  .word DMA2_Stream2_IRQHandler
  .word DMA2_Stream3_IRQHandler
  .word DMA2_Stream4_IRQHandler
  .word ETH_IRQHandler
  .word ETH_WKUP_IRQHandler
  .word FDCAN_CAL_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word DMA2_Stream5_IRQHandler
  .word DMA2_Stream6_IRQHandler
  .word DMA2_Stream7_IRQHandler
  .word USART6_IRQHandler
  .word I2C3_EV_IRQHandler
  .word I2C3_ER_IRQHandler
  .word OTG_HS_EP1_OUT_IRQHandler
  .word OTG_HS_EP1_IN_IRQHandler
  .word OTG_HS_WKUP_IRQHandler
  .word OTG_HS_IRQHandler
  .word DCMI_IRQHandler
  .word 0
  .word RNG_IRQHandler
  .word FPU_IRQHandler
  .word UART7_IRQHandler
  .word UART8_IRQHandler
  .word SPI4_IRQHandler
  .word SPI5_IRQHandler
  .word SPI6_IRQHandler
  .word SAI1_IRQHandler
  .word LTDC_IRQHandler
  .word LTDC_ER_IRQHandler
  .word DMA2D_IRQHandler
  .word SAI2_IRQHandler
  .word QUADSPI_IRQHandler
  .word LPTIM1_IRQHandler
  .word CEC_IRQHandler
  .word I2C4_EV_IRQHandler
  .word I2C4_ER_IRQHandler
  .word SPDIF_RX_IRQHandler
  .word OTG_FS_EP1_OUT_IRQHandler
  .word OTG_FS_EP1_IN_IRQHandler
  .word OTG_FS_WKUP_IRQHandler
  .word OTG_FS_IRQHandler
  .word DMAMUX1_OVR_IRQHandler
  .word HRTIM1_Master_IRQHandler
  .word HRTIM1_TIMA_IRQHandler
  .word HRTIM1_TIMB_IRQHandler
  .word HRTIM1_TIMC_IRQHandler
  .word HRTIM1_TIMD_IRQHandler
  .word HRTIM1_TIME_IRQHandler
  .word HRTIM1_FLT_IRQHandler
  .word DFSDM1_FLT0_IRQHandler
  .word DFSDM1_FLT1_IRQHandler
  .word DFSDM1_FLT2_IRQHandler
  .word DFSDM1_FLT3_IRQHandler
  .word SAI3_IRQHandler
  .word SWPMI1_IRQHandler
  .word TIM15_IRQHandler
  .word TIM16_IRQHandler
  .word TIM17_IRQHandler
  .word MDIOS_WKUP_IRQHandler
  .word MDIOS_IRQHandler
  .word JPEG_IRQHandler
  .word MDMA_IRQHandler
  .word 0
  .word SDMMC2_IRQHandler
  .word HSEM1_IRQHandler
  .word 0
  .word ADC3_IRQHandler
  .word DMAMUX2_OVR_IRQHandler
  .word BDMA_Channel0_IRQHandler
  .word BDMA_Channel1_IRQHandler
  .word BDMA_Channel2_IRQHandler
  .word BDMA_Channel3_IRQHandler
  .word BDMA_Channel4_IRQHandler
  .word BDMA_Channel5_IRQHandler
  .word BDMA_Channel6_IRQHandler
  .word BDMA_Channel7_IRQHandler
  .word COMP1_IRQHandler
  .word LPTIM2_IRQHandler
  .word LPTIM3_IRQHandler
  .word LPTIM4_IRQHandler
  .word LPTIM5_IRQHandler
  .word LPUART1_IRQHandler
  .word 0
  .word CRS_IRQHandler
  .word ECC_IRQHandler
  .word SAI4_IRQHandler
  .word 0
  .word 0
  .word WAKEUP_PIN_IRQHandler

  .size g_pfnVectors, .-g_pfnVectors
# 306 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/GNU/startup_stm32h743xx.s"
   .weak NMI_Handler
   .thumb_set NMI_Handler,Default_Handler

   .weak HardFault_Handler
   .thumb_set HardFault_Handler,Default_Handler

   .weak MemManage_Handler
   .thumb_set MemManage_Handler,Default_Handler

   .weak BusFault_Handler
   .thumb_set BusFault_Handler,Default_Handler

   .weak UsageFault_Handler
   .thumb_set UsageFault_Handler,Default_Handler

   .weak SVC_Handler
   .thumb_set SVC_Handler,Default_Handler

   .weak DebugMon_Handler
   .thumb_set DebugMon_Handler,Default_Handler

   .weak PendSV_Handler
   .thumb_set PendSV_Handler,Default_Handler

   .weak SysTick_Handler
   .thumb_set SysTick_Handler,Default_Handler

   .weak WWDG_IRQHandler
   .thumb_set WWDG_IRQHandler,Default_Handler

   .weak PVD_AVD_IRQHandler
   .thumb_set PVD_AVD_IRQHandler,Default_Handler

   .weak TAMP_STAMP_IRQHandler
   .thumb_set TAMP_STAMP_IRQHandler,Default_Handler

   .weak RTC_WKUP_IRQHandler
   .thumb_set RTC_WKUP_IRQHandler,Default_Handler

   .weak FLASH_IRQHandler
   .thumb_set FLASH_IRQHandler,Default_Handler

   .weak RCC_IRQHandler
   .thumb_set RCC_IRQHandler,Default_Handler

   .weak EXTI0_IRQHandler
   .thumb_set EXTI0_IRQHandler,Default_Handler

   .weak EXTI1_IRQHandler
   .thumb_set EXTI1_IRQHandler,Default_Handler

   .weak EXTI2_IRQHandler
   .thumb_set EXTI2_IRQHandler,Default_Handler

   .weak EXTI3_IRQHandler
   .thumb_set EXTI3_IRQHandler,Default_Handler

   .weak EXTI4_IRQHandler
   .thumb_set EXTI4_IRQHandler,Default_Handler

   .weak DMA1_Stream0_IRQHandler
   .thumb_set DMA1_Stream0_IRQHandler,Default_Handler

   .weak DMA1_Stream1_IRQHandler
   .thumb_set DMA1_Stream1_IRQHandler,Default_Handler

   .weak DMA1_Stream2_IRQHandler
   .thumb_set DMA1_Stream2_IRQHandler,Default_Handler

   .weak DMA1_Stream3_IRQHandler
   .thumb_set DMA1_Stream3_IRQHandler,Default_Handler

   .weak DMA1_Stream4_IRQHandler
   .thumb_set DMA1_Stream4_IRQHandler,Default_Handler

   .weak DMA1_Stream5_IRQHandler
   .thumb_set DMA1_Stream5_IRQHandler,Default_Handler

   .weak DMA1_Stream6_IRQHandler
   .thumb_set DMA1_Stream6_IRQHandler,Default_Handler

   .weak ADC_IRQHandler
   .thumb_set ADC_IRQHandler,Default_Handler

   .weak FDCAN1_IT0_IRQHandler
   .thumb_set FDCAN1_IT0_IRQHandler,Default_Handler

   .weak FDCAN2_IT0_IRQHandler
   .thumb_set FDCAN2_IT0_IRQHandler,Default_Handler

   .weak FDCAN1_IT1_IRQHandler
   .thumb_set FDCAN1_IT1_IRQHandler,Default_Handler

   .weak FDCAN2_IT1_IRQHandler
   .thumb_set FDCAN2_IT1_IRQHandler,Default_Handler

   .weak EXTI9_5_IRQHandler
   .thumb_set EXTI9_5_IRQHandler,Default_Handler

   .weak TIM1_BRK_IRQHandler
   .thumb_set TIM1_BRK_IRQHandler,Default_Handler

   .weak TIM1_UP_IRQHandler
   .thumb_set TIM1_UP_IRQHandler,Default_Handler

   .weak TIM1_TRG_COM_IRQHandler
   .thumb_set TIM1_TRG_COM_IRQHandler,Default_Handler

   .weak TIM1_CC_IRQHandler
   .thumb_set TIM1_CC_IRQHandler,Default_Handler

   .weak TIM2_IRQHandler
   .thumb_set TIM2_IRQHandler,Default_Handler

   .weak TIM3_IRQHandler
   .thumb_set TIM3_IRQHandler,Default_Handler

   .weak TIM4_IRQHandler
   .thumb_set TIM4_IRQHandler,Default_Handler

   .weak I2C1_EV_IRQHandler
   .thumb_set I2C1_EV_IRQHandler,Default_Handler

   .weak I2C1_ER_IRQHandler
   .thumb_set I2C1_ER_IRQHandler,Default_Handler

   .weak I2C2_EV_IRQHandler
   .thumb_set I2C2_EV_IRQHandler,Default_Handler

   .weak I2C2_ER_IRQHandler
   .thumb_set I2C2_ER_IRQHandler,Default_Handler

   .weak SPI1_IRQHandler
   .thumb_set SPI1_IRQHandler,Default_Handler

   .weak SPI2_IRQHandler
   .thumb_set SPI2_IRQHandler,Default_Handler

   .weak USART1_IRQHandler
   .thumb_set USART1_IRQHandler,Default_Handler

   .weak USART2_IRQHandler
   .thumb_set USART2_IRQHandler,Default_Handler

   .weak USART3_IRQHandler
   .thumb_set USART3_IRQHandler,Default_Handler

   .weak EXTI15_10_IRQHandler
   .thumb_set EXTI15_10_IRQHandler,Default_Handler

   .weak RTC_Alarm_IRQHandler
   .thumb_set RTC_Alarm_IRQHandler,Default_Handler

   .weak TIM8_BRK_TIM12_IRQHandler
   .thumb_set TIM8_BRK_TIM12_IRQHandler,Default_Handler

   .weak TIM8_UP_TIM13_IRQHandler
   .thumb_set TIM8_UP_TIM13_IRQHandler,Default_Handler

   .weak TIM8_TRG_COM_TIM14_IRQHandler
   .thumb_set TIM8_TRG_COM_TIM14_IRQHandler,Default_Handler

   .weak TIM8_CC_IRQHandler
   .thumb_set TIM8_CC_IRQHandler,Default_Handler

   .weak DMA1_Stream7_IRQHandler
   .thumb_set DMA1_Stream7_IRQHandler,Default_Handler

   .weak FMC_IRQHandler
   .thumb_set FMC_IRQHandler,Default_Handler

   .weak SDMMC1_IRQHandler
   .thumb_set SDMMC1_IRQHandler,Default_Handler

   .weak TIM5_IRQHandler
   .thumb_set TIM5_IRQHandler,Default_Handler

   .weak SPI3_IRQHandler
   .thumb_set SPI3_IRQHandler,Default_Handler

   .weak UART4_IRQHandler
   .thumb_set UART4_IRQHandler,Default_Handler

   .weak UART5_IRQHandler
   .thumb_set UART5_IRQHandler,Default_Handler

   .weak TIM6_DAC_IRQHandler
   .thumb_set TIM6_DAC_IRQHandler,Default_Handler

   .weak TIM7_IRQHandler
   .thumb_set TIM7_IRQHandler,Default_Handler

   .weak DMA2_Stream0_IRQHandler
   .thumb_set DMA2_Stream0_IRQHandler,Default_Handler

   .weak DMA2_Stream1_IRQHandler
   .thumb_set DMA2_Stream1_IRQHandler,Default_Handler

   .weak DMA2_Stream2_IRQHandler
   .thumb_set DMA2_Stream2_IRQHandler,Default_Handler

   .weak DMA2_Stream3_IRQHandler
   .thumb_set DMA2_Stream3_IRQHandler,Default_Handler

   .weak DMA2_Stream4_IRQHandler
   .thumb_set DMA2_Stream4_IRQHandler,Default_Handler

   .weak ETH_IRQHandler
   .thumb_set ETH_IRQHandler,Default_Handler

   .weak ETH_WKUP_IRQHandler
   .thumb_set ETH_WKUP_IRQHandler,Default_Handler

   .weak FDCAN_CAL_IRQHandler
   .thumb_set FDCAN_CAL_IRQHandler,Default_Handler

   .weak DMA2_Stream5_IRQHandler
   .thumb_set DMA2_Stream5_IRQHandler,Default_Handler

   .weak DMA2_Stream6_IRQHandler
   .thumb_set DMA2_Stream6_IRQHandler,Default_Handler

   .weak DMA2_Stream7_IRQHandler
   .thumb_set DMA2_Stream7_IRQHandler,Default_Handler

   .weak USART6_IRQHandler
   .thumb_set USART6_IRQHandler,Default_Handler

   .weak I2C3_EV_IRQHandler
   .thumb_set I2C3_EV_IRQHandler,Default_Handler

   .weak I2C3_ER_IRQHandler
   .thumb_set I2C3_ER_IRQHandler,Default_Handler

   .weak OTG_HS_EP1_OUT_IRQHandler
   .thumb_set OTG_HS_EP1_OUT_IRQHandler,Default_Handler

   .weak OTG_HS_EP1_IN_IRQHandler
   .thumb_set OTG_HS_EP1_IN_IRQHandler,Default_Handler

   .weak OTG_HS_WKUP_IRQHandler
   .thumb_set OTG_HS_WKUP_IRQHandler,Default_Handler

   .weak OTG_HS_IRQHandler
   .thumb_set OTG_HS_IRQHandler,Default_Handler

   .weak DCMI_IRQHandler
   .thumb_set DCMI_IRQHandler,Default_Handler

   .weak RNG_IRQHandler
   .thumb_set RNG_IRQHandler,Default_Handler

   .weak FPU_IRQHandler
   .thumb_set FPU_IRQHandler,Default_Handler

   .weak UART7_IRQHandler
   .thumb_set UART7_IRQHandler,Default_Handler

   .weak UART8_IRQHandler
   .thumb_set UART8_IRQHandler,Default_Handler

   .weak SPI4_IRQHandler
   .thumb_set SPI4_IRQHandler,Default_Handler

   .weak SPI5_IRQHandler
   .thumb_set SPI5_IRQHandler,Default_Handler

   .weak SPI6_IRQHandler
   .thumb_set SPI6_IRQHandler,Default_Handler

   .weak SAI1_IRQHandler
   .thumb_set SAI1_IRQHandler,Default_Handler

   .weak LTDC_IRQHandler
   .thumb_set LTDC_IRQHandler,Default_Handler

   .weak LTDC_ER_IRQHandler
   .thumb_set LTDC_ER_IRQHandler,Default_Handler

   .weak DMA2D_IRQHandler
   .thumb_set DMA2D_IRQHandler,Default_Handler

   .weak SAI2_IRQHandler
   .thumb_set SAI2_IRQHandler,Default_Handler

   .weak QUADSPI_IRQHandler
   .thumb_set QUADSPI_IRQHandler,Default_Handler

   .weak LPTIM1_IRQHandler
   .thumb_set LPTIM1_IRQHandler,Default_Handler

   .weak CEC_IRQHandler
   .thumb_set CEC_IRQHandler,Default_Handler

   .weak I2C4_EV_IRQHandler
   .thumb_set I2C4_EV_IRQHandler,Default_Handler

   .weak I2C4_ER_IRQHandler
   .thumb_set I2C4_ER_IRQHandler,Default_Handler

   .weak SPDIF_RX_IRQHandler
   .thumb_set SPDIF_RX_IRQHandler,Default_Handler

   .weak OTG_FS_EP1_OUT_IRQHandler
   .thumb_set OTG_FS_EP1_OUT_IRQHandler,Default_Handler

   .weak OTG_FS_EP1_IN_IRQHandler
   .thumb_set OTG_FS_EP1_IN_IRQHandler,Default_Handler

   .weak OTG_FS_WKUP_IRQHandler
   .thumb_set OTG_FS_WKUP_IRQHandler,Default_Handler

   .weak OTG_FS_IRQHandler
   .thumb_set OTG_FS_IRQHandler,Default_Handler

   .weak DMAMUX1_OVR_IRQHandler
   .thumb_set DMAMUX1_OVR_IRQHandler,Default_Handler

   .weak HRTIM1_Master_IRQHandler
   .thumb_set HRTIM1_Master_IRQHandler,Default_Handler

   .weak HRTIM1_TIMA_IRQHandler
   .thumb_set HRTIM1_TIMA_IRQHandler,Default_Handler

   .weak HRTIM1_TIMB_IRQHandler
   .thumb_set HRTIM1_TIMB_IRQHandler,Default_Handler

   .weak HRTIM1_TIMC_IRQHandler
   .thumb_set HRTIM1_TIMC_IRQHandler,Default_Handler

   .weak HRTIM1_TIMD_IRQHandler
   .thumb_set HRTIM1_TIMD_IRQHandler,Default_Handler

   .weak HRTIM1_TIME_IRQHandler
   .thumb_set HRTIM1_TIME_IRQHandler,Default_Handler

   .weak HRTIM1_FLT_IRQHandler
   .thumb_set HRTIM1_FLT_IRQHandler,Default_Handler

   .weak DFSDM1_FLT0_IRQHandler
   .thumb_set DFSDM1_FLT0_IRQHandler,Default_Handler

   .weak DFSDM1_FLT1_IRQHandler
   .thumb_set DFSDM1_FLT1_IRQHandler,Default_Handler

   .weak DFSDM1_FLT2_IRQHandler
   .thumb_set DFSDM1_FLT2_IRQHandler,Default_Handler

   .weak DFSDM1_FLT3_IRQHandler
   .thumb_set DFSDM1_FLT3_IRQHandler,Default_Handler

   .weak SAI3_IRQHandler
   .thumb_set SAI3_IRQHandler,Default_Handler

   .weak SWPMI1_IRQHandler
   .thumb_set SWPMI1_IRQHandler,Default_Handler

   .weak TIM15_IRQHandler
   .thumb_set TIM15_IRQHandler,Default_Handler

   .weak TIM16_IRQHandler
   .thumb_set TIM16_IRQHandler,Default_Handler

   .weak TIM17_IRQHandler
   .thumb_set TIM17_IRQHandler,Default_Handler

   .weak MDIOS_WKUP_IRQHandler
   .thumb_set MDIOS_WKUP_IRQHandler,Default_Handler

   .weak MDIOS_IRQHandler
   .thumb_set MDIOS_IRQHandler,Default_Handler

   .weak JPEG_IRQHandler
   .thumb_set JPEG_IRQHandler,Default_Handler

   .weak MDMA_IRQHandler
   .thumb_set MDMA_IRQHandler,Default_Handler

   .weak SDMMC2_IRQHandler
   .thumb_set SDMMC2_IRQHandler,Default_Handler

   .weak HSEM1_IRQHandler
   .thumb_set HSEM1_IRQHandler,Default_Handler

   .weak ADC3_IRQHandler
   .thumb_set ADC3_IRQHandler,Default_Handler

   .weak DMAMUX2_OVR_IRQHandler
   .thumb_set DMAMUX2_OVR_IRQHandler,Default_Handler

   .weak BDMA_Channel0_IRQHandler
   .thumb_set BDMA_Channel0_IRQHandler,Default_Handler

   .weak BDMA_Channel1_IRQHandler
   .thumb_set BDMA_Channel1_IRQHandler,Default_Handler

   .weak BDMA_Channel2_IRQHandler
   .thumb_set BDMA_Channel2_IRQHandler,Default_Handler

   .weak BDMA_Channel3_IRQHandler
   .thumb_set BDMA_Channel3_IRQHandler,Default_Handler

   .weak BDMA_Channel4_IRQHandler
   .thumb_set BDMA_Channel4_IRQHandler,Default_Handler

   .weak BDMA_Channel5_IRQHandler
   .thumb_set BDMA_Channel5_IRQHandler,Default_Handler

   .weak BDMA_Channel6_IRQHandler
   .thumb_set BDMA_Channel6_IRQHandler,Default_Handler

   .weak BDMA_Channel7_IRQHandler
   .thumb_set BDMA_Channel7_IRQHandler,Default_Handler

   .weak COMP1_IRQHandler
   .thumb_set COMP1_IRQHandler,Default_Handler

   .weak LPTIM2_IRQHandler
   .thumb_set LPTIM2_IRQHandler,Default_Handler

   .weak LPTIM3_IRQHandler
   .thumb_set LPTIM3_IRQHandler,Default_Handler

   .weak LPTIM4_IRQHandler
   .thumb_set LPTIM4_IRQHandler,Default_Handler

   .weak LPTIM5_IRQHandler
   .thumb_set LPTIM5_IRQHandler,Default_Handler

   .weak LPUART1_IRQHandler
   .thumb_set LPUART1_IRQHandler,Default_Handler

   .weak CRS_IRQHandler
   .thumb_set CRS_IRQHandler,Default_Handler

   .weak ECC_IRQHandler
   .thumb_set ECC_IRQHandler,Default_Handler

   .weak SAI4_IRQHandler
   .thumb_set SAI4_IRQHandler,Default_Handler

   .weak WAKEUP_PIN_IRQHandler
   .thumb_set WAKEUP_PIN_IRQHandler,Default_Handler
