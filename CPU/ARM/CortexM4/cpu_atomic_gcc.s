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


.end