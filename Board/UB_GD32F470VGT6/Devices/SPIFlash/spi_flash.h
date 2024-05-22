#ifndef INCLUDED_SPI_FLASH_H
#define INCLUDED_SPI_FLASH_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /* INCLUDED_STDINT_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
typedef struct sFLASH_IO_S{
    void (*Init)(void);
    void (*DeInit)(void);
    void (*CS_High)(void);
    void (*CS_Low)(void);
    uint8_t (*ReadByte)(void);
    uint8_t (*SendByte)(uint8_t byte);    
    uint16_t (*SendHalfWord)(uint16_t halfword);
}sFLASH_IO_T;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 

#define sFLASH_CMD_WRITE 0x02 /*!< Write to Memory instruction */
#define sFLASH_CMD_WRSR  0x01 /*!< Write Status Register instruction */
#define sFLASH_CMD_WREN  0x06 /*!< Write enable instruction */
#define sFLASH_CMD_READ  0x03 /*!< Read from Memory instruction */
#define sFLASH_CMD_RDSR  0x05 /*!< Read Status Register instruction  */
#define sFLASH_CMD_RDID  0x9F /*!< Read identification */
#define sFLASH_CMD_SE    0x20 /*!< Sector Erase instruction */
#define sFLASH_CMD_BE    0x52 /*!< Block Erase instruction (32k)*/
#define sFLASH_CMD_CE    0xC7 /*!< Chip Erase instruction */
//#define sFLASH_CMD_BE    0xD8 /*!< Block Erase instruction (64k)*/

#define sFLASH_WIP_FLAG 0x01 /*!< Write In Progress (WIP) flag */

#define sFLASH_DUMMY_BYTE   0xA5
#define sFLASH_SPI_PAGESIZE 0x100

#define sFLASH_W25Q128_ID       0x00EF4018
#define sFLASH_W25Q128_ID_DTR   0x00EF7018
#define sFLASH_GD25Q128_ID		0x00C84018

#define sFLASH_M25P64_ID  			0x202017

#if 1
#define sFLASH_SIZE                 0x1000000  /* 16MB */
#define sFLASH_BLOCK_COUNT          0xFF
#define sFLASH_BLOCK_SIZE           0xFFFF
#define sFLASH_BLOCK_SECTOR_COUNT   16
#define sFLASH_SECTOR_SIZE          4096
#endif 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 

void sFLASH_Init(sFLASH_IO_T* IO);

void sFLASH_DeInit(void);

void sFLASH_EraseSector(uint32_t SectorAddr);
void sFLASH_EraseBulk(void);
void sFLASH_WritePage(uint8_t* pBuffer, uint32_t WriteAddr, uint16_t NumByteToWrite);
void sFLASH_WriteBuffer(uint8_t* pBuffer, uint32_t WriteAddr, uint16_t NumByteToWrite);
void sFLASH_ReadBuffer(uint8_t* pBuffer, uint32_t ReadAddr, uint16_t NumByteToRead);
uint32_t sFLASH_ReadID(void);
void sFLASH_StartReadSequence(uint32_t ReadAddr);

uint8_t sFLASH_ReadByte(void);
uint8_t sFLASH_SendByte(uint8_t byte);
uint16_t sFLASH_SendHalfWord(uint16_t HalfWord);
void sFLASH_WriteEnable(void);
void sFLASH_WaitForWriteEnd(void);

#endif /* INCLUDED_SPI_FLASH_H */
