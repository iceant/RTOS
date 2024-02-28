#include <dev_i2c1.h>
#include <n32l40x.h>

////////////////////////////////////////////////////////////////////////////////
////
#define I2CT_FLAG_TIMEOUT ((uint32_t)0x1000)
#define I2CT_LONG_TIMEOUT ((uint32_t)(10 * I2CT_FLAG_TIMEOUT))

#define I2C_EBUSY           (-1)
#define I2C_EV5             (-2)
#define I2C_EV6             (-3)
#define I2C_EV7             (-4)
#define I2C_ESENDING        (-5)
#define I2C_ESENDED         (-6)
#define I2C_ERXDATNE        (-7)
#define I2C_EBYTEF          (-8)
#define I2C_EDRECVD         (-9)

static int I2C_Send(dev_i2c_t * i2c, uint8_t address, uint8_t * data, size_t data_size){
    int send_size = 0;
    uint32_t I2CTimeout             = I2CT_LONG_TIMEOUT;
    while (I2C_GetFlag(i2c->handle, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EBUSY;
        }
    }

    I2C_GenerateStart(((I2C_Module*)i2c->handle), ENABLE);

    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(((I2C_Module*)i2c->handle), I2C_EVT_MASTER_MODE_FLAG)) // EV5
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV5;
        }
    }

    I2C_SendAddr7bit(((I2C_Module*)i2c->handle), address, I2C_DIRECTION_SEND);
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(((I2C_Module*)i2c->handle), I2C_EVT_MASTER_TXMODE_FLAG)) // EV6
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV6;
        }
    }

    // send data
    while (data_size-- > 0)
    {
        I2C_SendData((I2C_Module*)i2c->handle, *data++);
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while (!I2C_CheckEvent((I2C_Module*)i2c->handle, I2C_EVT_MASTER_DATA_SENDING)) // EV8
        {
            if ((I2CTimeout--) == 0)
            {
                i2c->reset();
                return I2C_ESENDING;
            }
        }
        send_size++;
    }

    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent((I2C_Module*)i2c->handle, I2C_EVT_MASTER_DATA_SENDED)) // EV8-2
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_ESENDED;
        }
    }

    I2C_GenerateStop((I2C_Module*)i2c->handle, ENABLE);
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (I2C_GetFlag((I2C_Module*)i2c->handle, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EBUSY;
        }
    }


    return send_size;
}

static int I2C_Recv(dev_i2c_t * i2c, uint8_t address, uint8_t *buffer, size_t size){
    size_t recv_size = 0;
    uint32_t I2CTimeout             = I2CT_LONG_TIMEOUT;
    while (I2C_GetFlag(((I2C_Module*)i2c->handle), I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EBUSY;
        }
    }
    I2C_ConfigAck(((I2C_Module*)i2c->handle), ENABLE);

    // send start
    I2C_GenerateStart(((I2C_Module*)i2c->handle), ENABLE);

    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(((I2C_Module*)i2c->handle), I2C_EVT_MASTER_MODE_FLAG)) // EV5
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV5;
        }
    }

    // send addr
    I2C_SendAddr7bit(((I2C_Module*)i2c->handle), address, I2C_DIRECTION_RECV);
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(((I2C_Module*)i2c->handle), I2C_EVT_MASTER_RXMODE_FLAG)) // EV6
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV6;
        }
    }

    // recv data
    if (size == 1)
    {
        I2C_ConfigAck(((I2C_Module*)i2c->handle), DISABLE);
        (void)(((I2C_Module*)i2c->handle)->STS1); /// clear ADDR
        (void)(((I2C_Module*)i2c->handle)->STS2);
        I2C_GenerateStop(((I2C_Module*)i2c->handle), ENABLE);

        I2CTimeout = I2CT_LONG_TIMEOUT;
        while (!I2C_GetFlag(((I2C_Module*)i2c->handle), I2C_FLAG_RXDATNE))
        {
            if ((I2CTimeout--) == 0)
            {
                i2c->reset();
                return I2C_ERXDATNE;
            }
        }
        *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;
    }
    else if (size == 2)
    {
        ((I2C_Module*)i2c->handle)->CTRL1 |= 0x0800; /// set ACKPOS
        (void)(((I2C_Module*)i2c->handle)->STS1);
        (void)(((I2C_Module*)i2c->handle)->STS2);
        I2C_ConfigAck(((I2C_Module*)i2c->handle), DISABLE);

        I2CTimeout = I2CT_LONG_TIMEOUT;
        while (!I2C_GetFlag(((I2C_Module*)i2c->handle), I2C_FLAG_BYTEF))
        {
            if ((I2CTimeout--) == 0)
            {
                i2c->reset();
                return I2C_EBYTEF;
            }
        }

        I2C_GenerateStop(((I2C_Module*)i2c->handle), ENABLE);

        *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;
        *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;
    }
    else
    {
        I2C_ConfigAck(((I2C_Module*)i2c->handle), ENABLE);
        (void)(((I2C_Module*)i2c->handle)->STS1);
        (void)(((I2C_Module*)i2c->handle)->STS2);

        while (size)
        {
            if (size == 3)
            {
                I2CTimeout = I2CT_LONG_TIMEOUT;
                while (!I2C_GetFlag(((I2C_Module*)i2c->handle), I2C_FLAG_BYTEF))
                {
                    if ((I2CTimeout--) == 0)
                    {
                        i2c->reset();
                        return I2C_EBYTEF;
                    }
                }
                I2C_ConfigAck(((I2C_Module*)i2c->handle), DISABLE);
                *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;

                I2CTimeout = I2CT_LONG_TIMEOUT;
                while (!I2C_GetFlag(((I2C_Module*)i2c->handle), I2C_FLAG_BYTEF))
                {
                    if ((I2CTimeout--) == 0)
                    {
                        i2c->reset();
                        return I2C_EBYTEF;
                    }
                }

                I2C_GenerateStop(((I2C_Module*)i2c->handle), ENABLE);

                *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;
                *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;

                break;
            }

            I2CTimeout = I2CT_LONG_TIMEOUT;
            while (!I2C_CheckEvent(((I2C_Module*)i2c->handle), I2C_EVT_MASTER_DATA_RECVD_FLAG)) // EV7
            {
                if ((I2CTimeout--) == 0)
                {
                    i2c->reset();
                    return I2C_EDRECVD;
                }
            }
            *buffer++ = I2C_RecvData(((I2C_Module*)i2c->handle));size--; recv_size++;
        }
    }

    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (I2C_GetFlag(((I2C_Module*)i2c->handle), I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EDRECVD;
        }
    }
}

static void I2C_SwitchIOMode_Input(GPIO_Module* GPIOx, uint16_t GPIO_Pin, uint32_t GPIO_Alternate){
    GPIO_InitType i2cx_gpio;

    GPIO_InitStruct(&i2cx_gpio);
    i2cx_gpio.Pin               = GPIO_Pin;
    i2cx_gpio.GPIO_Slew_Rate    = GPIO_Slew_Rate_High;
    i2cx_gpio.GPIO_Mode         = GPIO_Mode_Input;
    i2cx_gpio.GPIO_Alternate    = GPIO_Alternate;
    i2cx_gpio.GPIO_Pull         = GPIO_No_Pull;
    GPIO_InitPeripheral(GPIOx, &i2cx_gpio);
}

static void I2C_SwitchIOMode_Output(GPIO_Module* GPIOx, uint16_t GPIO_Pin, uint32_t GPIO_Alternate){
    GPIO_InitType i2cx_gpio;

    GPIO_InitStruct(&i2cx_gpio);
    i2cx_gpio.Pin               = GPIO_Pin;
    i2cx_gpio.GPIO_Slew_Rate    = GPIO_Slew_Rate_High;
    i2cx_gpio.GPIO_Mode         = GPIO_Mode_AF_OD;
    i2cx_gpio.GPIO_Alternate    = GPIO_Alternate;
    i2cx_gpio.GPIO_Pull         = GPIO_Pull_Up;
    GPIO_InitPeripheral(GPIOx, &i2cx_gpio);
}
////////////////////////////////////////////////////////////////////////////////
////
static int I2C1_DevInit(void){
    I2C_InitType i2c_master;
    GPIO_InitType i2c_gpio;

    I2C_Module * I2Cx = I2C1;
    GPIO_Module * SCL_GPIO = GPIOB;
    uint16_t SCL_Pin = GPIO_PIN_8;
    uint32_t SCL_Alternate = GPIO_AF4_I2C1;

    GPIO_Module * SDA_GPIO = GPIOB;
    uint16_t SDA_Pin = GPIO_PIN_9;
    uint32_t SDA_Alternate = GPIO_AF4_I2C1;

    RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_I2C1, ENABLE);
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_AFIO, ENABLE);
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOB, ENABLE);

    /*PB8 -- SCL; PB9 -- SDA*/
    GPIO_InitStruct(&i2c_gpio);
    i2c_gpio.Pin               = SCL_Pin;
    i2c_gpio.GPIO_Slew_Rate    = GPIO_Slew_Rate_High;
    i2c_gpio.GPIO_Mode         = GPIO_Mode_AF_OD;
    i2c_gpio.GPIO_Alternate    = SCL_Alternate;
    i2c_gpio.GPIO_Pull         = GPIO_Pull_Up;
    GPIO_InitPeripheral(SCL_GPIO, &i2c_gpio);

    i2c_gpio.Pin               = SDA_Pin;
    i2c_gpio.GPIO_Slew_Rate    = GPIO_Slew_Rate_High;
    i2c_gpio.GPIO_Mode         = GPIO_Mode_AF_OD;
    i2c_gpio.GPIO_Alternate    = SDA_Alternate;
    i2c_gpio.GPIO_Pull         = GPIO_Pull_Up;
    GPIO_InitPeripheral(SDA_GPIO, &i2c_gpio);

    I2C_DeInit(I2Cx);
    i2c_master.BusMode     = I2C_BUSMODE_I2C;
    i2c_master.FmDutyCycle = I2C_FMDUTYCYCLE_2;
    i2c_master.OwnAddr1    = 0x00;
    i2c_master.AckEnable   = I2C_ACKEN;
    i2c_master.AddrMode    = I2C_ADDR_MODE_7BIT;
    i2c_master.ClkSpeed    = 100000; // 100K

    I2C_Init(I2Cx, &i2c_master);
    I2C_Enable(I2Cx, ENABLE);
    return 0;
}

static int I2C1_Send(uint8_t address, uint8_t* data, size_t size){
    return I2C_Send(&dev_I2C1, address, data, size);
}

static int I2C1_Recv(uint8_t address, uint8_t* data, size_t size){
    return I2C_Recv(&dev_I2C1, address, data, size);
}

static int I2C1_Reset(void){
    I2C_SwitchIOMode_Output(GPIOB, GPIO_PIN_8, GPIO_AF4_I2C1); /* SCL */
    I2C_SwitchIOMode_Input(GPIOB, GPIO_PIN_9, GPIO_NO_AF);  /* SDA */
    while(1){
        if(GPIO_ReadInputDataBit(GPIOB, GPIO_PIN_9)==0){
            for (int i = 0; i < 9; i++)
            {
                GPIO_SetBits(GPIOB, GPIO_PIN_8);
                __NOP();__NOP();__NOP();__NOP();__NOP();
                GPIO_ResetBits(GPIOB, GPIO_PIN_8);
                __NOP();__NOP();__NOP();__NOP();__NOP();
            }
        }else{
            I2C_GenerateStop(I2C1, ENABLE);
            __NOP();__NOP();__NOP();
            break;
        }
    }

    I2C1->CTRL1 |= 0x8000;
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    I2C1->CTRL1 &= ~0x8000;

    I2C1_DevInit();

    return 0;
}
////////////////////////////////////////////////////////////////////////////////
////
dev_i2c_t dev_I2C1={.handle=I2C1, .init=I2C1_DevInit, .startup=0, .send=I2C1_Send, .recv=I2C1_Recv, .reset=I2C1_Reset};

