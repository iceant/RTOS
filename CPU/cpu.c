#include <cpu.h>


#ifndef   CPU_CLZ_ASM_PRESENT
static const cpu_uint8_t cpu_port__clz_table[256] = {
        8u, 7u, 6u, 6u, 5u, 5u, 5u, 5u, 4u, 4u, 4u, 4u, 4u, 4u, 4u, 4u,
        3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u,
        2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u,
        2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u,
        1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u,
        1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u,
        1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u,
        1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u,
        0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u
};

////////////////////////////////////////////////////////////////////////////////
////

cpu_uintptr_t cpu_clz(cpu_uintptr_t val) {
    cpu_uintptr_t nbr_lead_zeros;
    cpu_uint8_t idx;
#if defined(CPU_8BIT)
    idx = (cpu_uint8_t)(val>>0);
    nbr_lead_zeros = (cpu_uintptr_t)(cpu_port__clz_table[idx] + 0u);
#elif defined(CPU_16BIT)
    if(val > 0x00FF){
        idx = (cpu_uint8_t)(val>>8u);
        nbr_lead_zeros = (cpu_uintptr_t)(cpu_port__clz_table[idx] + 0u);
    }else{
        idx = (cpu_uint8_t)(val>>0u);
        nbr_lead_zeros = (cpu_uintptr_t)(cpu_port__clz_table[idx] + 8u);
    }
#elif defined(CPU_32BIT)
    if (val > 0x0000FFFFu) {
        if (val > 0x00FFFFFFu) {
            idx = (cpu_uint8_t) (val >> 24u);
            nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 0u);
        } else {
            idx = (cpu_uint8_t) (val >> 16u);
            nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 8u);
        }
    } else {
        if (val > 0x000000FFu) {
            idx = (cpu_uint8_t) (val >> 8u);
            nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 16u);
        } else {
            idx = (cpu_uint8_t) (val >> 0u);
            nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 24u);
        }
    }
#elif defined(CPU_64BIT)
    if (val > 0x00000000FFFFFFFFu) {
        if (val > 0x0000FFFFFFFFFFFFu) {
            if (val > 0x00FFFFFFFFFFFFFFu) {
                idx = (cpu_uint8_t) (val >> 56u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 0u);
            } else {
                idx = (cpu_uint8_t) (val >> 48u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 8u);
            }
        } else {
            if (val > 0x000000FFFFFFFFFFu) {
                idx = (cpu_uint8_t) (val >> 40u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 16u);
            } else {
                idx = (cpu_uint8_t) (val >> 32u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 24u);
            }
        }
    } else {
        if (val > 0x000000000000FFFFu) {
            if (val > 0x0000000000FFFFFFu) {
                idx = (cpu_uint8_t) (val >> 24u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 32u);
            } else {
                idx = (cpu_uint8_t) (val >> 16u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 40u);
            }
        } else {
            if (val > 0x00000000000000FFu) {
                idx = (cpu_uint8_t) (val >> 8u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 48u);
            } else {
                idx = (cpu_uint8_t) (val >> 0u);
                nbr_lead_zeros = (cpu_uintptr_t) (cpu_port__clz_table[idx] + 56u);
            }
        }
    }
#else
    (void)*idx;
    nbr_lead_zeros = 0u;
#endif

    return nbr_lead_zeros;

}

#endif

