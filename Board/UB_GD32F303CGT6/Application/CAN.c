#include <CAN.h>
#include <sdk_hex.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////


static int CAN_CopyTPCMToPGN(CAN_Parse_Session_T* session)
{
    int updated = 0;
    switch(session->TPCM_PGN){
        case CAN_BRM_PGN:{
            if(memcmp(&session->Table.BRM, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES)!=0){
                memcpy(&session->Table.BRM, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                session->Table.UpdatedPGN = session->TPCM_PGN;
                sdk_hex_dump("CAN_BRM", session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                updated =1 ;
            }

            break;
        }
        case CAN_BCP_PGN:{
            if(memcmp(&session->Table.BCP, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES)!=0){
                memcpy(&session->Table.BCP, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                session->Table.UpdatedPGN = session->TPCM_PGN;
                sdk_hex_dump("CAN_BCP", session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                updated = 1;
            }
            break;
        }
        case CAN_BCS_PGN:{
            if(memcmp(&session->Table.BCS, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES)!=0){
                memcpy(&session->Table.BCS, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                session->Table.UpdatedPGN = session->TPCM_PGN;
                sdk_hex_dump("CAN_BCS", session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                updated = 1;
            }
            break;
        }
        case CAN_BMV_PGN:{
            if(memcmp(&session->Table.BMV, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES)!=0){
                memcpy(&session->Table.BMV, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                session->Table.UpdatedPGN = session->TPCM_PGN;
                sdk_hex_dump("CAN_BMV", session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                updated = 1;
            }
            break;
        }
        case CAN_BMT_PGN:{
            if(memcmp(&session->Table.BMT, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES)!=0){
                memcpy(&session->Table.BMT, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                session->Table.UpdatedPGN = session->TPCM_PGN;
                sdk_hex_dump("CAN_BMT", session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                updated = 1;
            }
            break;
        }
        case CAN_BSP_PGN:{
            if(memcmp(&session->Table.BSP, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES)!=0){
                memcpy(&session->Table.BSP, session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                session->Table.UpdatedPGN = session->TPCM_PGN;
                sdk_hex_dump("CAN_BSP", session->TPCM_BUFFER, session->TPCM_TOTAL_BYTES);
                updated = 1;
            }
            break;
        }
    }
    return updated;
}

////////////////////////////////////////////////////////////////////////////////
////


uint8_t CAN_GetPGN(uint32_t FrameID, uint8_t* Data, uint8_t DL)
{
    uint8_t ID = ((FrameID>>24)&0xFF);
    if( ID == 0x1C){
        return Data[6];
    }else{
        return ((FrameID&0x00FF0000) >> 16) & 0xFF;
    }
}

int CAN_GetTPCMType(uint32_t FrameID, uint8_t* Data, uint8_t DL)
{
    switch(FrameID){
        case CAN_TPCM_RTS_ID:{
            return CAN_TPCM_RTS;
        }
        case CAN_TPCM_DT_ID:{
            return CAN_TPCM_DT;
        }
        case CAN_TPCM_CTS_ID:{
            switch(Data[0]){
                case 0x11:{
                    return CAN_TPCM_CTS;
                }
                case 0x13:{
                    return CAN_TPCM_EM;
                }
            }
            break;
        }
        default:
            break;
    }
    return CAN_TPCM_UNKNOWN;
}


int CAN_Parse(CAN_Parse_Session_T* session, uint32_t FrameID, uint8_t* Data, uint8_t DL)
{
    int TPCM_TYPE = CAN_GetTPCMType(FrameID, Data, DL);
    int updated = 0;
    switch(TPCM_TYPE){
        case CAN_TPCM_RTS:{
            session->IsInTPCM = true;
            session->TPCM_TOTAL_BYTES = SDK_HEX_GET_UINT16_LE(Data, 1);
            session->TPCM_TOTAL_PKG = Data[3];
            session->TPCM_PGN = CAN_GetPGN(FrameID, Data, DL);
            session->TPCM_CURR_BYTES = 0;
            session->TPCM_CURR_PKG = 0;
            break;
        }
        case CAN_TPCM_CTS:{
            if(session->IsInTPCM){
                uint8_t PGN = CAN_GetPGN(FrameID, Data, DL);
                uint8_t TotalPkg = Data[1];
                if(session->TPCM_TOTAL_PKG!=TotalPkg || PGN!=session->TPCM_PGN){
                    session->IsInTPCM = false;
                }
            }
            break;
        }
        case CAN_TPCM_DT:{
            if(session->IsInTPCM){
                uint8_t PkgNo = Data[0];
                if(PkgNo > session->TPCM_TOTAL_PKG || (PkgNo != (session->TPCM_CURR_PKG+1))){
                    session->IsInTPCM = false;
                }else{
                    uint8_t bytes = session->TPCM_TOTAL_BYTES-((PkgNo-1)*7);
                    bytes = bytes>7?7:bytes;
                    memcpy(session->TPCM_BUFFER+session->TPCM_CURR_BYTES, Data+1, bytes);
                    session->TPCM_CURR_BYTES+=bytes;
                }
            }
            break;
        }
        case CAN_TPCM_EM:{
            if(session->IsInTPCM){
                uint16_t DL = SDK_HEX_GET_UINT16_BE(Data, 1);
                uint8_t TotalPkg = Data[3];
                if(session->TPCM_TOTAL_BYTES!=DL || session->TPCM_TOTAL_PKG!=TotalPkg){
//                    printf("TPCM ERROR! TPCM_EM(DL=%d, TPKG=%d) VS TPCM_RTS(DL=%d, TPKG=%d)\n", DL, TotalPkg, session->TPCM_TOTAL_BYTES, session->TPCM_TOTAL_PKG);
                }else{
                    updated = CAN_CopyTPCMToPGN(session);
                }
            }
            session->IsInTPCM = false;
            break;
        }
        case CAN_TPCM_UNKNOWN:{
            /*这是普通帧*/
            uint8_t PGN= CAN_GetPGN(FrameID, Data, DL);
            switch(PGN){
                case CAN_CHM_PGN:{
                    if(session->Table.UpdatedPGN!=CAN_CHM_PGN){
                        CAN_Parse_Session_Init(session);
                    }

                    if(memcmp(&session->Table.CHM, Data, DL)!=0){
                        memcpy(&session->Table.CHM, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }
                    break;
                }
                case CAN_BHM_PGN:{
                    if(memcmp(&session->Table.BHM, Data, DL)!=0){
                        memcpy(&session->Table.BHM, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }
                    break;
                }
                case CAN_CRM_PGN:{
                    if(memcmp(&session->Table.CRM, Data, DL)!=0){
                        memcpy(&session->Table.CRM, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CTS_PGN:{
                    if(memcmp(&session->Table.CTS, Data, DL)!=0){
                        memcpy(&session->Table.CTS, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CML_PGN:{
                    if(memcmp(&session->Table.CML, Data, DL)!=0){
                        memcpy(&session->Table.CML, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_BRO_PGN:{
                    if(memcmp(&session->Table.BRO, Data, DL)!=0){
                        memcpy(&session->Table.BRO, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CRO_PGN:{
                    if(memcmp(&session->Table.CRO, Data, DL)!=0){
                        memcpy(&session->Table.CRO, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_BCL_PGN:{
                    if(memcmp(&session->Table.BCL, Data, DL)!=0){
                        memcpy(&session->Table.BCL, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CCS_PGN:{
                    if(memcmp(&session->Table.CCS, Data, DL)!=0){
                        memcpy(&session->Table.CCS, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_BSM_PGN:{
                    if(memcmp(&session->Table.BSM, Data, DL)!=0){
                        memcpy(&session->Table.BSM, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_BST_PGN:{
                    if(memcmp(&session->Table.BST, Data, DL)!=0){
                        memcpy(&session->Table.BST, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CST_PGN:{
                    if(memcmp(&session->Table.CST, Data, DL)!=0){
                        memcpy(&session->Table.CST, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_BSD_PGN:{
                    if(memcmp(&session->Table.BSD, Data, DL)!=0){
                        memcpy(&session->Table.BSD, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CSD_PGN:{
                    if(memcmp(&session->Table.CSD, Data, DL)!=0){
                        memcpy(&session->Table.CSD, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_BEM_PGN:{
                    if(memcmp(&session->Table.BEM, Data, DL)!=0){
                        memcpy(&session->Table.BEM, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                case CAN_CEM_PGN:{
                    if(memcmp(&session->Table.CEM, Data, DL)!=0){
                        memcpy(&session->Table.CEM, Data, DL);
                        session->Table.UpdatedPGN = PGN;
                        updated = 1;
                    }

                    break;
                }
                default:{
                    updated = 0;
                    break;
                }
            }

            break;
        }
    }
    return updated;
}

void CAN_Parse_Session_Init(CAN_Parse_Session_T* session)
{
    memset(session, 0, sizeof(*session));
    session->IsInTPCM=false;
    session->TPCM_CURR_BYTES=0;
    session->TPCM_CURR_PKG=0;
    session->TPCM_PGN=0;
    session->TPCM_TOTAL_BYTES=0;
    session->TPCM_TOTAL_PKG=0;
    session->Table.UpdatedPGN=0;
}

const char* CAN_GetPGNName(uint8_t PGN)
{
    switch(PGN){
        case CAN_CHM_PGN:{
            return "CHM";
        }
        case CAN_BHM_PGN:{
            return "BHM";
        }
        case CAN_CRM_PGN:{
            return "CRM";
        }
        case CAN_BRM_PGN:{
            return "BRM";
        }
        case CAN_BCP_PGN:{
            return "BCP";
        }
        case CAN_CTS_PGN:{
            return "CTS";
        }
        case CAN_CML_PGN:{
            return "CML";
        }
        case CAN_BRO_PGN:{
            return "BRO";
        }
        case CAN_CRO_PGN:{
            return "CRO";
        }
        case CAN_BCL_PGN:{
            return "BCL";
        }
        case CAN_BCS_PGN:{
            return "BCS";
        }
        case CAN_CCS_PGN:{
            return "CCS";
        }
        case CAN_BSM_PGN:{
            return "BSM";
        }
        case CAN_BMV_PGN:{
            return "BMV";
        }
        case CAN_BMT_PGN:{
            return "BMT";
        }
        case CAN_BSP_PGN:{
            return "BSP";
        }
        case CAN_BST_PGN:{
            return "BST";
        }
        case CAN_CST_PGN:{
            return "CST";
        }
        case CAN_BSD_PGN:{
            return "BSD";
        }
        case CAN_CSD_PGN:{
            return "CSD";
        }
        case CAN_BEM_PGN:{
            return "BEM";
        }
        case CAN_CEM_PGN:{
            return "CEM";
        }
        default:
            return "U/N";
    }
}

bool CAN_IsPGN(uint32_t FrameID, uint8_t* Data, uint8_t DL, uint8_t PGN){
    uint8_t PGN_ = CAN_GetPGN(FrameID, Data, DL);
    return (PGN_==PGN)?true:false;
}

