#ifndef INCLUDED_A7670C_H
#define INCLUDED_A7670C_H

////////////////////////////////////////////////////////////////////////////////
////


#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_BOARD_H
#include <board.h>
#endif /*INCLUDED_BOARD_H*/

////////////////////////////////////////////////////////////////////////////////
////


#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

#ifndef INCLUDED_CNTP_H
#include <CNTP.h>
#endif /*INCLUDED_CNTP_H*/

#ifndef INCLUDED_A7670C_MQTT_H
#include <A7670C_MQTT.h>
#endif /*INCLUDED_A7670C_MQTT_H*/

#ifndef INCLUDED_CPSI_H
#include <CPSI.h>
#endif /*INCLUDED_CPSI_H*/

#ifndef INCLUDED_CREG_H
#include <CREG.h>
#endif /*INCLUDED_CREG_H*/

#ifndef INCLUDED_CEREG_H
#include <CEREG.h>
#endif /*INCLUDED_CEREG_H*/


#ifndef INCLUDED_CGACT_H
#include <CGACT.h>
#endif /*INCLUDED_CGACT_H*/

#ifndef INCLUDED_CGDCONT_H
#include <CGDCONT.h>
#endif /*INCLUDED_CGDCONT_H*/

#ifndef INCLUDED_CGREG_H
#include <CGREG.h>
#endif /*INCLUDED_CGREG_H*/

#ifndef INCLUDED_CPIN_H
#include <CPIN.h>
#endif /*INCLUDED_CPIN_H*/

#ifndef INCLUDED_ICCID_H
#include <ICCID.h>
#endif /*INCLUDED_ICCID_H*/

#ifndef INCLUDED_CCLK_H
#include <CCLK.h>
#endif /*INCLUDED_CCLK_H*/

#ifndef INCLUDED_CSQ_H
#include <CSQ.h>
#endif /*INCLUDED_CSQ_H*/

#ifndef INCLUDED_SIMEI_H
#include <SIMEI.h>
#endif /*INCLUDED_SIMEI_H*/

#ifndef INCLUDED_ATI_H
#include <ATI.h>
#endif /*INCLUDED_ATI_H*/

#ifndef INCLUDED_ATE_H
#include <ATE.h>
#endif /*INCLUDED_ATE_H*/


////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_AT(os_tick_t ticks);

A7670C_Result A7670C_WaitPBDone(uint32_t timeout_ms);

A7670C_Result A7670C_Startup(void);

#endif /* INCLUDED_A7670C_H */
