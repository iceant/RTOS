#include <bsp_spi0.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#define SPI_CLOCK       RCU_SPI0

#define SPI_SCK_CLOCK   RCU_GPIOB
#define SPI_SCK_GPIO    GPIOB
#define SPI_SCK_PIN     GPIO_PIN_3
#define SPI_SCK_AF      GPIO_AF_5

#define SPI_MISO_CLOCK   RCU_GPIOB
#define SPI_MISO_GPIO    GPIOB
#define SPI_MISO_PIN     GPIO_PIN_4
#define SPI_MISO_AF      GPIO_AF_5

#define SPI_MOSI_CLOCK   RCU_GPIOB
#define SPI_MOSI_GPIO    GPIOB
#define SPI_MOSI_PIN     GPIO_PIN_5
#define SPI_MOSI_AF      GPIO_AF_5

#define SPI_CS_CLOCK     RCU_GPIOB
#define SPI_CS_GPIO      GPIOB
#define SPI_CS_PIN       GPIO_PIN_7

#define SPIx             SPI0

#define SPI_CS_HIGH      gpio_bit_set(SPI_CS_GPIO,SPI_CS_PIN)
#define SPI_CS_LOW       gpio_bit_reset(SPI_CS_GPIO,SPI_CS_PIN)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
void BSP_SPI0_Init(void)
{
    rcu_periph_clock_enable(SPI_SCK_CLOCK);
    rcu_periph_clock_enable(SPI_MISO_CLOCK);
    rcu_periph_clock_enable(SPI_MOSI_CLOCK);
    rcu_periph_clock_enable(SPI_CS_CLOCK);
    rcu_periph_clock_enable(SPI_CLOCK);
    
    
    /* configure SPI GPIO */
    gpio_af_set(SPI_SCK_GPIO, SPI_SCK_AF, SPI_SCK_PIN);
    gpio_mode_set(SPI_SCK_GPIO, GPIO_MODE_AF, GPIO_PUPD_NONE, SPI_SCK_PIN);
    gpio_output_options_set(SPI_SCK_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, SPI_SCK_PIN);
    
    gpio_af_set(SPI_MISO_GPIO, SPI_MISO_AF, SPI_MISO_PIN);
    gpio_mode_set(SPI_MISO_GPIO, GPIO_MODE_AF, GPIO_PUPD_NONE, SPI_MISO_PIN);
    gpio_output_options_set(SPI_MISO_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, SPI_MISO_PIN);
    
    gpio_af_set(SPI_MOSI_GPIO, SPI_MISO_AF, SPI_MOSI_PIN);
    gpio_mode_set(SPI_MOSI_GPIO, GPIO_MODE_AF, GPIO_PUPD_NONE, SPI_MOSI_PIN);
    gpio_output_options_set(SPI_MOSI_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, SPI_MOSI_PIN);
    
    gpio_mode_set(SPI_CS_GPIO, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, SPI_CS_PIN);
    gpio_output_options_set(SPI_CS_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, SPI_CS_PIN);
    
    
    SPI_CS_HIGH;
    
    spi_parameter_struct spi_init_struct;

    /* configure SPI1 parameter */
    spi_init_struct.trans_mode           = SPI_TRANSMODE_FULLDUPLEX;
    spi_init_struct.device_mode          = SPI_MASTER;
    spi_init_struct.frame_size           = SPI_FRAMESIZE_8BIT;
    spi_init_struct.clock_polarity_phase = SPI_CK_PL_HIGH_PH_2EDGE;
    spi_init_struct.nss                  = SPI_NSS_SOFT;
    spi_init_struct.prescale             = SPI_PSC_2;
    spi_init_struct.endian               = SPI_ENDIAN_MSB;
    spi_init(SPIx, &spi_init_struct);
    
    #if 0
    spi_crc_polynomial_set(SPIx, 7);
    spi_crc_on(SPIx);
    #endif
    
    /* enable SPI */
    spi_enable(SPIx);
    
}

void BSP_SPI0_DeInit(void)
{
    spi_disable(SPIx);
    
    spi_i2s_deinit(SPIx);
    
    /*!< sFLASH_SPI Periph clock disable */
    rcu_periph_clock_disable(SPI_CLOCK);
    
    /*!< Configure sFLASH_SPI pins: SCK */
    gpio_mode_set(SPI_SCK_GPIO, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SPI_SCK_PIN);
    
    /*!< Configure sFLASH_SPI pins: MISO */
    gpio_mode_set(SPI_MISO_GPIO, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SPI_MISO_PIN);
    
    /*!< Configure sFLASH_SPI pins: MOSI */
    gpio_mode_set(SPI_MOSI_GPIO, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SPI_MOSI_PIN);
    
    /*!< Configure sFLASH_CS_PIN pin: sFLASH Card CS pin */
    gpio_mode_set(SPI_CS_GPIO, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SPI_CS_PIN);
}

void BSP_SPI0_CS_High(void)
{
    SPI_CS_HIGH;
}

void BSP_SPI0_CS_Low(void)
{
    SPI_CS_LOW;
}

uint8_t BSP_SPI0_SendByte(uint8_t byte)
{
    while(RESET == spi_i2s_flag_get(SPIx, SPI_FLAG_TBE));
    spi_i2s_data_transmit(SPIx, byte);    
    
    while(RESET == spi_i2s_flag_get(SPIx, SPI_FLAG_RBNE));
    return  spi_i2s_data_receive(SPIx);    
}

uint16_t BSP_SPI0_SendHalfWord(uint16_t halfWord)
{
    while(RESET == spi_i2s_flag_get(SPIx, SPI_FLAG_TBE));
    spi_i2s_data_transmit(SPIx, halfWord);
        
    while(RESET == spi_i2s_flag_get(SPIx, SPI_FLAG_RBNE));
    return spi_i2s_data_receive(SPIx);
}



