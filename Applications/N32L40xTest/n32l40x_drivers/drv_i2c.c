#include <drv_i2c.h>

////////////////////////////////////////////////////////////////////////////////
////

void drv_i2c_init(drv_i2c_t * i2c)
{
    i2c->status = DRV_I2C_STATUS_READY;
    os_mutex_init(&i2c->lock, NULL, OS_QUEUE_PRIO);
}

int drv_i2c_master_send(drv_i2c_t* i2c, uint32_t slave_address, uint8_t* data, uint32_t data_size, uint32_t timeout_ms
                        , void (onTimeout)(drv_i2c_t *, int))
{
    uint8_t* sendBufferPtr = data;
    uint32_t I2CTimeout = timeout_ms;

    os_mutex_lock(&i2c->lock);

    while (I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_BUSY);
            os_mutex_unlock(&i2c->lock);
            return -2001;
        }
    }

    if(i2c->status == DRV_I2C_STATUS_READY){
        I2C_GenerateStart(i2c->I2Cx, ENABLE);
        i2c->status = DRV_I2C_STATUS_START;
    }

    I2CTimeout = timeout_ms;

    while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_MODE_FLAG)) // EV5
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_MODE);
            os_mutex_unlock(&i2c->lock);
            return -2002;
        }
    }

    I2C_SendAddr7bit(i2c->I2Cx, slave_address, I2C_DIRECTION_SEND);
    I2CTimeout = timeout_ms;
    while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_TXMODE_FLAG)) // EV6
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_TXMODE);
            os_mutex_unlock(&i2c->lock);
            return -2003;
        }
    }

    i2c->status = DRV_I2C_STATUS_READY;

    // send data
    while (data_size-- > 0)
    {
        I2C_SendData(i2c->I2Cx, *sendBufferPtr++);
        I2CTimeout = timeout_ms;
        while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_DATA_SENDING)) // EV8
        {
            if ((I2CTimeout--) == 0)
            {
                onTimeout(i2c, DRV_I2C_ERR_MASTER_SENDING);
                os_mutex_unlock(&i2c->lock);
                return -2004;
            }
        }
    }

    I2CTimeout = timeout_ms;
    while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_DATA_SENDED)) // EV8-2
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_SENDED);
            os_mutex_unlock(&i2c->lock);
            return -2005;
        }
    }

    if (i2c->status == DRV_I2C_STATUS_READY)
    {
        i2c->status = DRV_I2C_STATUS_STOP;
        I2C_GenerateStop(i2c->I2Cx, ENABLE);
    }

    I2CTimeout = timeout_ms;
    while (I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_BUSY);
            os_mutex_unlock(&i2c->lock);
            return -2006;
        }
    }

    i2c->status = DRV_I2C_STATUS_READY;
    os_mutex_unlock(&i2c->lock);

    return 0;
}


int drv_i2c_master_read(drv_i2c_t* i2c, uint32_t slave_address, uint8_t* data, uint32_t data_size, uint32_t timeout_ms,
                        void (onTimeout)(drv_i2c_t*, int))
{
    os_mutex_lock(&i2c->lock);

    uint8_t* recvBufferPtr = data;
    uint32_t I2CTimeout = timeout_ms;

    while (I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_BUSY);
            os_mutex_unlock(&i2c->lock);
            return -1000;
        }
    }

    I2C_ConfigAck(i2c->I2Cx, ENABLE);

    // send start
    if (i2c->status == DRV_I2C_STATUS_READY)
    {
        i2c->status = DRV_I2C_STATUS_START;
        I2C_GenerateStart(i2c->I2Cx, ENABLE);
    }

    I2CTimeout = timeout_ms;
    while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_MODE_FLAG)) // EV5
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_MODE);
            os_mutex_unlock(&i2c->lock);
            return -1001;
        }
    }

    // send addr
    I2C_SendAddr7bit(i2c->I2Cx, slave_address, I2C_DIRECTION_RECV);
    I2CTimeout = timeout_ms;
    while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_RXMODE_FLAG)) // EV6
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_RXMODE);
            os_mutex_unlock(&i2c->lock);
            return -1002;
        }
    }
    i2c->status = DRV_I2C_STATUS_READY;

    // recv data
    if (data_size == 1)
    {
        I2C_ConfigAck(i2c->I2Cx, DISABLE);
        (void)(i2c->I2Cx->STS1); /// clear ADDR
        (void)(i2c->I2Cx->STS2);
        if (i2c->status == DRV_I2C_STATUS_READY)
        {
            i2c->status = DRV_I2C_STATUS_STOP;
            I2C_GenerateStop(i2c->I2Cx, ENABLE);
        }

        I2CTimeout = timeout_ms;
        while (!I2C_GetFlag(i2c->I2Cx, I2C_FLAG_RXDATNE))
        {
            if ((I2CTimeout--) == 0)
            {
                onTimeout(i2c, DRV_I2C_ERR_MASTER_RECV);
                os_mutex_unlock(&i2c->lock);
                return -1003;
            }
        }
        *recvBufferPtr++ = I2C_RecvData(I2C1);
        data_size--;
    }
    else if (data_size == 2)
    {
        i2c->I2Cx->CTRL1 |= 0x0800; /// set ACKPOS
        (void)(i2c->I2Cx->STS1);
        (void)(i2c->I2Cx->STS2);
        I2C_ConfigAck(i2c->I2Cx, DISABLE);

        I2CTimeout = timeout_ms;
        while (!I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BYTEF))
        {
            if ((I2CTimeout--) == 0)
            {
                onTimeout(i2c, DRV_I2C_ERR_MASTER_BYTEF);
                os_mutex_unlock(&i2c->lock);
                return -1004;
            }
        }

        if (i2c->status == DRV_I2C_STATUS_READY)
        {
            i2c->status = DRV_I2C_STATUS_STOP;
            I2C_GenerateStop(i2c->I2Cx, ENABLE);
        }

        *recvBufferPtr++ = I2C_RecvData(i2c->I2Cx);
        data_size--;
        *recvBufferPtr++ = I2C_RecvData(i2c->I2Cx);
        data_size--;
    }
    else
    {
        I2C_ConfigAck(i2c->I2Cx, ENABLE);
        (void)(i2c->I2Cx->STS1);
        (void)(i2c->I2Cx->STS2);

        while (data_size)
        {
            if (data_size == 3)
            {
                I2CTimeout = timeout_ms;
                while (!I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BYTEF))
                {
                    if ((I2CTimeout--) == 0)
                    {
                        onTimeout(i2c, DRV_I2C_ERR_MASTER_BYTEF);
                        os_mutex_unlock(&i2c->lock);
                        return -1005;
                    }
                }
                I2C_ConfigAck(i2c->I2Cx, DISABLE);
                *recvBufferPtr++ = I2C_RecvData(i2c->I2Cx);
                data_size--;

                I2CTimeout = timeout_ms;
                while (!I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BYTEF))
                {
                    if ((I2CTimeout--) == 0)
                    {
                        onTimeout(i2c, DRV_I2C_ERR_MASTER_BYTEF);
                        os_mutex_unlock(&i2c->lock);
                        return -1006;
                    }
                }

                if (i2c->status == DRV_I2C_STATUS_READY)
                {
                    i2c->status = DRV_I2C_STATUS_STOP;
                    I2C_GenerateStop(i2c->I2Cx, ENABLE);
                }

                *recvBufferPtr++ = I2C_RecvData(i2c->I2Cx);
                data_size--;
                *recvBufferPtr++ = I2C_RecvData(i2c->I2Cx);
                data_size--;

                break;
            }

            I2CTimeout = timeout_ms;
            while (!I2C_CheckEvent(i2c->I2Cx, I2C_EVT_MASTER_DATA_RECVD_FLAG)) // EV7
            {
                if ((I2CTimeout--) == 0)
                {
                    onTimeout(i2c, DRV_I2C_ERR_MASTER_RECVD);
                    os_mutex_unlock(&i2c->lock);
                    return -1007;
                }
            }
            *recvBufferPtr++ = I2C_RecvData(i2c->I2Cx);
            data_size--;
        }
    }

    I2CTimeout = timeout_ms;
    while (I2C_GetFlag(i2c->I2Cx, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            onTimeout(i2c, DRV_I2C_ERR_MASTER_BUSY);
            os_mutex_unlock(&i2c->lock);
            return -1008;
        }
    }
    i2c->status = DRV_I2C_STATUS_READY;

    return 0;
}
