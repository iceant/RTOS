.cpu cortex-m4
.text
.syntax unified
.thumb

/*
 * void cpu_atomic_add(cpu_atomic_t* atomic, cpu_int_t value);
 */
    .section  .text.cpu_atomic_add
    .global cpu_atomic_add
    .type cpu_atomic_add, %function
cpu_atomic_add:
__cpu_atomic_add_loop:
    LDREX R2, [R0]
    ADD R2, R2, R1
    STREX R3, R2, [R0]
    CBZ R3, __cpu_atomic_add_exit
    B __cpu_atomic_add_loop
__cpu_atomic_add_exit:
    DMB
    BX LR

/*
 * bool cpu_atomic_cmpxchg(cpu_atomic_t* atomic, cpu_int_t old_value, cpu_int_t new_value);
 */
    .section  .text.cpu_atomic_cmpxchg
    .global cpu_atomic_cmpxchg
    .type cpu_atomic_cmpxchg, %function
cpu_atomic_cmpxchg:
    PUSH {r4}
    LDREX r3, [r0]
    MOV r4, #0
    TEQ r3, r1
    BNE __cpu_atomic_cmpxchg_exit
    STREX r3, r2, [r0]
    CMP r3, #0
    ITE EQ
    MOVEQ r4, #1
    MOVNE r4, #0
__cpu_atomic_cmpxchg_exit:
    MOV r0, r4
    POP {r4}
    DMB
    BX lr


/*
 * cpu_int_t cpu_atomic_store(cpu_atomic_t* atomic, cpu_int_t new_value);
 */
    .section  .text.cpu_atomic_store
    .global cpu_atomic_store
    .type cpu_atomic_store, %function
cpu_atomic_store:
__cpu_atomic_store_loop:
    LDREX r2, [r0]
    STREX r3, r1, [r0]
    CBZ r3, __cpu_atomic_store_exit
    B __cpu_atomic_store_loop
__cpu_atomic_store_exit:
    MOV r0, r2
    DMB
    BX lr


/*
* cpu_int_t cpu_atomic_add_return(cpu_atomic_t* atomic, cpu_int_t value)
*/
    .section  .text.cpu_atomic_add_return
    .global cpu_atomic_add_return
    .type cpu_atomic_add_return, %function
cpu_atomic_add_return:
__cpu_atomic_add_return_loop:
    LDREX r2, [r0]
    ADD r2, r2, r1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_add_return_exit
    B __cpu_atomic_add_return_loop
__cpu_atomic_add_return_exit:
    MOV r0, r2
    DMB
    BX lr

/*
* void cpu_atomic_sub(cpu_atomic_t * atomic, cpu_int_t value)
*/
    .section  .text.cpu_atomic_sub
    .global cpu_atomic_sub
    .type cpu_atomic_sub, %function
cpu_atomic_sub:
__cpu_atomic_sub_loop:
    LDREX r2, [r0]
    SUB r2, r2, r1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_sub_exit
    B __cpu_atomic_sub_loop
__cpu_atomic_sub_exit:
    DMB
    BX lr


/*
* cpu_int_t cpu_atomic_sub_return(cpu_atomic_t * atomic, cpu_int_t value)
*/
    .section  .text.cpu_atomic_sub_return
    .global cpu_atomic_sub_return
    .type cpu_atomic_sub_return, %function
cpu_atomic_sub_return:
__cpu_atomic_sub_return_loop:
    LDREX r2, [r0]
    SUB r2, r2, r1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_sub_return_exit
    B __cpu_atomic_sub_return_loop
__cpu_atomic_sub_return_exit:
    MOV r0, r2
    DMB
    BX lr


/*
* void cpu_atomic_inc(cpu_atomic_t * atomic)
*/
    .section  .text.cpu_atomic_inc
    .global cpu_atomic_inc
    .type cpu_atomic_inc, %function
cpu_atomic_inc:
__cpu_atomic_inc_loop:
    LDREX r2, [r0]
    ADD r2, r2, #1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_inc_exit
    B __cpu_atomic_inc_loop
__cpu_atomic_inc_exit:
    DMB
    BX lr


/*
* cpu_int_t cpu_atomic_inc_return(cpu_atomic_t * atomic)
*/
    .section  .text.cpu_atomic_inc_return
    .global cpu_atomic_inc_return
    .type cpu_atomic_inc_return, %function
cpu_atomic_inc_return:
__cpu_atomic_inc_return_loop:
    LDREX r2, [r0]
    ADD r2, r2, #1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_inc_return_exit
    B __cpu_atomic_inc_return_loop
__cpu_atomic_inc_return_exit:
    MOV r0, r2
    DMB
    BX lr


/*
* void cpu_atomic_dec(cpu_atomic_t * atomic)
*/
    .section  .text.cpu_atomic_dec
    .global cpu_atomic_dec
    .type cpu_atomic_dec, %function
cpu_atomic_dec:
__cpu_atomic_dec_loop:
    LDREX r2, [r0]
    SUB r2, r2, #1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_dec_exit
    B __cpu_atomic_dec_loop
__cpu_atomic_dec_exit:
    DMB
    BX lr


/*
* cpu_int_t cpu_atomic_dec_return(cpu_atomic_t * atomic)
*/
    .section  .text.cpu_atomic_dec_return
    .global cpu_atomic_dec_return
    .type cpu_atomic_dec_return, %function
cpu_atomic_dec_return:
__cpu_atomic_dec_return_loop:
    LDREX r2, [r0]
    ADD r2, r2, #1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_dec_return_exit
    B __cpu_atomic_dec_return_loop
__cpu_atomic_dec_return_exit:
    MOV r0, r2
    DMB
    BX lr


/*
* cpu_int_t cpu_atomic_xchg(cpu_atomic_t* atomic, cpu_int_t value)
*/
    .section  .text.cpu_atomic_xchg
    .global cpu_atomic_xchg
    .type cpu_atomic_xchg, %function
cpu_atomic_xchg:
__cpu_atomic_xchg_loop:
    LDREX r2, [r0]
    STREX r3, r1, [r0]
    CBZ r3, __cpu_atomic_xchg_exit
    B __cpu_atomic_xchg_loop
__cpu_atomic_xchg_exit:
    MOV r0, r2
    DMB
    BX lr



/*
* void cpu_atomic_or(cpu_atomic_t* atomic, cpu_int_t value)
*/
    .section  .text.cpu_atomic_or
    .global cpu_atomic_or
    .type cpu_atomic_or, %function
cpu_atomic_or:
__cpu_atomic_or_loop:
    LDREX r2, [r0]
    ORR r2, r1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_or_exit
    B __cpu_atomic_or_loop
__cpu_atomic_or_exit:
    DMB
    BX lr



/*
* void cpu_atomic_xor(cpu_atomic_t* atomic, cpu_int_t value)
*/
    .section  .text.cpu_atomic_xor
    .global cpu_atomic_xor
    .type cpu_atomic_xor, %function
cpu_atomic_xor:
__cpu_atomic_xor_loop:
    LDREX r2, [r0]
    EOR r2, r1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_xor_exit
    B __cpu_atomic_xor_loop
__cpu_atomic_xor_exit:
    DMB
    BX lr


/*
* bool cpu_atomic_test_bit(cpu_atomic_t* atomic, cpu_int_t bit_no)
*/
    .section  .text.cpu_atomic_test_bit
    .global cpu_atomic_test_bit
    .type cpu_atomic_test_bit, %function
cpu_atomic_test_bit:
    PUSH {r4, r5}
    MOV r4, #1
    LSL r4, r1
__cpu_atomic_test_bit_loop:
    LDREX r2, [r0]
    AND r5, r2, r4
    LSR r5, r1
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_test_bit_exit
    B __cpu_atomic_test_bit_loop
__cpu_atomic_test_bit_exit:
    MOV r0, r5
    POP {r4, r5}
    DMB
    BX lr

/*
* void cpu_atomic_set_bit(cpu_atomic_t* atomic, cpu_int_t bit_no)
*/
    .section  .text.cpu_atomic_set_bit
    .global cpu_atomic_set_bit
    .type cpu_atomic_set_bit, %function
cpu_atomic_set_bit:
    PUSH {r4}
    MOV r4, #1
    LSL r4, r1
__cpu_atomic_set_bit_loop:
    LDREX r2, [r0]
    ORR r2, r4
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_set_bit_exit
    B __cpu_atomic_set_bit_loop
__cpu_atomic_set_bit_exit:
    POP {r4}
    DMB
    BX lr


/*
* void cpu_atomic_clear_bit(cpu_atomic_t* atomic, cpu_int_t bit_no)
*/
    .section  .text.cpu_atomic_clear_bit
    .global cpu_atomic_clear_bit
    .type cpu_atomic_clear_bit, %function
cpu_atomic_clear_bit:
    PUSH {r4}
    MOV r4, #1
    LSL r4, r1
__cpu_atomic_clear_bit_loop:
    LDREX r2, [r0]
    BIC r2, r4
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_clear_bit_exit
    B __cpu_atomic_clear_bit_loop
__cpu_atomic_clear_bit_exit:
    POP {r4}
    DMB
    BX lr


/*
* void cpu_atomic_change_bit(cpu_atomic_t* atomic, cpu_int_t bit_no)
*/
    .section  .text.cpu_atomic_change_bit
    .global cpu_atomic_change_bit
    .type cpu_atomic_change_bit, %function
cpu_atomic_change_bit:
    PUSH {r4}
    MOV r4, #1
    LSL r4, r1
__cpu_atomic_change_bit_loop:
    LDREX r2, [r0]
    EOR r2, r4
    STREX r3, r2, [r0]
    CBZ r3, __cpu_atomic_change_bit_exit
    B __cpu_atomic_change_bit_loop
__cpu_atomic_change_bit_exit:
    POP {r4}
    DMB
    BX lr




.end



