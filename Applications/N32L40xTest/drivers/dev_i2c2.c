#include <dev_i2c2.h>
#include <n32l40x.h>
#include <stdio.h>

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

////////////////////////////////////////////////////////////////////////////////
////
typedef struct dev_i2c_dma_handle_s{
    I2C_Module * I2Cx;
    DMA_ChannelType* DMA_CHx;
    uint32_t remap;
    uint32_t DMA_TC_Flag;
}dev_i2c_dma_handle_t;


////////////////////////////////////////////////////////////////////////////////
////

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

static int I2C_Recv(dev_i2c_t * i2c, uint8_t address, uint8_t *buffer, size_t size, bool isDMAHandle){
    size_t recv_size = 0;
    
    I2C_Module * I2Cx = 0;
    if(!isDMAHandle){
        I2Cx = ((I2C_Module*)i2c->handle);
    }else{
        I2Cx = ((dev_i2c_dma_handle_t*)i2c->handle)->I2Cx;
    }
    
    uint32_t I2CTimeout             = I2CT_LONG_TIMEOUT;
    while (I2C_GetFlag(I2Cx, I2C_FLAG_BUSY))
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EBUSY;
        }
    }
    I2Cx->CTRL1 &= ~0x0800; // clear POSEN
    I2C_ConfigAck(I2Cx, ENABLE);
    
    // send start
    I2C_GenerateStart(I2Cx, ENABLE);
    
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(I2Cx, I2C_EVT_MASTER_MODE_FLAG)) // EV5
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV5;
        }
    }
    
    // send addr
    I2C_SendAddr7bit(I2Cx, address, I2C_DIRECTION_RECV);
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(I2Cx, I2C_EVT_MASTER_RXMODE_FLAG)) // EV6
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
        I2C_ConfigAck(I2Cx, DISABLE);
        (void)(I2Cx->STS1); /// clear ADDR
        (void)(I2Cx->STS2);
        I2C_GenerateStop(I2Cx, ENABLE);
        
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while (!I2C_GetFlag(I2Cx, I2C_FLAG_RXDATNE))
        {
            if ((I2CTimeout--) == 0)
            {
                i2c->reset();
                return I2C_ERXDATNE;
            }
        }
        *buffer++ = I2C_RecvData(I2Cx);size--; recv_size++;
    }
    else if (size == 2)
    {
        I2Cx->CTRL1 |= 0x0800; /// set ACKPOS
        (void)(I2Cx->STS1);
        (void)(I2Cx->STS2);
        I2C_ConfigAck(I2Cx, DISABLE);
        
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while (!I2C_GetFlag(I2Cx, I2C_FLAG_BYTEF))
        {
            if ((I2CTimeout--) == 0)
            {
                i2c->reset();
                return I2C_EBYTEF;
            }
        }
        
        I2C_GenerateStop(I2Cx, ENABLE);
        
        *buffer++ = I2C_RecvData(I2Cx);size--; recv_size++;
        *buffer++ = I2C_RecvData(I2Cx);size--; recv_size++;
    }
    else
    {
        I2C_ConfigAck(I2Cx, ENABLE);
        (void)(I2Cx->STS1);
        (void)(I2Cx->STS2);
        
        while (size)
        {
            if (size == 3)
            {
                I2CTimeout = I2CT_LONG_TIMEOUT;
                while (!I2C_GetFlag(I2Cx, I2C_FLAG_BYTEF))
                {
                    if ((I2CTimeout--) == 0)
                    {
                        i2c->reset();
                        return I2C_EBYTEF;
                    }
                }
                I2C_ConfigAck(I2Cx, DISABLE);
                *buffer++ = I2C_RecvData(I2Cx);size--; recv_size++;
                
                I2CTimeout = I2CT_LONG_TIMEOUT;
                while (!I2C_GetFlag(I2Cx, I2C_FLAG_BYTEF))
                {
                    if ((I2CTimeout--) == 0)
                    {
                        i2c->reset();
                        return I2C_EBYTEF;
                    }
                }
                
                I2C_GenerateStop(I2Cx, ENABLE);
                
                *buffer++ = I2C_RecvData(I2Cx);size--; recv_size++;
                *buffer++ = I2C_RecvData(I2Cx);size--; recv_size++;
                
                break;
            }
            
            I2CTimeout = I2CT_LONG_TIMEOUT;
            while (!I2C_CheckEvent(((I2C_Module*)i2c->handle), I2C_EVT_MASTER_DATA_RECVD_FLAG)) // EV7
            {
                if ((I2CTimeout--) == 0)
                {
                    i2c->reset();
                    return I2C_EV7;
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
            return I2C_EBUSY;
        }
    }
    
    return recv_size;
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


static int I2C_DMA_Send(dev_i2c_t * i2c, uint8_t address, uint8_t* data, size_t data_size){
    DMA_InitType DMA_InitStructure;
    uint32_t I2CTimeout;
    
    dev_i2c_dma_handle_t* dma_handle = i2c->handle;
    
    /* DMA channel configuration ----------------------------------------------*/
    DMA_DeInit(dma_handle->DMA_CHx);
    DMA_InitStructure.PeriphAddr     = (uint32_t)&(dma_handle->I2Cx->DAT);//I2C2_DR_ADDR;
    DMA_InitStructure.MemAddr        = (uint32_t)(data+1);
    DMA_InitStructure.BufSize        = data_size-1;
    DMA_InitStructure.Direction      = DMA_DIR_PERIPH_DST;
    DMA_InitStructure.PeriphInc      = DMA_PERIPH_INC_DISABLE;     /// fixed
    DMA_InitStructure.DMA_MemoryInc  = DMA_MEM_INC_ENABLE;         /// fixed
    DMA_InitStructure.PeriphDataSize = DMA_PERIPH_DATA_SIZE_BYTE;  /// fixed
    DMA_InitStructure.MemDataSize    = DMA_MemoryDataSize_Byte;    /// fixed
    DMA_InitStructure.CircularMode   = DMA_MODE_NORMAL;            /// fixed
    DMA_InitStructure.Priority       = DMA_PRIORITY_VERY_HIGH;     /// up to user
    DMA_InitStructure.Mem2Mem        = DMA_M2M_DISABLE;            /// fixed
    DMA_Init(dma_handle->DMA_CHx, &DMA_InitStructure);
    DMA_RequestRemap(dma_handle->remap,DMA,dma_handle->DMA_CHx,ENABLE);
    
    
    ////////////////////////////////////////////////////////////////////////////////
    //// Step 1: Start
    
    /* Send I2C1 START condition */
    I2C_GenerateStart(dma_handle->I2Cx, ENABLE);
    
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(dma_handle->I2Cx, I2C_EVT_MASTER_MODE_FLAG)) // EV5
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV5;
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    //// Step 2: Slave Address
    
    /* Send I2C2 slave Address for write */
    I2C_SendAddr7bit(dma_handle->I2Cx, address, I2C_DIRECTION_SEND);
    /* Test on I2C1 EV6 and clear it */
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(dma_handle->I2Cx, I2C_EVT_MASTER_TXMODE_FLAG)){
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_EV6;
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    //// Step 3: Send Internal Address
    
    /** Send the DEVICE's internal address to write to */
    I2C_SendData(dma_handle->I2Cx, *data);
    /** Test on EV8 and clear it */
//    I2CTimeout = I2CT_LONG_TIMEOUT;
//    while (!I2C_CheckEvent(dma_handle->I2Cx, I2C_EVT_MASTER_DATA_SENDING))
//    {
//        if ((I2CTimeout--) == 0)
//        {
//            i2c->reset();
//            return I2C_ESENDING;
//        }
//    }
    
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!I2C_CheckEvent(dma_handle->I2Cx, I2C_EVT_MASTER_DATA_SENDED))
    {
        if ((I2CTimeout--) == 0)
        {
            i2c->reset();
            return I2C_ESENDED;
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    //// Step 4: Send Data
    /* Enable I2C1 DMA */
    I2C_EnableDMA(dma_handle->I2Cx, ENABLE);
    /* Enable DMA Channel5 */
    DMA_EnableChannel(dma_handle->DMA_CHx, ENABLE);
    
    /* DMA Channel transfer complete test */
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while (!DMA_GetFlagStatus(dma_handle->DMA_TC_Flag, DMA));
    
    ////////////////////////////////////////////////////////////////////////////////
    //// Step 5: Stop
    
    /* Send I2C1 STOP Condition */
    I2C_GenerateStop(dma_handle->I2Cx, ENABLE);
    
    return data_size;
}

////////////////////////////////////////////////////////////////////////////////
////
static os_mutex_t I2C2_Lock;
static int I2C2_DevInit(void){
    I2C_InitType i2c_master;
    GPIO_InitType i2c_gpio;
    
    I2C_Module * I2Cx = I2C2;
    GPIO_Module * SCL_GPIO = GPIOB;
    uint16_t SCL_Pin = GPIO_PIN_10;
    uint32_t SCL_Alternate = GPIO_AF6_I2C2;
    
    GPIO_Module * SDA_GPIO = GPIOB;
    uint16_t SDA_Pin = GPIO_PIN_11;
    uint32_t SDA_Alternate = GPIO_AF6_I2C2;
    
    RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_I2C2, ENABLE);
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_AFIO, ENABLE);
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOB, ENABLE);
    /* Enable DMA clock */
    RCC_EnableAHBPeriphClk(RCC_AHB_PERIPH_DMA, ENABLE);
    
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
    i2c_master.ClkSpeed    = 400000; // 100K
    
    I2C_Init(I2Cx, &i2c_master);
    I2C_Enable(I2Cx, ENABLE);
    
    os_mutex_init(&I2C2_Lock, "I2C2_Lock", OS_QUEUE_FIFO);
    
    return 0;
}


static int I2C2_Send(uint8_t address, uint8_t* data, size_t size){
    int err = 0;
    os_mutex_lock(&I2C2_Lock);
    err =  I2C_Send(&dev_I2C2, address, data, size);
//    err = I2C_DMA_Send(&dev_I2C1, address, data, size);
    os_mutex_unlock(&I2C2_Lock);
    return err;
}


static int I2C1_DMA_Send(uint8_t address, uint8_t* data, size_t size){
    int err = 0;
    os_mutex_lock(&I2C2_Lock);
    err =  I2C_Send(&dev_I2C2, address, data, size);
//    err = I2C_DMA_Send(&dev_I2C2, address, data, size);
    os_mutex_unlock(&I2C2_Lock);
    return err;
}



static int I2C2_Recv(uint8_t address, uint8_t* data, size_t size){
    int err = 0;
    os_mutex_lock(&I2C2_Lock);
    err = I2C_Recv(&dev_I2C2, address, data, size, false);
    os_mutex_unlock(&I2C2_Lock);
    return err;
}

static int I2C2_DMA_Recv(uint8_t address, uint8_t* data, size_t size){
    int err = 0;
    os_mutex_lock(&I2C2_Lock);
    err = I2C_Recv(&dev_I2C2, address, data, size, true);
    os_mutex_unlock(&I2C2_Lock);
    return err;
}

static int I2C2_Reset(void){
    os_mutex_lock(&I2C2_Lock);
    I2C_SwitchIOMode_Output(GPIOB, GPIO_PIN_10, GPIO_AF6_I2C2); /* SCL */
    I2C_SwitchIOMode_Input(GPIOB, GPIO_PIN_11, GPIO_AF6_I2C2);  /* SDA */
    while(1){
        printf("SCL: %d, SDA:%d\n", GPIO_ReadInputDataBit(GPIOB, GPIO_PIN_10), GPIO_ReadInputDataBit(GPIOB, GPIO_PIN_11));
        if(GPIO_ReadInputDataBit(GPIOB, GPIO_PIN_10)==0){
            for (int i = 0; i < 9; i++)
            {
                GPIO_SetBits(GPIOB, GPIO_PIN_10);
                __NOP();__NOP();__NOP();__NOP();__NOP();
                GPIO_ResetBits(GPIOB, GPIO_PIN_10);
                __NOP();__NOP();__NOP();__NOP();__NOP();
            }
        }else{
            I2C_GenerateStop(I2C2, ENABLE);
            __NOP();__NOP();__NOP();
            break;
        }
    }
    
    I2C2->CTRL1 |= 0x8000;
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    I2C2->CTRL1 &= ~0x8000;
    
    I2C2_DevInit();
    os_mutex_unlock(&I2C2_Lock);
    
    return 0;
}
////////////////////////////////////////////////////////////////////////////////
////

static dev_i2c_dma_handle_t dev_I2C1_DMA_Handle={.I2Cx=I2C2, .DMA_CHx=DMA_CH7, .remap = DMA_REMAP_I2C2_TX, .DMA_TC_Flag=DMA_FLAG_TC7};
//dev_i2c_t dev_I2C2={.handle=&dev_I2C1_DMA_Handle, .init=I2C2_DevInit, .startup=0, .send=I2C2_DMA_Send, .recv=I2C2_DMA_Recv, .reset=I2C2_Reset};
dev_i2c_t dev_I2C2={.handle=I2C2, .init=I2C2_DevInit, .startup=0, .send=I2C2_Send, .recv=I2C2_Recv, .reset=I2C2_Reset};

