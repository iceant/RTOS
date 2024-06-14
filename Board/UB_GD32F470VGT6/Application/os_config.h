#ifndef INCLUDED_OS_CONFIG_H
#define INCLUDED_OS_CONFIG_H

#define RTOS_KERNEL_TLSF_POOL_SIZE (1024*10)
#define OS_NAME_SIZE 16
#define OS_TICKS_PER_SECOND 100

////////////////////////////////////////////////////////////////////////////////
////
#define ENABLE_4G
#define ENABLE_LED
#define ENABLE_USART0
#define ENABLE_I2C0
#define ENABLE_CAN0
#define ENABLE_SPI_FLASH
#define ENABLE_DS1307
//#define ENABLE_TFCARD
#define ENABLE_OLED
#define ENABLE_GD32F303
#define ENABLE_MQTT
#define ENABLE_KEY
#define ENABLE_LOCK
#define ENABLE_SDCARD
#define ENABLE_SDCARD_INFO
#define ENABLE_FAT_FILE_SYSTEM
#define ENABLE_FATFS_TEST


////////////////////////////////////////////////////////////////////////////////
////

//#define OS_SEM_DEBUG_ENABLE
//#define A7670C_IO_DEBUG

#endif /*INCLUDED_OS_CONFIG_H*/
