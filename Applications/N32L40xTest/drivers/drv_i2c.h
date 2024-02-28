#ifndef INCLUDED_DRV_I2C_H
#define INCLUDED_DRV_I2C_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_N32L40X_H
#define INCLUDED_N32L40X_H
#include <n32l40x.h>
#endif /*INCLUDED_N32L40X_H*/



////////////////////////////////////////////////////////////////////////////////
////
typedef struct dev_i2c_s{
    void* handle;
    int (*init)(void);
    int (*startup)(void);
    int (*reset)(void);
    int (*send)(uint8_t address, uint8_t * data, size_t size);
    int (*recv)(uint8_t address, uint8_t * data, size_t size);
}dev_i2c_t;



#endif /*INCLUDED_DRV_I2C_H*/
