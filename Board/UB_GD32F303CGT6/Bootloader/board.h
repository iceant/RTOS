#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/


#ifndef INCLUDED_BSP_USART1_H
#include <bsp_usart1.h>
#endif /*INCLUDED_BSP_USART1_H*/

#ifndef INCLUDED_BSP_CPUID_H
#include <bsp_cpuid.h>
#endif /*INCLUDED_BSP_CPUID_H*/


#define OS_ENABLE 1

////////////////////////////////////////////////////////////////////////////////
////
void Board_Init(void);

void Board_DeInit(void);

void Board_Reboot(void);

#endif /*INCLUDED_BOARD_H*/
