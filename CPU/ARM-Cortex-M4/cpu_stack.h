#ifndef INCLUDED_CPU_STACK_H
#define INCLUDED_CPU_STACK_H

/* -------------------------------------------------------------------------------------------------------------- */
#ifndef INCLUDED_CPU_DEFINITIONS_H
#include <cpu_definitions.h>
#endif /*INCLUDED_CPU_DEFINITIONS_H*/

/* -------------------------------------------------------------------------------------------------------------- */


#define CPU_STACK_OK        0
#define CPU_STACK_ERROR     (-1)


/* -------------------------------------------------------------------------------------------------------------- */

typedef void (*cpu_stack_switch_callback_t)(void);

/* -------------------------------------------------------------------------------------------------------------- */

cpu_err_t cpu_stack_init(void*              program_entry
                         , void*            program_parameter
                         , uint8_t *    stack_base
                         , uint8_t *    stack_limit
                         , cpu_size_t   stack_size
                         , void *       program_exit_entry
                         , uint8_t **   result_stack_p
                         );

/*
 *
 * RETURN
 *      - CPU_STACK_ERROR : when switch already in progress
 *      - CPU_STACK_OK    : when switch request have been set
 */
cpu_err_t cpu_stack_switch(void** from_stack_p, void** to_stack_p, cpu_stack_switch_callback_t callback);

void cpu_stack_switch_callback(void);

#endif /* INCLUDED_CPU_STACK_H */
