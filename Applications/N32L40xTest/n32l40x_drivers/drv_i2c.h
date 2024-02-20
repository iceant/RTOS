#ifndef INCLUDED_DRV_I2C_H
#define INCLUDED_DRV_I2C_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_N32L40X_H
#include <n32l40x.h>
#endif /*INCLUDED_N32L40X_H*/

#ifndef INCLUDED_OS_MUTEX_H
#include <os_mutex.h>
#endif /*INCLUDED_OS_MUTEX_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct drv_i2c_s{
    I2C_Module * I2Cx;
    int status;
    os_mutex_t lock;
}drv_i2c_t;

////////////////////////////////////////////////////////////////////////////////
////
#define DRV_I2C_ERR_MASTER_BUSY     (-1)
#define DRV_I2C_ERR_MASTER_MODE     (-2)
#define DRV_I2C_ERR_MASTER_TXMODE   (-3)
#define DRV_I2C_ERR_MASTER_SENDING  (-4)
#define DRV_I2C_ERR_MASTER_SENDED   (-5)
#define DRV_I2C_ERR_MASTER_RXMODE   (-6)
#define DRV_I2C_ERR_MASTER_RECV     (-7)
#define DRV_I2C_ERR_MASTER_BYTEF    (-8)
#define DRV_I2C_ERR_MASTER_RECVD    (-9)

#define DRV_I2C_STATUS_READY    1
#define DRV_I2C_STATUS_START    2
#define DRV_I2C_STATUS_STOP     4
////////////////////////////////////////////////////////////////////////////////
////

void drv_i2c_init(drv_i2c_t * i2c);

int drv_i2c_master_send(drv_i2c_t* i2c, uint32_t slave_address, uint8_t* data, uint32_t data_size, uint32_t timeout_ms
        , void (onTimeout)(drv_i2c_t *, int /*err*/));

int drv_i2c_master_read(drv_i2c_t* i2c, uint32_t slave_address, uint8_t* data, uint32_t data_size, uint32_t timeout_ms,
                        void (onTimeout)(drv_i2c_t*, int /*err*/));


#endif /*INCLUDED_DRV_I2C_H*/
