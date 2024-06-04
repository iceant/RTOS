#include <bsp_i2c1.h>
#include <stdio.h>
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
#define I2C_OWN_ADDRESS7 0x00

#define I2C_SCL_GPIO_CLOCK          RCU_GPIOB
#define I2C_SDA_GPIO_CLOCK          RCU_GPIOB
#define I2C_CLOCK 				    RCU_I2C1

#define I2C_SCL_GPIOX 			    GPIOB
#define I2C_SCL_ALF 		        GPIO_AF_4
#define I2C_SCL_PIN 				GPIO_PIN_10

#define I2C_SDA_GPIOX 			    GPIOB
#define I2C_SDA_ALF  		        GPIO_AF_4
#define I2C_SDA_PIN 				GPIO_PIN_11

#define I2Cx                        I2C1

#define I2CT_FLAG_TIMEOUT           ((uint32_t)0x1000)
#define I2CT_LONG_TIMEOUT           ((uint32_t)(10 * I2CT_FLAG_TIMEOUT))
#define I2C_TIME_OUT                I2CT_LONG_TIMEOUT

#define I2C_TX_DMA_CLOCK            RCU_DMA0
#define I2C_TX_DMAx                 DMA0
#define I2C_TX_DMA_CHn              DMA_CH7
#define I2C_TX_DMA_SUBPERIx         DMA_SUBPERI7

#define I2C_RX_DMA_CLOCK            RCU_DMA0
#define I2C_RX_DMAx                 DMA0
#define I2C_RX_DMA_CHn              DMA_CH3
#define I2C_RX_DMA_SUBPERIx         DMA_SUBPERI7

#define I2C_SPEED                   100000

#define I2C_OK          1
#define I2C_FAIL        -1
#define I2C_END         0

#define I2C1_DEBUG 0

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 

typedef enum {
    I2C_START = 0,
    I2C_SEND_ADDRESS,
    I2C_CLEAR_ADDRESS_FLAG,
    I2C_TRANSMIT_DATA,
    I2C_STOP
} i2c_process_enum;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 

static void i2c_config(void)
{
    i2c_deinit(I2Cx);
    /* enable I2C clock */
    rcu_periph_clock_enable(I2C_CLOCK);
    /* configure I2C clock */
    i2c_clock_config(I2Cx, I2C_SPEED, I2C_DTCY_2);
    /* configure I2C address */
    i2c_mode_addr_config(I2Cx, I2C_I2CMODE_ENABLE, I2C_ADDFORMAT_7BITS, I2C_OWN_ADDRESS7);
    /* enable I2Cx */
    i2c_enable(I2Cx);
    /* enable acknowledge */
    //i2c_ack_config(I2Cx, I2C_ACK_ENABLE);
}

static void i2c_bus_reset(void){
    i2c_deinit(I2Cx);
    /* configure SDA/SCL for GPIO */
    GPIO_BC(I2C_SCL_GPIOX) |= I2C_SCL_PIN;
    GPIO_BC(I2C_SDA_GPIOX) |= I2C_SDA_PIN;
    gpio_output_options_set(I2C_SCL_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SDA_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, I2C_SDA_PIN);
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    /* stop signal */
    GPIO_BOP(I2C_SCL_GPIOX) |= I2C_SCL_PIN;
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    GPIO_BOP(I2C_SDA_GPIOX) |= I2C_SDA_PIN;
    /* connect I2C_SCL_PIN to I2C_SCL */
    /* connect I2C_SDA_PIN to I2C_SDA */
    gpio_output_options_set(I2C_SCL_GPIOX, GPIO_OTYPE_OD, GPIO_OSPEED_50MHZ, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SDA_GPIOX, GPIO_OTYPE_OD, GPIO_OSPEED_50MHZ, I2C_SDA_PIN);
    /* configure the I2Cx interface */
    i2c_config();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 

void BSP_I2C1_Init(void)
{
    /* enable GPIOB clock */
    rcu_periph_clock_enable(I2C_SCL_GPIO_CLOCK);
    rcu_periph_clock_enable(I2C_SDA_GPIO_CLOCK);
    
     /* I2C0 GPIO ports */
    /* connect PB6 to I2C1_SCL */
    gpio_af_set(I2C_SCL_GPIOX, I2C_SCL_ALF, I2C_SCL_PIN);
    /* connect PB7 to I2C0_SDA */
    gpio_af_set(I2C_SDA_GPIOX, I2C_SDA_ALF, I2C_SDA_PIN);

    /* configure I2C0 GPIO */
    gpio_mode_set(I2C_SCL_GPIOX, GPIO_MODE_AF, GPIO_PUPD_PULLUP, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SCL_GPIOX, GPIO_OTYPE_OD, GPIO_OSPEED_50MHZ, I2C_SCL_PIN);
    gpio_mode_set(I2C_SDA_GPIOX, GPIO_MODE_AF, GPIO_PUPD_PULLUP, I2C_SDA_PIN);
    gpio_output_options_set(I2C_SDA_GPIOX, GPIO_OTYPE_OD, GPIO_OSPEED_50MHZ, I2C_SDA_PIN);
    
    i2c_config();
}

void BSP_I2C1_EnableTxDMA(void)
{
    /* enable DMA0 clock */
    rcu_periph_clock_enable(I2C_TX_DMA_CLOCK);    
}

void BSP_I2C1_EnableRxDMA(void)
{
    /* enable DMA0 clock */
    rcu_periph_clock_enable(I2C_RX_DMA_CLOCK);    
}

int BSP_I2C1_DMATx(uint8_t address, uint8_t* data, int size)
{
    dma_single_data_parameter_struct dma_init_parameter;

    uint8_t state = I2C_START;
    uint16_t timeout = 0;
    uint8_t i2c_timeout_flag = 0;

    /* enable acknowledge */
    i2c_ack_config(I2Cx, I2C_ACK_ENABLE);
    while(i2c_timeout_flag!=I2C_OK) {
        switch(state) {
        case I2C_START:
            #if defined(I2C1_DEBUG)
            printf("I2C_START\r\n");
            #endif
            /* i2c master sends start signal only when the bus is idle */
            while(i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                i2c_start_on_bus(I2Cx);
                timeout = 0;
                state = I2C_SEND_ADDRESS;
            } else {
                i2c_bus_reset();
                timeout = 0;
                state = I2C_START;
                printf("i2c bus is busy in WRITE!\n");
            }
            break;
        case I2C_SEND_ADDRESS:
            #if defined(I2C1_DEBUG)
            printf("I2C_SEND_ADDRESS\r\n");
            #endif
            /* i2c master sends START signal successfully */
            while((!i2c_flag_get(I2Cx, I2C_FLAG_SBSEND)) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                i2c_master_addressing(I2Cx, address, I2C_TRANSMITTER);
                timeout = 0;
                state = I2C_CLEAR_ADDRESS_FLAG;
            } else {
                timeout = 0;
                state = I2C_START;
                printf("i2c master sends start signal timeout in WRITE!\n");
            }
            break;
        case I2C_CLEAR_ADDRESS_FLAG:
            #if defined(I2C1_DEBUG)
            printf("I2C_CLEAR_ADDRESS_FLAG\r\n");
            #endif
            /* address flag set means i2c slave sends ACK */
            while((!i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND)) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                i2c_flag_clear(I2Cx, I2C_FLAG_ADDSEND);
                timeout = 0;
                state = I2C_TRANSMIT_DATA;
            } else {
                timeout = 0;
                state = I2C_START;
                printf("i2c master clears address flag timeout in WRITE!\n");
            }
            break;
        case I2C_TRANSMIT_DATA:
            #if defined(I2C1_DEBUG)
            printf("I2C_TRANSMIT_DATA\r\n");
            #endif
            /* wait until the transmit data buffer is empty */
            while((!i2c_flag_get(I2Cx, I2C_FLAG_TBE)) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                /* send the EEPROM's internal address to write to : only one byte address */
                i2c_data_transmit(I2Cx, data[0]);
                timeout = 0;
            } else {
                timeout = 0;
                state = I2C_START;
                printf("i2c master sends EEPROM's internal address timeout in WRITE!\n");
            }
            /* wait until BTC bit is set */
            while(!i2c_flag_get(I2Cx, I2C_FLAG_BTC));
            dma_deinit(I2C_TX_DMAx, I2C_TX_DMA_CHn);
            dma_single_data_para_struct_init(&dma_init_parameter);
            dma_init_parameter.direction = DMA_MEMORY_TO_PERIPH;
            dma_init_parameter.memory0_addr = (uint32_t)&data[1];
            dma_init_parameter.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
            dma_init_parameter.periph_memory_width = DMA_MEMORY_WIDTH_8BIT;
            dma_init_parameter.number = size-1;
            dma_init_parameter.periph_addr = (uint32_t)&I2C_DATA(I2Cx);
            dma_init_parameter.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
            dma_init_parameter.priority = DMA_PRIORITY_ULTRA_HIGH;
            dma_single_data_mode_init(I2C_TX_DMAx, I2C_TX_DMA_CHn, &dma_init_parameter);

            /* configure DMA mode */
            dma_circulation_disable(I2C_TX_DMAx, I2C_TX_DMA_CHn);
            dma_channel_subperipheral_select(I2C_TX_DMAx, I2C_TX_DMA_CHn, I2C_TX_DMA_SUBPERIx);
            /* enable I2C DMA */
            i2c_dma_config(I2Cx, I2C_DMA_ON);
            /* enable DMA TX channel */
            dma_channel_enable(I2C_TX_DMAx, I2C_TX_DMA_CHn);
            /* wait until FTF bit is set */
            while(!dma_flag_get(I2C_TX_DMAx, I2C_TX_DMA_CHn, DMA_FLAG_FTF));
            /* wait until BTC bit is set */
            while((!i2c_flag_get(I2Cx, I2C_FLAG_BTC)) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                timeout = 0;
                state = I2C_STOP;
            } else {
                timeout = 0;
                state = I2C_START;
                printf("i2c master sends data timeout in WRITE!\n");
            }
            break;
        case I2C_STOP:
            #if defined(I2C1_DEBUG)
            printf("I2C_STOP\r\n");
            #endif
            /* send a stop condition to I2C bus */
            i2c_stop_on_bus(I2Cx);
            /* i2c master sends STOP signal successfully */
            while((I2C_CTL0(I2Cx) & I2C_CTL0_STOP) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                timeout = 0;
                state = I2C_END;
                i2c_timeout_flag = I2C_OK;
            } else {
                timeout = 0;
                state = I2C_START;
                printf("i2c master sends stop signal timeout in WRITE!\n");
            }
            break;
        default:
            #if defined(I2C1_DEBUG)
            printf("I2C_DEFAULT\r\n");
            #endif
            state = I2C_START;
            i2c_timeout_flag = I2C_OK;
            timeout = 0;
            printf("i2c master sends start signal in WRITE.\n");
            break;
        }
    }
    return I2C_END;
    
}

int BSP_I2C1_DMARx(uint8_t address, uint8_t* buffer, int size){
    dma_single_data_parameter_struct dma_init_parameter;

    uint8_t state = I2C_START;
    uint8_t read_cycle = RESET;
    uint16_t timeout = 0;
    int8_t i2c_timeout_flag = 0;

    /* enable acknowledge */
    i2c_ack_config(I2Cx, I2C_ACK_ENABLE);
    while(i2c_timeout_flag!=I2C_OK) {
        switch(state) {
        case I2C_START:
            #if defined(I2C1_DEBUG)
            printf("[DMARx] I2C_START\r\n");
            #endif
            if(RESET == read_cycle) {
                /* disable I2Cx */
                i2c_disable(I2Cx);
                /* enable I2Cx */
                i2c_enable(I2Cx);

                /* enable acknowledge */
                i2c_ack_config(I2Cx, I2C_ACK_ENABLE);
                /* i2c master sends start signal only when the bus is idle */
                while(i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY) && (timeout < I2C_TIME_OUT)) {
                    timeout++;
                }
                if(timeout < I2C_TIME_OUT) {
                    /* send the start signal */
                    i2c_start_on_bus(I2Cx);
                    timeout = 0;
                    state = I2C_SEND_ADDRESS;
                } else {
                    i2c_bus_reset();
                    timeout = 0;
                    state = I2C_START;
                    printf("i2c bus is busy in READ!\n");
                }
            } else {
                i2c_start_on_bus(I2Cx);
                timeout = 0;
                state = I2C_SEND_ADDRESS;
            }
            break;
        case I2C_SEND_ADDRESS:
            #if defined(I2C1_DEBUG)
            printf("[DMARx] I2C_SEND_ADDRESS\r\n");
            #endif
            /* i2c master sends START signal successfully */
            while((! i2c_flag_get(I2Cx, I2C_FLAG_SBSEND)) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                if(RESET == read_cycle) {
                    #if defined(I2C1_DEBUG)
                    printf("[DMARx] I2C_SEND_ADDRESS I2C_TRANSMITTER\r\n");
                    #endif
                    i2c_master_addressing(I2Cx, address, I2C_TRANSMITTER);
                    state = I2C_CLEAR_ADDRESS_FLAG;
                } else {
                    #if defined(I2C1_DEBUG)
                    printf("[DMARx] I2C_SEND_ADDRESS I2C_RECEIVER\r\n");
                    #endif
                    i2c_master_addressing(I2Cx, address, I2C_RECEIVER);
                    state = I2C_CLEAR_ADDRESS_FLAG;
                }
                timeout = 0;
            } else {
                timeout = 0;
                state = I2C_START;
                read_cycle = 0;
                printf("i2c master sends start signal timeout in READ!\n");
            }
            break;
        case I2C_CLEAR_ADDRESS_FLAG:
            #if defined(I2C1_DEBUG)
            printf("[DMARx] I2C_CLEAR_ADDRESS_FLAG\r\n");
            #endif
            /* address flag set means i2c slave sends ACK */
            while((!i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND)) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                i2c_flag_clear(I2Cx, I2C_FLAG_ADDSEND);
                timeout = 0;
                state = I2C_TRANSMIT_DATA;
            } else {
                timeout = 0;
                state = I2C_START;
                read_cycle = 0;
                printf("i2c master clears address flag timeout in READ!\n");
            }
            break;
        case I2C_TRANSMIT_DATA:
            #if defined(I2C1_DEBUG)
            printf("[DMARx] I2C_TRANSMIT_DATA\r\n");
            #endif
            if(RESET == read_cycle) {
                /* wait until the transmit data buffer is empty */
                while((! i2c_flag_get(I2Cx, I2C_FLAG_TBE)) && (timeout < I2C_TIME_OUT)) {
                    timeout++;
                }
                if(timeout < I2C_TIME_OUT) {
                    #if defined(I2C1_DEBUG)
                    printf("[DMARx] Slave Internal Address: %x\r\n", *buffer);
                    #endif
                    /* send the Device's internal address to write to : only one byte address */
                    i2c_data_transmit(I2Cx, *buffer);
                    timeout = 0;
                } else {
                    timeout = 0;
                    state = I2C_START;
                    read_cycle = 0;
                    printf("i2c master wait data buffer is empty timeout in READ!\n");
                }
                /* wait until BTC bit is set */
                while((!i2c_flag_get(I2Cx, I2C_FLAG_BTC)) && (timeout < I2C_TIME_OUT)) {
                    timeout++;
                }
                if(timeout < I2C_TIME_OUT) {
                    timeout = 0;
                    state = I2C_START;
                    read_cycle++;
                    size=size-1;
                    buffer++;
                } else {
                    timeout = 0;
                    state = I2C_START;
                    read_cycle = 0;
                    printf("i2c master sends EEPROM's internal address timeout in READ!\n");
                }
            } else {
                /* one byte master reception procedure (polling) */
                if(size < 2) {
                    #if defined(I2C1_DEBUG)
                    printf("[DMARx] size=%d <2\r\n", size);
                    #endif
                    /* disable acknowledge */
                    i2c_ack_config(I2Cx, I2C_ACK_DISABLE);
                    /* clear ADDSEND register by reading I2C_STAT0 then I2C_STAT1 register (I2C_STAT0 has already been read) */
                    i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND);
                    /* send a stop condition to I2C bus*/
                    i2c_stop_on_bus(I2Cx);
                    /* wait for the byte to be received */
                    while(!i2c_flag_get(I2Cx, I2C_FLAG_RBNE));
                    /* read the byte received from the EEPROM */
                    *buffer++ = i2c_data_receive(I2Cx);
                    /* decrement the read bytes counter */
                    size--;
                    timeout = 0;
                    state = I2C_STOP;
                } else {
                    /* more than one byte master reception procedure (DMA) */
                    dma_deinit(I2C_RX_DMAx, I2C_RX_DMA_CHn);
                    dma_single_data_para_struct_init(&dma_init_parameter);
                    dma_init_parameter.direction = DMA_PERIPH_TO_MEMORY;
                    dma_init_parameter.memory0_addr = (uint32_t)buffer;
                    dma_init_parameter.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
                    dma_init_parameter.periph_memory_width = DMA_MEMORY_WIDTH_8BIT;
                    dma_init_parameter.number = size;
                    dma_init_parameter.periph_addr = (uint32_t)&I2C_DATA(I2Cx);
                    dma_init_parameter.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
                    dma_init_parameter.priority = DMA_PRIORITY_ULTRA_HIGH;
                    dma_single_data_mode_init(I2C_RX_DMAx, I2C_RX_DMA_CHn, &dma_init_parameter);
                    /* configure DMA mode */
                    dma_circulation_disable(I2C_RX_DMAx, I2C_RX_DMA_CHn);
                    dma_channel_subperipheral_select(I2C_RX_DMAx, I2C_RX_DMA_CHn, I2C_RX_DMA_SUBPERIx);
                    i2c_dma_last_transfer_config(I2Cx, I2C_DMALST_ON);
                    /* enable I2C DMA */
                    i2c_dma_config(I2Cx, I2C_DMA_ON);
                    /* enable DMA RX channel */
                    dma_channel_enable(I2C_RX_DMAx, I2C_RX_DMA_CHn);
                    /* wait until FTF bit is set */
                    while(!dma_flag_get(I2C_RX_DMAx, I2C_RX_DMA_CHn, DMA_FLAG_FTF));
                    state = I2C_STOP;
                }
            }
            break;
        case I2C_STOP:
            #if defined(I2C1_DEBUG)
            printf("[DMARx] I2C_STOP\r\n");
            #endif
            /* send a stop condition to I2C bus */
            //i2c_stop_on_bus(I2Cx);
            /* i2c master sends STOP signal successfully */
            while((I2C_CTL0(I2Cx) & I2C_CTL0_STOP) && (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            if(timeout < I2C_TIME_OUT) {
                timeout = 0;
                state = I2C_END;
                i2c_timeout_flag = I2C_OK;
            } else {
                timeout = 0;
                state = I2C_START;
                read_cycle = 0;
                printf("i2c master sends stop signal timeout in READ!\n");
            }
            break;
        default:
            state = I2C_START;
            read_cycle = 0;
            i2c_timeout_flag = I2C_OK;
            timeout = 0;
            printf("i2c master sends start signal in READ.\n");
            break;
        }
    }
    return I2C_END;
}

int BSP_I2C1_Send(uint8_t address, uint8_t* data, int size)
{
    int i;
    uint32_t I2CTimeout = I2CT_LONG_TIMEOUT;
    
    /* wait until I2C bus is idle */
    while(i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY)){
        if((I2CTimeout--)==0){
            BSP_I2C1_Reset();
            return -1;
        }
    }
    
    /* send a start condition to I2C bus */
    i2c_start_on_bus(I2Cx);
    
     /* wait until SBSEND bit is set */
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while(!i2c_flag_get(I2Cx, I2C_FLAG_SBSEND))
    {
        if((I2CTimeout--)==0){
            BSP_I2C1_Reset();
            return -2;
        }
    }
    
    /* send slave address to I2C bus */
    i2c_master_addressing(I2Cx, address, I2C_TRANSMITTER);
    
    /* wait until ADDSEND bit is set */
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while(!i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND))
    {
        if((I2CTimeout--)==0){
            BSP_I2C1_Reset();
            return -3;
        }
    }
    
    /* clear ADDSEND bit */
    i2c_flag_clear(I2Cx, I2C_FLAG_ADDSEND);
    
    /* wait until the transmit data buffer is empty */
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while(!i2c_flag_get(I2Cx, I2C_FLAG_TBE))
    {
        if((I2CTimeout--)==0){
            BSP_I2C1_Reset();
            return -4;
        }
    }
    
    for(i = 0; i < size; i++) {
        /* data transmission */
        i2c_data_transmit(I2Cx, *data++);
        /* wait until the TBE bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_TBE))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -5;
            }
        }
    }
 
    /* send a stop condition to I2C bus */
    i2c_stop_on_bus(I2Cx);
    I2CTimeout = I2CT_LONG_TIMEOUT;
    while(I2C_CTL0(I2Cx) & I2C_CTL0_STOP)
    {
        if((I2CTimeout--)==0){
            BSP_I2C1_Reset();
            return -6;
        }
    }
    
    return 0;
}

int BSP_I2C1_Recv(uint8_t address, uint8_t * buffer, int size)
{
    int i;
    uint32_t I2CTimeout = I2CT_LONG_TIMEOUT;
    
    if(size==1){
        /* wait until I2C bus is idle */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY)){
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -1;
            }
        }
        
        /* send a start condition to I2C bus */
        i2c_start_on_bus(I2Cx);
        
        /* wait until SBSEND bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_SBSEND))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -2;
            }
        }
    
        /* send slave address to I2C bus */
        i2c_master_addressing(I2Cx, address, I2C_RECEIVER);
        
        /* wait until ADDSEND bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -3;
            }            
        }
        
        /* N=1,reset ACKEN bit before clearing ADDRSEND bit */
        i2c_ack_config(I2Cx, I2C_ACK_DISABLE);
        
        /* clear ADDSEND bit */
        i2c_flag_clear(I2Cx, I2C_FLAG_ADDSEND);
        
        /* N=1,send stop condition after clearing ADDRSEND bit */
        i2c_stop_on_bus(I2Cx);
        
        /* wait until the RBNE bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_RBNE))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -4;
            }         
        }
        
        /* read a data from I2C_DATA */
        *buffer++ = i2c_data_receive(I2Cx);
        
        /* wait until stop condition generate */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(I2C_CTL0(I2Cx) & I2C_CTL0_STOP)
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -5;
            }               
        }
        
        /* enable acknowledge */
        i2c_ack_config(I2Cx, I2C_ACK_ENABLE);

    }else if(size==2){
        
        /* send a NACK for the next data byte which will be received into the shift register */
        i2c_ackpos_config(I2Cx, I2C_ACKPOS_NEXT);
        
        /* wait until I2C bus is idle */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -10;
            }
        }
        
        /* send a start condition to I2C bus */
        i2c_start_on_bus(I2Cx);
        
        /* wait until SBSEND bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_SBSEND))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -11;
            }        
        }
        
        /* send slave address to I2C bus */
        i2c_master_addressing(I2Cx, address, I2C_RECEIVER);
        
        /* disable ACK before clearing ADDSEND bit */
        i2c_ack_config(I2Cx, I2C_ACK_DISABLE);
        
        /* wait until ADDSEND bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -12;
            }          
        }
        
        /* clear ADDSEND bit */
        i2c_flag_clear(I2Cx, I2C_FLAG_ADDSEND);
        
        /* Wait until the last data byte is received into the shift register */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_BTC))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -13;
            }         
        }
        
        /* wait until the RBNE bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_RBNE))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -14;
            }            
        }

        /* read a data from I2C_DATA */
        *buffer++ = i2c_data_receive(I2Cx);
        
        /* wait until the RBNE bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_RBNE))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -15;
            }               
        }
        
        /* read a data from I2C_DATA */
        *buffer++ = i2c_data_receive(I2Cx);
        
        /* send a stop condition */
        i2c_stop_on_bus(I2Cx);
        
        /* wait until stop condition generate */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(I2C_CTL0(I2Cx) & I2C_CTL0_STOP)
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -16;
            }          
        }
        i2c_ackpos_config(I2Cx, I2C_ACKPOS_CURRENT);
        
        /* enable acknowledge */
        i2c_ack_config(I2Cx, I2C_ACK_ENABLE);
    }else{
        /* wait until I2C bus is idle */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -21;
            }        
        }
        
        /* send a start condition to I2C bus */
        i2c_start_on_bus(I2Cx);
        
        /* wait until SBSEND bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_SBSEND))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -22;
            }               
        }
        
        /* send slave address to I2C bus */
        i2c_master_addressing(I2Cx, address, I2C_RECEIVER);
        
        /* wait until ADDSEND bit is set */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(!i2c_flag_get(I2Cx, I2C_FLAG_ADDSEND))
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -23;
            }          
        }
        
        /* clear ADDSEND bit */
        i2c_flag_clear(I2Cx, I2C_FLAG_ADDSEND);
        
        for(i = 0; i < size; i++) {
            if((size-3) == i) {
                /* wait until the second last data byte is received into the shift register */
                I2CTimeout = I2CT_LONG_TIMEOUT;
                while(!i2c_flag_get(I2Cx, I2C_FLAG_BTC))
                {
                    if((I2CTimeout--)==0){
                        BSP_I2C1_Reset();
                        return -24;
                    } 
                }
                /* disable acknowledge */
                i2c_ack_config(I2Cx, I2C_ACK_DISABLE);
            }
            /* wait until the RBNE bit is set */
            I2CTimeout = I2CT_LONG_TIMEOUT;
            while(!i2c_flag_get(I2Cx, I2C_FLAG_RBNE))
            {
                if((I2CTimeout--)==0){
                    BSP_I2C1_Reset();
                    return -25;
                } 
            }
            /* read a data from I2C_DATA */
            buffer[i] = i2c_data_receive(I2Cx);
        }
        /* send a stop condition to I2C bus */
        i2c_stop_on_bus(I2Cx);
        
        /* wait until stop condition generate */
        I2CTimeout = I2CT_LONG_TIMEOUT;
        while(I2C_CTL0(I2Cx) & I2C_CTL0_STOP)
        {
            if((I2CTimeout--)==0){
                BSP_I2C1_Reset();
                return -26;
            }         
        }
        
        /* enable acknowledge */
        i2c_ack_config(I2Cx, I2C_ACK_ENABLE);
    }
    
    return 0;
}

void BSP_I2C1_Reset(void){
    i2c_bus_reset();
}