#ifndef INCLUDED_CPU_REGISTERS_H
#define INCLUDED_CPU_REGISTERS_H

////////////////////////////////////////////////////////////////////////////////
////

# define CPU_REG(ADDRESS) (*((volatile unsigned long *)(ADDRESS)))

////////////////////////////////////////////////////////////////////////////////
////

#ifndef SCB_ICSR
#define SCB_ICSR  0xE000ED04
#endif /*SCB_ICSR*/

#ifndef SCB_ICSR_PENDSVSET_Msk
#define SCB_ICSR_PENDSVSET_Msk 0x10000000
#endif /*SCB_ICSR_PENDSVSET_Msk*/

#ifndef SCS_BASE
#define SCS_BASE            (0xE000E000UL)                            /*!< System Control Space Base Address */
#endif

#ifndef SCB_BASE
#define SCB_BASE            (SCS_BASE +  0x0D00UL)                    /*!< System Control Block Base Address */
#endif

#ifndef SCB_AIRCR
#define SCB_AIRCR           (SCB_BASE +  0x000CUL)                    /*!< System Control Block Base Address */
#endif

#ifndef SCB_AIRCR_VECTKEY_Pos
#define SCB_AIRCR_VECTKEY_Pos              16U                                            /*!< SCB AIRCR: VECTKEY Position */
#endif

#ifndef SCB_AIRCR_PRIGROUP_Pos
#define SCB_AIRCR_PRIGROUP_Pos              8U                                            /*!< SCB AIRCR: PRIGROUP Position */
#endif

#ifndef SCB_AIRCR_PRIGROUP_Msk
#define SCB_AIRCR_PRIGROUP_Msk             (7UL << SCB_AIRCR_PRIGROUP_Pos)                /*!< SCB AIRCR: PRIGROUP Mask */
#endif

#ifndef SCB_AIRCR_SYSRESETREQ_Pos
#define SCB_AIRCR_SYSRESETREQ_Pos           2U                                            /*!< SCB AIRCR: SYSRESETREQ Position */
#endif

#ifndef SCB_AIRCR_SYSRESETREQ_Msk
#define SCB_AIRCR_SYSRESETREQ_Msk          (1UL << SCB_AIRCR_SYSRESETREQ_Pos)             /*!< SCB AIRCR: SYSRESETREQ Mask */
#endif

#endif /*INCLUDED_CPU_REGISTERS_H*/
