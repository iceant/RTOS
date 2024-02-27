#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_N32L40X_H
#define INCLUDED_N32L40X_H
#include <n32l40x.h>
#endif /* INCLUDED_N32L40X_H */

#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /* INCLUDED_STDINT_H */

#ifndef INCLUDED_STDDEF_H
#define INCLUDED_STDDEF_H
#include <stddef.h>
#endif /* INCLUDED_STDDEF_H */

#ifndef INCLUDED_OS_RINGBUFFER_H
#include <os_ringbuffer.h>
#endif /*INCLUDED_OS_RINGBUFFER_H*/

#ifndef INCLUDED_DEV_USART1_H
#include <dev_usart1.h>
#endif /*INCLUDED_DEV_USART1_H*/


////////////////////////////////////////////////////////////////////////////////
////
void board_init(void);

#endif /* INCLUDED_BOARD_H */
