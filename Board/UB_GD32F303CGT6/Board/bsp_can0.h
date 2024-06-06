#ifndef INCLUDED_BSP_CAN0_H
#define INCLUDED_BSP_CAN0_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define CAN_BAUDRATE_1M         1000
#define CAN_BAUDRATE_500K       500
#define CAN_BAUDRATE_250K       250
#define CAN_BAUDRATE_125K       125
#define CAN_BAUDRATE_100K       100
#define CAN_BAUDRATE_50K        50



#define CAN_EOK         (0)
#define CAN_ETIMEOUT    (-1)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef void (*BSP_CAN0_RxHandler)(can_receive_message_struct* rxMsg, void* userdata);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void BSP_CAN0_Init(uint32_t BaudRate);

void BSP_CAN0_SetRxHandler(BSP_CAN0_RxHandler rxHandler, void* userdata);

int BSP_CAN0_Send(can_trasnmit_message_struct* txMsg);


#endif /*INCLUED_BSP_CAN0_H*/


