#ifndef INCLUDED_CAN_H
#define INCLUDED_CAN_H


////////////////////////////////////////////////////////////////////////////////

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

////////////////////////////////////////////////////////////////////////////////

typedef struct CAN_CHM{
    uint8_t SPN2600[3];
}CAN_CHM;

typedef struct CAN_BHM{
    uint8_t SPN2601[2];
}CAN_BHM;

typedef struct CAN_CRM{
    uint8_t SPN2560;
    uint8_t SPN2561[4];
    uint8_t SPN2562[3];
}CAN_CRM;

typedef struct CAN_BRM{
    uint8_t SPN2565[3];
    uint8_t SPN2566;
    uint8_t SPN2567[2];
    uint8_t SPN2568[2];
    uint8_t SPN2569[4];
    uint8_t SPN2570[4];
    uint8_t SPN2571[3];
    uint8_t SPN2572[3];
    uint8_t SPN2573;
    uint8_t SPN2574;
    uint8_t SPN2575[17]; /*VIN*/
    uint8_t SPN2576[8];
}CAN_BRM;


typedef struct CAN_BCP{
    uint8_t SPN2816[2];
    uint8_t SPN2817[2];
    uint8_t SPN2818[2];
    uint8_t SPN2819[2];
    uint8_t SPN2820;
    uint8_t SPN2821[2];
    uint8_t SPN2822[2];
}CAN_BCP;

typedef struct CAN_CTS{
    uint8_t SPN2823[7];
}CAN_CTS;

typedef struct CAN_CML{
    uint8_t SPN2824[2];
    uint8_t SPN2825[2];
    uint8_t SPN2826[2];
    uint8_t SPN2827[2];
}CAN_CML;

typedef struct CAN_BRO{
    uint8_t SPN2829;
}CAN_BRO;

typedef struct CAN_CRO{
    uint8_t SPN2830;
}CAN_CRO;

typedef struct CAN_BCL{
    uint8_t SPN3072[2];
    uint8_t SPN3073[2];
    uint8_t SPN3074;
}CAN_BCL;

typedef struct CAN_BCS{
    uint8_t SPN3075[2];
    uint8_t SPN3076[2];
    uint8_t SPN3077[2];
    uint8_t SPN3078;
    uint8_t SPN3079[2];
}CAN_BCS;

typedef struct CAN_CCS{
    uint8_t SPN3081[2];
    uint8_t SPN3082[2];
    uint8_t SPN3083[2];
    uint8_t SPN3929;
}CAN_CCS;

typedef struct CAN_BSM{
    uint8_t SPN3085;
    uint8_t SPN3086;
    uint8_t SPN3087;
    uint8_t SPN3088;
    uint8_t SPN3089;
    uint8_t SPN3090_3093;
    uint8_t SPN3094_3096;
}CAN_BSM;

typedef struct CAN_BMV{
    uint8_t SPN3101_3356[512];
}CAN_BMV;

typedef struct CAN_BMT{
    uint8_t SPN3361_3488[128];
}CAN_BMT;

typedef struct CAN_BSP{
    uint8_t SPN3491_3506[16];
}CAN_BSP;

typedef struct CAN_BST{
    uint8_t SPN3511;
    uint8_t SPN3512[2];
    uint8_t SPN3513;
}CAN_BST;

typedef struct CAN_CST{
    uint8_t SPN3521;
    uint8_t SPN3522[2];
    uint8_t SPN3523;
}CAN_CST;

typedef struct CAN_BSD{
    uint8_t SPN3601;
    uint8_t SPN3602[2];
    uint8_t SPN3603[2];
    uint8_t SPN3604;
    uint8_t SPN3605;
}CAN_BSD;

typedef struct CAN_CSD{
    uint8_t SPN3611[2];
    uint8_t SPN3612[2];
    uint8_t SPN3613[4];
}CAN_CSD;

typedef struct CAN_BEM{
    uint8_t SPN3901_3902;
    uint8_t SPN3903_3904;
    uint8_t SPN3905_3906;
    uint8_t SPN3907;
}CAN_BEM;

typedef struct CAN_CEM{
    uint8_t SPN3921_3922;
    uint8_t SPN3923_3924;
    uint8_t SPN3925_3926;
    uint8_t SPN3927;
}CAN_CEM;

typedef struct CAN_DataTable_S{
    CAN_CHM CHM;
    CAN_BHM BHM;
    CAN_CRM CRM;
    CAN_BRM BRM;
    CAN_BCP	BCP;
    CAN_CTS CTS;
    CAN_CML CML;
    CAN_BRO BRO;
    CAN_CRO CRO;
    CAN_BCL BCL;
    CAN_BCS BCS;
    CAN_CCS CCS;
    CAN_BSM BSM;
    CAN_BMV BMV;
    CAN_BMT BMT;
    CAN_BSP BSP;
    CAN_BST BST;
    CAN_CST CST;
    CAN_BSD	BSD;
    CAN_CSD CSD;
    CAN_BEM BEM;
    CAN_CEM CEM;
    uint8_t UpdatedPGN;
}CAN_DataTable_T;

typedef struct CAN_Parse_Session_S{
    CAN_DataTable_T Table;
    bool IsInTPCM;
    uint8_t TPCM_PGN;
    uint8_t TPCM_TOTAL_PKG; /*总包数*/
    uint8_t TPCM_CURR_PKG; /*当前接收到的包*/
    uint16_t TPCM_TOTAL_BYTES; /*总字节数*/
    uint16_t TPCM_CURR_BYTES; /*当前接收到的字节数*/
    uint8_t TPCM_BUFFER[512];
}CAN_Parse_Session_T;
////////////////////////////////////////////////////////////////////////////////

#define CAN_CHM_PGN 0x26
#define CAN_BHM_PGN 0x27
#define CAN_CRM_PGN 0x01
#define CAN_BRM_PGN 0x02
#define CAN_BCP_PGN 0x06
#define CAN_CTS_PGN 0x07
#define CAN_CML_PGN 0x08
#define CAN_BRO_PGN 0x09
#define CAN_CRO_PGN 0x0A
#define CAN_BCL_PGN 0x10
#define CAN_BCS_PGN 0x11
#define CAN_CCS_PGN 0x12
#define CAN_BSM_PGN 0x13
#define CAN_BMV_PGN 0x15
#define CAN_BMT_PGN 0x16
#define CAN_BSP_PGN 0x17
#define CAN_BST_PGN 0x19
#define CAN_CST_PGN 0x1A
#define CAN_BSD_PGN 0x1C
#define CAN_CSD_PGN 0x1D
#define CAN_BEM_PGN 0x1E
#define CAN_CEM_PGN 0x1F

#define CAN_TPCM_RTS_ID 0x1CEC56F4
#define CAN_TPCM_CTS_ID	0x1CECF456
#define CAN_TPCM_DT_ID	0x1CEB56F4

/*TPCM TYPEs*/
#define CAN_TPCM_UNKNOWN 	0
#define CAN_TPCM_RTS 			1
#define CAN_TPCM_CTS 			2
#define CAN_TPCM_DT 			4
#define CAN_TPCM_EM 			8

////////////////////////////////////////////////////////////////////////////////
uint8_t CAN_GetPGN(uint32_t FrameID, uint8_t* Data, uint8_t DL);

int CAN_GetTPCMType(uint32_t FrameID, uint8_t* Data, uint8_t DL);

void CAN_Parse_Session_Init(CAN_Parse_Session_T* session);

int CAN_Parse(CAN_Parse_Session_T* session, uint32_t FrameID, uint8_t* Data, uint8_t DL);

const char* CAN_GetPGNName(uint8_t PGN);

bool CAN_IsPGN(uint32_t FrameID, uint8_t* Data, uint8_t DL, uint8_t PGN);

#endif /*INCLUDED_CAN_H*/

