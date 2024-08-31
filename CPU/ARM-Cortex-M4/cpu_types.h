#ifndef INCLUDED_CPU_TYPES_H
#define INCLUDED_CPU_TYPES_H

/* -------------------------------------------------------------------------------------------------------------- */

#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_STDBOOL_H
#define INCLUDED_STDBOOL_H
#include <stdbool.h>
#endif /*INCLUDED_STDBOOL_H*/

#ifndef INCLUDED_C_COMPILER_H
#include <c_compiler.h>
#endif /*INCLUDED_C_COMPILER_H*/



/* -------------------------------------------------------------------------------------------------------------- */

typedef int32_t     cpu_int_t;
typedef uint32_t    cpu_uint_t;
typedef cpu_uint_t  cpu_size_t;
typedef cpu_uint_t  cpu_reg_t;

typedef cpu_int_t   cpu_err_t;
typedef cpu_uint_t  cpu_stack_t;


#endif /* INCLUDED_CPU_TYPES_H */
