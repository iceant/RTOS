#ifndef INCLUDED_CPU_MPU_H
#define INCLUDED_CPU_MPU_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_REGISTERS_H
#include <cpu_registers.h>
#endif /*INCLUDED_CPU_REGISTERS_H*/


////////////////////////////////////////////////////////////////////////////////
////

typedef struct cpu_mpu_s{
    cpu_uint_t TYPE;
    cpu_uint_t CTRL;
    cpu_uint_t RNR;
    cpu_uint_t RBAR;
    cpu_uint_t RASR;
    cpu_uint_t RBAR_A1;
    cpu_uint_t RASR_A1;
    cpu_uint_t RBAR_A2;
    cpu_uint_t RASR_A2;
    cpu_uint_t RBAR_A3;
    cpu_uint_t RASR_A3;
}cpu_mpu_t;

////////////////////////////////////////////////////////////////////////////////
////

#define CPU_MPU_BASE (SCB_BASE + 0x90UL)
#define CPU_MPU ((cpu_mpu_t*)(CPU_MPU_BASE))

#define CPU_MPU_RASR_SIZE_Pos                   1                                             /*!< MPU RASR: Region Size Field Position */
#define CPU_MPU_RASR_SIZE_Msk                  (0x1FUL << CPU_MPU_RASR_SIZE_Pos)                  /*!< MPU RASR: Region Size Field Mask */

#define CPU_MPU_CTRL_ENABLE_Pos                 0                                             /*!< MPU CTRL: ENABLE Position */
#define CPU_MPU_CTRL_ENABLE_Msk                (1UL << CPU_MPU_CTRL_ENABLE_Pos)                   /*!< MPU CTRL: ENABLE Mask */

#define CPU_MPU_RASR_AP_Pos                    24                                             /*!< MPU RASR: ATTRS.AP Position */
#define CPU_MPU_RASR_AP_Msk                    (0x7UL << CPU_MPU_RASR_AP_Pos)                     /*!< MPU RASR: ATTRS.AP Mask */

#define CPU_MPU_RASR_C_Pos                     17                                             /*!< MPU RASR: ATTRS.C Position */
#define CPU_MPU_RASR_C_Msk                     (1UL << CPU_MPU_RASR_C_Pos)                        /*!< MPU RASR: ATTRS.C Mask */

#define CPU_MPU_RASR_B_Pos                     16                                             /*!< MPU RASR: ATTRS.B Position */
#define CPU_MPU_RASR_B_Msk                     (1UL << CPU_MPU_RASR_B_Pos)                        /*!< MPU RASR: ATTRS.B Mask */

#define CPU_MPU_RASR_S_Pos                     18                                             /*!< MPU RASR: ATTRS.S Position */
#define CPU_MPU_RASR_S_Msk                     (1UL << CPU_MPU_RASR_S_Pos)                        /*!< MPU RASR: ATTRS.S Mask */

////////////////////////////////////////////////////////////////////////////////
////
#define CPU_MPU_DEFS_RASR_SIZE_32B (0x04 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_64B (0x05 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_128B (0x06 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_256B (0x07 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_512B (0x08 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_1KB (0x09 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_2KB (0x0A << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_4KB (0x0B << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_8KB (0x0C << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_16KB (0x0D << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_32KB (0x0E << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_64KB (0x0F << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_128KB (0x10 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_256KB (0x11 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_512KB (0x12 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_1MB (0x13 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_2MB (0x14 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_4MB (0x15 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_8MB (0x16 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_16MB (0x17 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_32MB (0x18 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_64MB (0x19 << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_128MB (0x1A << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_256MB (0x1B << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_512MB (0x1C << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_1GB (0x1D << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_2GB (0x1E << CPU_MPU_RASR_SIZE_Pos)
#define CPU_MPU_DEFS_RASR_SIZE_4GB (0x1F << CPU_MPU_RASR_SIZE_Pos)

#define CPU_MPU_DEFS_RASE_AP_NO_ACCESS (0x00 << CPU_MPU_RASR_AP_Pos)
#define CPU_MPU_DEFS_RASE_AP_PRIV_RW (0x01 << CPU_MPU_RASR_AP_Pos)
#define CPU_MPU_DEFS_RASE_AP_PRIV_RW_USER_RO (0x02 << CPU_MPU_RASR_AP_Pos)
#define CPU_MPU_DEFS_RASE_AP_FULL_ACCESS (0x03 << CPU_MPU_RASR_AP_Pos)
#define CPU_MPU_DEFS_RASE_AP_PRIV_RO (0x05 << CPU_MPU_RASR_AP_Pos)
#define CPU_MPU_DEFS_RASE_AP_RO (0x06 << CPU_MPU_RASR_AP_Pos)

#define CPU_MPU_DEFS_NORMAL_MEMORY_WT (CPU_MPU_RASR_C_Msk)
#define CPU_MPU_DEFS_NORMAL_MEMORY_WB (CPU_MPU_RASR_C_Msk | CPU_MPU_RASR_B_Msk)

#define CPU_MPU_DEFS_NORMAL_SHARED_MEMORY_WT (CPU_MPU_RASR_C_Msk | CPU_MPU_RASR_S_Msk)
#define CPU_MPU_DEFS_NORMAL_SHARED_MEMORY_WB (CPU_MPU_DEFS_NORMAL_MEMORY_WB | CPU_MPU_RASR_S_Msk)

#define CPU_MPU_DEFS_SHARED_DEVICE (CPU_MPU_RASR_B_Msk)
#define CPU_MPU_DEFS_STRONGLY_ORDERED_DEVICE (0x0)
////////////////////////////////////////////////////////////////////////////////
////

void cpu_mpu_init(void);

#endif /* INCLUDED_CPU_MPU_H */
