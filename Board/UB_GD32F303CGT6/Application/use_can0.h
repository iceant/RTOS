#ifndef INCLUDED_USE_CAN0_H
#define INCLUDED_USE_CAN0_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_BSP_CAN0_H
#include <bsp_can0.h>
#endif /*INCLUDED_BSP_CAN0_H*/

#ifndef INCLUDED_SDK_RING_H
#include <sdk_ring.h>
#endif /*INCLUDED_SDK_RING_H*/


////////////////////////////////////////////////////////////////////////////////
////

typedef void (*USE_CAN0_OnTimeout_Handler)(sdk_ring_t * buffer, void* userdata);

void USE_CAN0_Init(void);

void USE_CAN0_SetOnTimeoutHandler(USE_CAN0_OnTimeout_Handler handler, void* userdata);



#endif /*INCLUDED_USE_CAN0_H*/
