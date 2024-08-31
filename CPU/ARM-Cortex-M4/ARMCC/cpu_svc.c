#include <cpu_svc.h>
#include <cpu_types.h>
#include <stdio.h>

/* -------------------------------------------------------------------------------------------------------------- */
// GLOBAL VARIABLES
volatile cpu_uint_t svc_exc_return;

/* -------------------------------------------------------------------------------------------------------------- */
// STATIC VARIABLES
static cpu_svc_function_t cpu_svc__function_table[0xFF];

/* -------------------------------------------------------------------------------------------------------------- */
// STATIC FUNCTIONS
void SVC_Handler_C(cpu_uint_t *svc_args, cpu_uint_t exc_return){
    unsigned int svc_number;
    svc_number = ((char *)svc_args[6])[-2];
    cpu_svc_function_t function = cpu_svc__function_table[svc_number];
    if(function){
        function(svc_args, &svc_args[0]);
    }else{
        printf("[SVC] ERROR - Invalid SVC #%d\n", svc_number);
    }
}

/* -------------------------------------------------------------------------------------------------------------- */


__asm void SVC_Handler(void)
{
    IMPORT svc_exc_return
    IMPORT SVC_Handler_C

        TST LR, #4      /* 测试 EXC_RETURN 第 2 位 */
        ITE EQ
        MRSEQ R0, MSP
        MRSNE R0, PSP
        LDR R1, =svc_exc_return
        STR LR,[R1]
        BL SVC_Handler_C
        LDR R1,=svc_exc_return
        LDR LR,[R1]
        BX LR
        ALIGN 4
}

void cpu_svc_init(void){
    for(size_t i=0; i<0xFF; i++){
        cpu_svc__function_table[i] = 0;
    }
}

cpu_svc_function_t cpu_svc_register(uint8_t svc_number, cpu_svc_function_t function){
    cpu_svc_function_t fn = cpu_svc__function_table[svc_number];
    cpu_svc__function_table[svc_number] = function;
    return fn;
}
