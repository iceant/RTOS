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
cpu_atomic_add_1:
    LDREX R2, [R0]
    ADD R2, R2, R1
    STREX R3, R2, [R0]
    CBZ R3, cpu_atomic_add_2
    B cpu_atomic_add_1
cpu_atomic_add_2:
    BX LR

/*
 * int cpu_atomic_cmpxchg(cpu_atomic_t* atomic, cpu_int_t old_value, cpu_int_t new_value);
 */
    .section  .text.cpu_atomic_cmpxchg
    .global cpu_atomic_cmpxchg
    .type cpu_atomic_cmpxchg, %function
cpu_atomic_cmpxchg:
    PUSH {r4}
    LDREX r3, [r0]
    MOV r4, r1
    TEQ r3, r1
    BNE __cpu_atomic_cmpxchg_exit
    STREX r3, r2, [r0]
    MOV r4, r2
__cpu_atomic_cmpxchg_exit:
    MOV R0, R4
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
    DMB
    CBZ r3, __cpu_atomic_store_exit
    B __cpu_atomic_store_loop
__cpu_atomic_store_exit:
    MOV r0, r2
    BX lr


.end