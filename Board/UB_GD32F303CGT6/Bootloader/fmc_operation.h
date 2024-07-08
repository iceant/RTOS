#ifndef INCLUDED_FMC_OPERATION_H
#define INCLUDED_FMC_OPERATION_H

#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct fmc_page_s{
    int page_name;
    int size;
    uint32_t start_addr;
    uint32_t end_addr;
}fmc_page_t;

////////////////////////////////////////////////////////////////////////////////
////
#define FMC_BANK0_PAGE_SIZE (2*1024)
#define FMC_BANK1_PAGE_SIZE (4*1024)


////////////////////////////////////////////////////////////////////////////////
////
int fmc_page_get_by_addr(uint32_t addr, fmc_page_t* page);


int fmc_erase_page_by_addr(uint32_t addr, uint32_t size);

int fmc_program(uint32_t addr, uint8_t * data, uint32_t size);


#endif /*INCLUDED_FMC_OPERATION_H*/
