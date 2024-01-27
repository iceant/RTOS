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

////////////////////////////////////////////////////////////////////////////////
////


void USART1_SendBytes(uint8_t* bytes, size_t size);

void USART1_SendString(const char* string);

#endif /* INCLUDED_BOARD_H */
