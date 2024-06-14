#ifndef INCLUDED_EXCEPTION_TEST_H
#define INCLUDED_EXCEPTION_TEST_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

////////////////////////////////////////////////////////////////////////////////
////
#define EXCEPTION_TEST_BUS_FAULT_READ_FROM_RESERVED_ADDRESS
#define EXCEPTION_TEST_BUS_FAULT_WRITE_RESERVED_ADDRESS


////////////////////////////////////////////////////////////////////////////////
////


int Exception_Test_BusFault_Read(void);

int Exception_Test_BusFault_Write(void);

int Exception_Test_UsageFault_ExecNoThumb(void);

int Exception_Test_BusFault_Exec(void);

int Exception_Test_UsageFault_ExecUndefinedInstruction(void);

int Exception_Test_UsageFault_UnalignedWordAccess(void);

int Exception_Test_UsageFault_DivideByZero(void);

int Exception_Test_HardFault_InterruptWithIllegalVectorTable(void);


#endif /*INCLUDED_EXCEPTION_TEST_H*/
