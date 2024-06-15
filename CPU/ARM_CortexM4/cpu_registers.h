#ifndef INCLUDED_CPU_REGISTERS_H
#define INCLUDED_CPU_REGISTERS_H

////////////////////////////////////////////////////////////////////////////////
////

# define CPU_REG(ADDRESS) (*((volatile unsigned long *)(ADDRESS)))

////////////////////////////////////////////////////////////////////////////////
////

/* SCB CPUID Register Definitions */
#ifndef SCB_CPUID_IMPLEMENTER_Pos
#define SCB_CPUID_IMPLEMENTER_Pos          24                                             /*!< SCB CPUID: IMPLEMENTER Position */
#endif

#ifndef SCB_CPUID_IMPLEMENTER_Msk
#define SCB_CPUID_IMPLEMENTER_Msk          (0xFFUL << SCB_CPUID_IMPLEMENTER_Pos)          /*!< SCB CPUID: IMPLEMENTER Mask */
#endif

#ifndef SCB_CPUID_VARIANT_Pos
#define SCB_CPUID_VARIANT_Pos              20                                             /*!< SCB CPUID: VARIANT Position */
#endif

#ifndef SCB_CPUID_VARIANT_Msk
#define SCB_CPUID_VARIANT_Msk              (0xFUL << SCB_CPUID_VARIANT_Pos)               /*!< SCB CPUID: VARIANT Mask */
#endif

#ifndef SCB_CPUID_ARCHITECTURE_Pos
#define SCB_CPUID_ARCHITECTURE_Pos         16                                             /*!< SCB CPUID: ARCHITECTURE Position */
#endif

#ifndef SCB_CPUID_ARCHITECTURE_Msk
#define SCB_CPUID_ARCHITECTURE_Msk         (0xFUL << SCB_CPUID_ARCHITECTURE_Pos)          /*!< SCB CPUID: ARCHITECTURE Mask */
#endif

#ifndef SCB_CPUID_PARTNO_Pos
#define SCB_CPUID_PARTNO_Pos                4                                             /*!< SCB CPUID: PARTNO Position */
#endif

#ifndef SCB_CPUID_PARTNO_Msk
#define SCB_CPUID_PARTNO_Msk               (0xFFFUL << SCB_CPUID_PARTNO_Pos)              /*!< SCB CPUID: PARTNO Mask */
#endif

#ifndef SCB_CPUID_REVISION_Pos
#define SCB_CPUID_REVISION_Pos              0                                             /*!< SCB CPUID: REVISION Position */
#endif

#ifndef SCB_CPUID_REVISION_Msk
#define SCB_CPUID_REVISION_Msk             (0xFUL << SCB_CPUID_REVISION_Pos)              /*!< SCB CPUID: REVISION Mask */
#endif

/* SCB Interrupt Control State Register Definitions */
#ifndef SCB_ICSR_NMIPENDSET_Pos
#define SCB_ICSR_NMIPENDSET_Pos            31                                             /*!< SCB ICSR: NMIPENDSET Position */
#endif

#ifndef SCB_ICSR_NMIPENDSET_Msk
#define SCB_ICSR_NMIPENDSET_Msk            (1UL << SCB_ICSR_NMIPENDSET_Pos)               /*!< SCB ICSR: NMIPENDSET Mask */
#endif

#ifndef SCB_ICSR_PENDSVSET_Pos
#define SCB_ICSR_PENDSVSET_Pos             28                                             /*!< SCB ICSR: PENDSVSET Position */
#endif

#ifndef SCB_ICSR_PENDSVSET_Msk
#define SCB_ICSR_PENDSVSET_Msk             (1UL << SCB_ICSR_PENDSVSET_Pos)                /*!< SCB ICSR: PENDSVSET Mask */
#endif

#ifndef SCB_ICSR_PENDSVCLR_Pos
#define SCB_ICSR_PENDSVCLR_Pos             27                                             /*!< SCB ICSR: PENDSVCLR Position */
#endif

#ifndef SCB_ICSR_PENDSVCLR_Msk
#define SCB_ICSR_PENDSVCLR_Msk             (1UL << SCB_ICSR_PENDSVCLR_Pos)                /*!< SCB ICSR: PENDSVCLR Mask */
#endif

#ifndef SCB_ICSR_PENDSTSET_Pos
#define SCB_ICSR_PENDSTSET_Pos             26                                             /*!< SCB ICSR: PENDSTSET Position */
#endif

#ifndef SCB_ICSR_PENDSTSET_Msk
#define SCB_ICSR_PENDSTSET_Msk             (1UL << SCB_ICSR_PENDSTSET_Pos)                /*!< SCB ICSR: PENDSTSET Mask */
#endif

#ifndef SCB_ICSR_PENDSTCLR_Pos
#define SCB_ICSR_PENDSTCLR_Pos             25                                             /*!< SCB ICSR: PENDSTCLR Position */
#endif

#ifndef SCB_ICSR_PENDSTCLR_Msk
#define SCB_ICSR_PENDSTCLR_Msk             (1UL << SCB_ICSR_PENDSTCLR_Pos)                /*!< SCB ICSR: PENDSTCLR Mask */
#endif

#ifndef SCB_ICSR_ISRPREEMPT_Pos
#define SCB_ICSR_ISRPREEMPT_Pos            23                                             /*!< SCB ICSR: ISRPREEMPT Position */
#endif

#ifndef SCB_ICSR_ISRPREEMPT_Msk
#define SCB_ICSR_ISRPREEMPT_Msk            (1UL << SCB_ICSR_ISRPREEMPT_Pos)               /*!< SCB ICSR: ISRPREEMPT Mask */
#endif

#ifndef SCB_ICSR_ISRPREEMPT_Msk
#define SCB_ICSR_ISRPREEMPT_Msk            22                                             /*!< SCB ICSR: ISRPENDING Position */
#endif

#ifndef SCB_ICSR_ISRPENDING_Msk
#define SCB_ICSR_ISRPENDING_Msk            (1UL << SCB_ICSR_ISRPENDING_Pos)               /*!< SCB ICSR: ISRPENDING Mask */
#endif

#ifndef SCB_ICSR_VECTPENDING_Pos
#define SCB_ICSR_VECTPENDING_Pos           12                                             /*!< SCB ICSR: VECTPENDING Position */
#endif

#ifndef SCB_ICSR_VECTPENDING_Msk
#define SCB_ICSR_VECTPENDING_Msk           (0x1FFUL << SCB_ICSR_VECTPENDING_Pos)          /*!< SCB ICSR: VECTPENDING Mask */
#endif

#ifndef SCB_ICSR_RETTOBASE_Pos
#define SCB_ICSR_RETTOBASE_Pos             11                                             /*!< SCB ICSR: RETTOBASE Position */
#endif

#ifndef SCB_ICSR_RETTOBASE_Msk
#define SCB_ICSR_RETTOBASE_Msk             (1UL << SCB_ICSR_RETTOBASE_Pos)                /*!< SCB ICSR: RETTOBASE Mask */
#endif

#ifndef SCB_ICSR_VECTACTIVE_Pos
#define SCB_ICSR_VECTACTIVE_Pos             0                                             /*!< SCB ICSR: VECTACTIVE Position */
#endif

#ifndef SCB_ICSR_VECTACTIVE_Msk
#define SCB_ICSR_VECTACTIVE_Msk            (0x1FFUL << SCB_ICSR_VECTACTIVE_Pos)           /*!< SCB ICSR: VECTACTIVE Mask */
#endif

/* SCB Vector Table Offset Register Definitions */
#ifndef SCB_VTOR_TBLOFF_Pos
#define SCB_VTOR_TBLOFF_Pos                 7                                             /*!< SCB VTOR: TBLOFF Position */
#endif

#ifndef SCB_VTOR_TBLOFF_Msk
#define SCB_VTOR_TBLOFF_Msk                (0x1FFFFFFUL << SCB_VTOR_TBLOFF_Pos)           /*!< SCB VTOR: TBLOFF Mask */
#endif

/* SCB Application Interrupt and Reset Control Register Definitions */
#ifndef SCB_AIRCR_VECTKEY_Pos
#define SCB_AIRCR_VECTKEY_Pos              16                                             /*!< SCB AIRCR: VECTKEY Position */
#endif

#ifndef SCB_AIRCR_VECTKEY_Msk
#define SCB_AIRCR_VECTKEY_Msk              (0xFFFFUL << SCB_AIRCR_VECTKEY_Pos)            /*!< SCB AIRCR: VECTKEY Mask */
#endif

#ifndef SCB_AIRCR_VECTKEYSTAT_Pos
#define SCB_AIRCR_VECTKEYSTAT_Pos          16                                             /*!< SCB AIRCR: VECTKEYSTAT Position */
#endif

#ifndef SCB_AIRCR_VECTKEYSTAT_Msk
#define SCB_AIRCR_VECTKEYSTAT_Msk          (0xFFFFUL << SCB_AIRCR_VECTKEYSTAT_Pos)        /*!< SCB AIRCR: VECTKEYSTAT Mask */
#endif

#ifndef SCB_AIRCR_ENDIANESS_Pos
#define SCB_AIRCR_ENDIANESS_Pos            15                                             /*!< SCB AIRCR: ENDIANESS Position */
#endif

#ifndef SCB_AIRCR_ENDIANESS_Msk
#define SCB_AIRCR_ENDIANESS_Msk            (1UL << SCB_AIRCR_ENDIANESS_Pos)               /*!< SCB AIRCR: ENDIANESS Mask */
#endif

#ifndef SCB_AIRCR_PRIGROUP_Pos
#define SCB_AIRCR_PRIGROUP_Pos              8                                             /*!< SCB AIRCR: PRIGROUP Position */
#endif

#ifndef SCB_AIRCR_PRIGROUP_Msk
#define SCB_AIRCR_PRIGROUP_Msk             (7UL << SCB_AIRCR_PRIGROUP_Pos)                /*!< SCB AIRCR: PRIGROUP Mask */
#endif

#ifndef SCB_AIRCR_SYSRESETREQ_Pos
#define SCB_AIRCR_SYSRESETREQ_Pos           2                                             /*!< SCB AIRCR: SYSRESETREQ Position */
#endif

#ifndef SCB_AIRCR_SYSRESETREQ_Msk
#define SCB_AIRCR_SYSRESETREQ_Msk          (1UL << SCB_AIRCR_SYSRESETREQ_Pos)             /*!< SCB AIRCR: SYSRESETREQ Mask */
#endif

#ifndef SCB_AIRCR_VECTCLRACTIVE_Pos
#define SCB_AIRCR_VECTCLRACTIVE_Pos         1                                             /*!< SCB AIRCR: VECTCLRACTIVE Position */
#endif

#ifndef SCB_AIRCR_VECTCLRACTIVE_Msk
#define SCB_AIRCR_VECTCLRACTIVE_Msk        (1UL << SCB_AIRCR_VECTCLRACTIVE_Pos)           /*!< SCB AIRCR: VECTCLRACTIVE Mask */
#endif

#ifndef SCB_AIRCR_VECTRESET_Pos
#define SCB_AIRCR_VECTRESET_Pos              0                                             /*!< SCB AIRCR: VECTRESET Position */
#endif /*SCB_AIRCR_VECTRESET_Pos*/

#ifndef SCB_AIRCR_VECTRESET_Msk
#define SCB_AIRCR_VECTRESET_Msk             (1UL << SCB_AIRCR_VECTRESET_Pos)               /*!< SCB AIRCR: VECTRESET Mask */
#endif /*SCB_AIRCR_VECTRESET_Msk*/

/* SCB System Control Register Definitions */
#ifndef SCB_SCR_SEVONPEND_Pos
#define SCB_SCR_SEVONPEND_Pos                4                                             /*!< SCB SCR: SEVONPEND Position */
#endif /*SCB_SCR_SEVONPEND_Pos*/

#ifndef SCB_SCR_SEVONPEND_Msk
#define SCB_SCR_SEVONPEND_Msk               (1UL << SCB_SCR_SEVONPEND_Pos)                 /*!< SCB SCR: SEVONPEND Mask */
#endif /*SCB_SCR_SEVONPEND_Msk*/


#ifndef SCB_SCR_SLEEPDEEP_Pos
#define SCB_SCR_SLEEPDEEP_Pos                2                                             /*!< SCB SCR: SLEEPDEEP Position */
#endif /*SCB_SCR_SLEEPDEEP_Pos*/

#ifndef SCB_SCR_SLEEPDEEP_Msk
#define SCB_SCR_SLEEPDEEP_Msk               (1UL << SCB_SCR_SLEEPDEEP_Pos)                 /*!< SCB SCR: SLEEPDEEP Mask */
#endif /*SCB_SCR_SLEEPDEEP_Msk*/


#ifndef SCB_SCR_SLEEPONEXIT_Pos
#define SCB_SCR_SLEEPONEXIT_Pos              1                                             /*!< SCB SCR: SLEEPONEXIT Position */
#endif /*SCB_SCR_SLEEPONEXIT_Pos*/

#ifndef SCB_SCR_SLEEPONEXIT_Msk
#define SCB_SCR_SLEEPONEXIT_Msk             (1UL << SCB_SCR_SLEEPONEXIT_Pos)               /*!< SCB SCR: SLEEPONEXIT Mask */
#endif /*SCB_SCR_SLEEPONEXIT_Msk*/


/* SCB Configuration Control Register Definitions */
#ifndef SCB_CCR_STKALIGN_Pos
#define SCB_CCR_STKALIGN_Pos                 9                                             /*!< SCB CCR: STKALIGN Position */
#endif /*SCB_CCR_STKALIGN_Pos*/

#ifndef SCB_CCR_STKALIGN_Msk
#define SCB_CCR_STKALIGN_Msk                (1UL << SCB_CCR_STKALIGN_Pos)                  /*!< SCB CCR: STKALIGN Mask */
#endif /*SCB_CCR_STKALIGN_Msk*/


#ifndef SCB_CCR_BFHFNMIGN_Pos
#define SCB_CCR_BFHFNMIGN_Pos                8                                             /*!< SCB CCR: BFHFNMIGN Position */
#endif /*SCB_CCR_BFHFNMIGN_Pos*/

#ifndef SCB_CCR_BFHFNMIGN_Msk
#define SCB_CCR_BFHFNMIGN_Msk               (1UL << SCB_CCR_BFHFNMIGN_Pos)                 /*!< SCB CCR: BFHFNMIGN Mask */
#endif /*SCB_CCR_BFHFNMIGN_Msk*/


#ifndef SCB_CCR_DIV_0_TRP_Pos
#define SCB_CCR_DIV_0_TRP_Pos                4                                             /*!< SCB CCR: DIV_0_TRP Position */
#endif /*SCB_CCR_DIV_0_TRP_Pos*/

#ifndef SCB_CCR_DIV_0_TRP_Msk
#define SCB_CCR_DIV_0_TRP_Msk               (1UL << SCB_CCR_DIV_0_TRP_Pos)                 /*!< SCB CCR: DIV_0_TRP Mask */
#endif /*SCB_CCR_DIV_0_TRP_Msk*/


#ifndef SCB_CCR_UNALIGN_TRP_Pos
#define SCB_CCR_UNALIGN_TRP_Pos              3                                             /*!< SCB CCR: UNALIGN_TRP Position */
#endif /*SCB_CCR_UNALIGN_TRP_Pos*/

#ifndef SCB_CCR_UNALIGN_TRP_Msk
#define SCB_CCR_UNALIGN_TRP_Msk             (1UL << SCB_CCR_UNALIGN_TRP_Pos)               /*!< SCB CCR: UNALIGN_TRP Mask */
#endif /*SCB_CCR_UNALIGN_TRP_Msk*/


#ifndef SCB_CCR_USERSETMPEND_Pos
#define SCB_CCR_USERSETMPEND_Pos             1                                             /*!< SCB CCR: USERSETMPEND Position */
#endif /*SCB_CCR_USERSETMPEND_Pos*/

#ifndef SCB_CCR_USERSETMPEND_Msk
#define SCB_CCR_USERSETMPEND_Msk            (1UL << SCB_CCR_USERSETMPEND_Pos)              /*!< SCB CCR: USERSETMPEND Mask */
#endif /*SCB_CCR_USERSETMPEND_Msk*/


#ifndef SCB_CCR_NONBASETHRDENA_Pos
#define SCB_CCR_NONBASETHRDENA_Pos           0                                             /*!< SCB CCR: NONBASETHRDENA Position */
#endif /*SCB_CCR_NONBASETHRDENA_Pos*/

#ifndef SCB_CCR_NONBASETHRDENA_Msk
#define SCB_CCR_NONBASETHRDENA_Msk          (1UL << SCB_CCR_NONBASETHRDENA_Pos)            /*!< SCB CCR: NONBASETHRDENA Mask */
#endif /*SCB_CCR_NONBASETHRDENA_Msk*/


/* SCB System Handler Control and State Register Definitions */
#ifndef SCB_SHCSR_USGFAULTENA_Pos
#define SCB_SHCSR_USGFAULTENA_Pos           18                                             /*!< SCB SHCSR: USGFAULTENA Position */
#endif /*SCB_SHCSR_USGFAULTENA_Pos*/

#ifndef SCB_SHCSR_USGFAULTENA_Msk
#define SCB_SHCSR_USGFAULTENA_Msk           (1UL << SCB_SHCSR_USGFAULTENA_Pos)             /*!< SCB SHCSR: USGFAULTENA Mask */
#endif /*SCB_SHCSR_USGFAULTENA_Msk*/


#ifndef SCB_SHCSR_BUSFAULTENA_Pos
#define SCB_SHCSR_BUSFAULTENA_Pos           17                                             /*!< SCB SHCSR: BUSFAULTENA Position */
#endif /*SCB_SHCSR_BUSFAULTENA_Pos*/

#ifndef SCB_SHCSR_BUSFAULTENA_Msk
#define SCB_SHCSR_BUSFAULTENA_Msk           (1UL << SCB_SHCSR_BUSFAULTENA_Pos)             /*!< SCB SHCSR: BUSFAULTENA Mask */
#endif /*SCB_SHCSR_BUSFAULTENA_Msk*/


#ifndef SCB_SHCSR_MEMFAULTENA_Pos
#define SCB_SHCSR_MEMFAULTENA_Pos           16                                             /*!< SCB SHCSR: MEMFAULTENA Position */
#endif /*SCB_SHCSR_MEMFAULTENA_Pos*/

#ifndef SCB_SHCSR_MEMFAULTENA_Msk
#define SCB_SHCSR_MEMFAULTENA_Msk           (1UL << SCB_SHCSR_MEMFAULTENA_Pos)             /*!< SCB SHCSR: MEMFAULTENA Mask */
#endif /*SCB_SHCSR_MEMFAULTENA_Msk*/


#ifndef SCB_SHCSR_SVCALLPENDED_Pos
#define SCB_SHCSR_SVCALLPENDED_Pos          15                                             /*!< SCB SHCSR: SVCALLPENDED Position */
#endif /*SCB_SHCSR_SVCALLPENDED_Pos*/

#ifndef SCB_SHCSR_SVCALLPENDED_Msk
#define SCB_SHCSR_SVCALLPENDED_Msk          (1UL << SCB_SHCSR_SVCALLPENDED_Pos)            /*!< SCB SHCSR: SVCALLPENDED Mask */
#endif /*SCB_SHCSR_SVCALLPENDED_Msk*/


#ifndef SCB_SHCSR_BUSFAULTPENDED_Pos
#define SCB_SHCSR_BUSFAULTPENDED_Pos        14                                             /*!< SCB SHCSR: BUSFAULTPENDED Position */
#endif /*SCB_SHCSR_BUSFAULTPENDED_Pos*/

#ifndef SCB_SHCSR_BUSFAULTPENDED_Msk
#define SCB_SHCSR_BUSFAULTPENDED_Msk        (1UL << SCB_SHCSR_BUSFAULTPENDED_Pos)          /*!< SCB SHCSR: BUSFAULTPENDED Mask */
#endif /*SCB_SHCSR_BUSFAULTPENDED_Msk*/


#ifndef SCB_SHCSR_MEMFAULTPENDED_Pos
#define SCB_SHCSR_MEMFAULTPENDED_Pos        13                                             /*!< SCB SHCSR: MEMFAULTPENDED Position */
#endif /*SCB_SHCSR_MEMFAULTPENDED_Pos*/

#ifndef SCB_SHCSR_MEMFAULTPENDED_Msk
#define SCB_SHCSR_MEMFAULTPENDED_Msk        (1UL << SCB_SHCSR_MEMFAULTPENDED_Pos)          /*!< SCB SHCSR: MEMFAULTPENDED Mask */
#endif /*SCB_SHCSR_MEMFAULTPENDED_Msk*/


#ifndef SCB_SHCSR_USGFAULTPENDED_Pos
#define SCB_SHCSR_USGFAULTPENDED_Pos        12                                             /*!< SCB SHCSR: USGFAULTPENDED Position */
#endif /*SCB_SHCSR_USGFAULTPENDED_Pos*/

#ifndef SCB_SHCSR_USGFAULTPENDED_Msk
#define SCB_SHCSR_USGFAULTPENDED_Msk        (1UL << SCB_SHCSR_USGFAULTPENDED_Pos)          /*!< SCB SHCSR: USGFAULTPENDED Mask */
#endif /*SCB_SHCSR_USGFAULTPENDED_Msk*/


#ifndef SCB_SHCSR_SYSTICKACT_Pos
#define SCB_SHCSR_SYSTICKACT_Pos            11                                             /*!< SCB SHCSR: SYSTICKACT Position */
#endif /*SCB_SHCSR_SYSTICKACT_Pos*/

#ifndef SCB_SHCSR_SYSTICKACT_Msk
#define SCB_SHCSR_SYSTICKACT_Msk            (1UL << SCB_SHCSR_SYSTICKACT_Pos)              /*!< SCB SHCSR: SYSTICKACT Mask */
#endif /*SCB_SHCSR_SYSTICKACT_Msk*/


#ifndef SCB_SHCSR_PENDSVACT_Pos
#define SCB_SHCSR_PENDSVACT_Pos             10                                             /*!< SCB SHCSR: PENDSVACT Position */
#endif /*SCB_SHCSR_PENDSVACT_Pos*/

#ifndef SCB_SHCSR_PENDSVACT_Msk
#define SCB_SHCSR_PENDSVACT_Msk             (1UL << SCB_SHCSR_PENDSVACT_Pos)               /*!< SCB SHCSR: PENDSVACT Mask */
#endif /*SCB_SHCSR_PENDSVACT_Msk*/


#ifndef SCB_SHCSR_MONITORACT_Pos
#define SCB_SHCSR_MONITORACT_Pos             8                                             /*!< SCB SHCSR: MONITORACT Position */
#endif /*SCB_SHCSR_MONITORACT_Pos*/

#ifndef SCB_SHCSR_MONITORACT_Msk
#define SCB_SHCSR_MONITORACT_Msk            (1UL << SCB_SHCSR_MONITORACT_Pos)              /*!< SCB SHCSR: MONITORACT Mask */
#endif /*SCB_SHCSR_MONITORACT_Msk*/


#ifndef SCB_SHCSR_SVCALLACT_Pos
#define SCB_SHCSR_SVCALLACT_Pos              7                                             /*!< SCB SHCSR: SVCALLACT Position */
#endif /*SCB_SHCSR_SVCALLACT_Pos*/

#ifndef SCB_SHCSR_SVCALLACT_Msk
#define SCB_SHCSR_SVCALLACT_Msk             (1UL << SCB_SHCSR_SVCALLACT_Pos)               /*!< SCB SHCSR: SVCALLACT Mask */
#endif /*SCB_SHCSR_SVCALLACT_Msk*/


#ifndef SCB_SHCSR_USGFAULTACT_Pos
#define SCB_SHCSR_USGFAULTACT_Pos            3                                             /*!< SCB SHCSR: USGFAULTACT Position */
#endif /*SCB_SHCSR_USGFAULTACT_Pos*/

#ifndef SCB_SHCSR_USGFAULTACT_Msk
#define SCB_SHCSR_USGFAULTACT_Msk           (1UL << SCB_SHCSR_USGFAULTACT_Pos)             /*!< SCB SHCSR: USGFAULTACT Mask */
#endif /*SCB_SHCSR_USGFAULTACT_Msk*/


#ifndef SCB_SHCSR_BUSFAULTACT_Pos
#define SCB_SHCSR_BUSFAULTACT_Pos            1                                             /*!< SCB SHCSR: BUSFAULTACT Position */
#endif /*SCB_SHCSR_BUSFAULTACT_Pos*/

#ifndef SCB_SHCSR_BUSFAULTACT_Msk
#define SCB_SHCSR_BUSFAULTACT_Msk           (1UL << SCB_SHCSR_BUSFAULTACT_Pos)             /*!< SCB SHCSR: BUSFAULTACT Mask */
#endif /*SCB_SHCSR_BUSFAULTACT_Msk*/


#ifndef SCB_SHCSR_MEMFAULTACT_Pos
#define SCB_SHCSR_MEMFAULTACT_Pos            0                                             /*!< SCB SHCSR: MEMFAULTACT Position */
#endif /*SCB_SHCSR_MEMFAULTACT_Pos*/

#ifndef SCB_SHCSR_MEMFAULTACT_Msk
#define SCB_SHCSR_MEMFAULTACT_Msk           (1UL << SCB_SHCSR_MEMFAULTACT_Pos)             /*!< SCB SHCSR: MEMFAULTACT Mask */
#endif /*SCB_SHCSR_MEMFAULTACT_Msk*/


/* SCB Configurable Fault Status Registers Definitions */
#ifndef SCB_CFSR_USGFAULTSR_Pos
#define SCB_CFSR_USGFAULTSR_Pos             16                                             /*!< SCB CFSR: Usage Fault Status Register Position */
#endif /*SCB_CFSR_USGFAULTSR_Pos*/

#ifndef SCB_CFSR_USGFAULTSR_Msk
#define SCB_CFSR_USGFAULTSR_Msk             (0xFFFFUL << SCB_CFSR_USGFAULTSR_Pos)          /*!< SCB CFSR: Usage Fault Status Register Mask */
#endif /*SCB_CFSR_USGFAULTSR_Msk*/


#ifndef SCB_CFSR_BUSFAULTSR_Pos
#define SCB_CFSR_BUSFAULTSR_Pos              8                                             /*!< SCB CFSR: Bus Fault Status Register Position */
#endif /*SCB_CFSR_BUSFAULTSR_Pos*/

#ifndef SCB_CFSR_BUSFAULTSR_Msk
#define SCB_CFSR_BUSFAULTSR_Msk             (0xFFUL << SCB_CFSR_BUSFAULTSR_Pos)            /*!< SCB CFSR: Bus Fault Status Register Mask */
#endif /*SCB_CFSR_BUSFAULTSR_Msk*/


#ifndef SCB_CFSR_MEMFAULTSR_Pos
#define SCB_CFSR_MEMFAULTSR_Pos              0                                             /*!< SCB CFSR: Memory Manage Fault Status Register Position */
#endif /*SCB_CFSR_MEMFAULTSR_Pos*/

#ifndef SCB_CFSR_MEMFAULTSR_Msk
#define SCB_CFSR_MEMFAULTSR_Msk             (0xFFUL << SCB_CFSR_MEMFAULTSR_Pos)            /*!< SCB CFSR: Memory Manage Fault Status Register Mask */
#endif /*SCB_CFSR_MEMFAULTSR_Msk*/


/* SCB Hard Fault Status Registers Definitions */
#ifndef SCB_HFSR_DEBUGEVT_Pos
#define SCB_HFSR_DEBUGEVT_Pos               31                                             /*!< SCB HFSR: DEBUGEVT Position */
#endif /*SCB_HFSR_DEBUGEVT_Pos*/

#ifndef SCB_HFSR_DEBUGEVT_Msk
#define SCB_HFSR_DEBUGEVT_Msk               (1UL << SCB_HFSR_DEBUGEVT_Pos)                 /*!< SCB HFSR: DEBUGEVT Mask */
#endif /*SCB_HFSR_DEBUGEVT_Msk*/


#ifndef SCB_HFSR_FORCED_Pos
#define SCB_HFSR_FORCED_Pos                 30                                             /*!< SCB HFSR: FORCED Position */
#endif /*SCB_HFSR_FORCED_Pos*/

#ifndef SCB_HFSR_FORCED_Msk
#define SCB_HFSR_FORCED_Msk                 (1UL << SCB_HFSR_FORCED_Pos)                   /*!< SCB HFSR: FORCED Mask */
#endif /*SCB_HFSR_FORCED_Msk*/


#ifndef SCB_HFSR_VECTTBL_Pos
#define SCB_HFSR_VECTTBL_Pos                 1                                             /*!< SCB HFSR: VECTTBL Position */
#endif /*SCB_HFSR_VECTTBL_Pos*/

#ifndef SCB_HFSR_VECTTBL_Msk
#define SCB_HFSR_VECTTBL_Msk                (1UL << SCB_HFSR_VECTTBL_Pos)                  /*!< SCB HFSR: VECTTBL Mask */
#endif /*SCB_HFSR_VECTTBL_Msk*/


/* SCB Debug Fault Status Register Definitions */
#ifndef SCB_DFSR_EXTERNAL_Pos
#define SCB_DFSR_EXTERNAL_Pos                4                                             /*!< SCB DFSR: EXTERNAL Position */
#endif /*SCB_DFSR_EXTERNAL_Pos*/

#ifndef SCB_DFSR_EXTERNAL_Msk
#define SCB_DFSR_EXTERNAL_Msk               (1UL << SCB_DFSR_EXTERNAL_Pos)                 /*!< SCB DFSR: EXTERNAL Mask */
#endif /*SCB_DFSR_EXTERNAL_Msk*/


#ifndef SCB_DFSR_VCATCH_Pos
#define SCB_DFSR_VCATCH_Pos                  3                                             /*!< SCB DFSR: VCATCH Position */
#endif /*SCB_DFSR_VCATCH_Pos*/

#ifndef SCB_DFSR_VCATCH_Msk
#define SCB_DFSR_VCATCH_Msk                 (1UL << SCB_DFSR_VCATCH_Pos)                   /*!< SCB DFSR: VCATCH Mask */
#endif /*SCB_DFSR_VCATCH_Msk*/


#ifndef SCB_DFSR_DWTTRAP_Pos
#define SCB_DFSR_DWTTRAP_Pos                 2                                             /*!< SCB DFSR: DWTTRAP Position */
#endif /*SCB_DFSR_DWTTRAP_Pos*/

#ifndef SCB_DFSR_DWTTRAP_Msk
#define SCB_DFSR_DWTTRAP_Msk                (1UL << SCB_DFSR_DWTTRAP_Pos)                  /*!< SCB DFSR: DWTTRAP Mask */
#endif /*SCB_DFSR_DWTTRAP_Msk*/


#ifndef SCB_DFSR_BKPT_Pos
#define SCB_DFSR_BKPT_Pos                    1                                             /*!< SCB DFSR: BKPT Position */
#endif /*SCB_DFSR_BKPT_Pos*/

#ifndef SCB_DFSR_BKPT_Msk
#define SCB_DFSR_BKPT_Msk                   (1UL << SCB_DFSR_BKPT_Pos)                     /*!< SCB DFSR: BKPT Mask */
#endif /*SCB_DFSR_BKPT_Msk*/


#ifndef SCB_DFSR_HALTED_Pos
#define SCB_DFSR_HALTED_Pos                  0                                             /*!< SCB DFSR: HALTED Position */
#endif /*SCB_DFSR_HALTED_Pos*/

#ifndef SCB_DFSR_HALTED_Msk
#define SCB_DFSR_HALTED_Msk                 (1UL << SCB_DFSR_HALTED_Pos)                   /*!< SCB DFSR: HALTED Mask */
#endif /*SCB_DFSR_HALTED_Msk*/


////////////////////////////////////////////////////////////////////////////////
//// SCB REGISTERS
#ifndef SCS_BASE
#define SCS_BASE            (0xE000E000UL)                            /*!< System Control Space Base Address */
#endif

#ifndef SCB_BASE
#define SCB_BASE            (SCS_BASE +  0x0D00UL)                    /*!< System Control Block Base Address */
#endif

#ifndef SCB_CPUID
#define SCB_CPUID  (SCB_BASE+0x000UL)
#endif /*SCB_CPUID*/

#ifndef SCB_ICSR
#define SCB_ICSR  (SCB_BASE+0x004UL)
#endif /*SCB_ICSR*/

#ifndef SCB_VTOR
#define SCB_VTOR  (SCB_BASE+0x008UL)
#endif /*SCB_VTOR*/

#ifndef SCB_AIRCR
#define SCB_AIRCR  (SCB_BASE+0x00CUL)
#endif /*SCB_AIRCR*/

#ifndef SCB_SCR
#define SCB_SCR  (SCB_BASE+0x010UL)
#endif /*SCB_SCR*/

#ifndef SCB_CCR
#define SCB_CCR  (SCB_BASE+0x014UL)
#endif /*SCB_CCR*/

#ifndef SCB_SHP
#define SCB_SHP  (SCB_BASE+0x018UL)
#endif /*SCB_SHP*/

#ifndef SCB_SHCSR
#define SCB_SHCSR  (SCB_BASE+0x024UL)
#endif /*SCB_SHCSR*/

#ifndef SCB_CFSR
#define SCB_CFSR  (SCB_BASE+0x028UL)
#endif /*SCB_CFSR*/

#ifndef SCB_HFSR
#define SCB_HFSR  (SCB_BASE+0x02CUL)
#endif /*SCB_HFSR*/

#ifndef SCB_DFSR
#define SCB_DFSR  (SCB_BASE+0x030UL)
#endif /*SCB_DFSR*/

#ifndef SCB_MMFAR
#define SCB_MMFAR  (SCB_BASE+0x034UL)
#endif /*SCB_MMFAR*/

#ifndef SCB_BFAR
#define SCB_BFAR  (SCB_BASE+0x038UL)
#endif /*SCB_BFAR*/

#ifndef SCB_AFSR
#define SCB_AFSR  (SCB_BASE+0x03CUL)
#endif /*SCB_AFSR*/

#ifndef SCB_PFR
#define SCB_PFR  (SCB_BASE+0x040UL)
#endif /*SCB_PFR*/

#ifndef SCB_DFR
#define SCB_DFR  (SCB_BASE+0x048UL)
#endif /*SCB_DFR*/

#ifndef SCB_ADR
#define SCB_ADR  (SCB_BASE+0x04CUL)
#endif /*SCB_ADR*/

#ifndef SCB_MMFR
#define SCB_MMFR  (SCB_BASE+0x050UL)
#endif /*SCB_MMFR*/

#ifndef SCB_ISAR
#define SCB_ISAR  (SCB_BASE+0x058UL)
#endif /*SCB_ISAR*/

#ifndef SCB_CPACR
#define SCB_CPACR  (SCB_BASE+0x088UL)
#endif /*SCB_CPAR*/




#endif /*INCLUDED_CPU_REGISTERS_H*/
