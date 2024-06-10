#include <cpu_mpu.h>
#include <cpu_registers.h>
#include <cpu_functions.h>
////////////////////////////////////////////////////////////////////////////////
////

void cpu_mpu_init(void)
{
    CPU_REG(SCB_SHCSR) = CPU_REG(SCB_SHCSR) | SCB_SHCSR_MEMFAULTENA_Msk;
}

void cpu_mpu_enable(cpu_uint_t options){
    CPU_MPU->CTRL = CPU_MPU_CTRL_ENABLE_Msk | options;
    cpu_DSB();
    cpu_ISB();
    return;
}

void cpu_mpu_disable(void)
{
    cpu_DMB();
    CPU_MPU->CTRL = 0;
    return;
}

void cpu_mpu_region_disable(cpu_uint_t region_num){
    CPU_MPU->RNR = region_num;
    CPU_MPU->RBAR = 0;
    CPU_MPU->RASR = 0;
    return;
}

void cpu_mpu_region_config(cpu_uint_t region_num, cpu_uint_t addr, cpu_uint_t size, cpu_uint_t attributes)
{
    CPU_MPU->RNR = region_num;
    CPU_MPU->RBAR = addr;
    CPU_MPU->RASR = size | attributes;
    
}

