#include <fmc_operation.h>

////////////////////////////////////////////////////////////////////////////////
////


#define PAGE(T, SZ) (((T) + (SZ) - 1)/(SZ))

////////////////////////////////////////////////////////////////////////////////
////


int fmc_page_get_by_addr(uint32_t addr, fmc_page_t* page)
{
    if(addr>=0x08000000 && addr<0x08080000){
        int page_name = PAGE(addr, FMC_BANK0_PAGE_SIZE);
        page->page_name = page_name - 1;
        page->size = FMC_BANK0_PAGE_SIZE;
        page->start_addr = 0x08000000 + page_name * FMC_BANK0_PAGE_SIZE;
        page->end_addr = 0x080007FF + page_name * FMC_BANK0_PAGE_SIZE;
    }else if(addr>=0x08080000 && addr<=0x082FFFFF){
        int page_name = PAGE(addr, FMC_BANK1_PAGE_SIZE);
        page->page_name = page_name - 1;
        page->size = FMC_BANK1_PAGE_SIZE;
        page->start_addr = 0x08080000 + page_name * FMC_BANK1_PAGE_SIZE;
        page->end_addr = 0x08080FFF + page_name * FMC_BANK1_PAGE_SIZE;
    }else{
        return -1;
    }

    return 0;
}

int fmc_erase_page_by_addr(uint32_t addr, uint32_t size)
{
    int i;
    fmc_page_t start_page;
    fmc_page_t end_page;

    fmc_page_get_by_addr(addr, &start_page);
    fmc_page_get_by_addr(addr+size, &end_page);


    /* unlock the flash program/erase controller */
    fmc_unlock();

    /* clear all pending flags */
    fmc_flag_clear(FMC_FLAG_BANK0_END);
    fmc_flag_clear(FMC_FLAG_BANK0_WPERR);
    fmc_flag_clear(FMC_FLAG_BANK0_PGERR);

    /* erase the flash pages */
    for(i = start_page.page_name; i<end_page.page_name; i++){
        fmc_page_erase(start_page.start_addr + (i-start_page.page_name) * start_page.size);
        fmc_flag_clear(FMC_FLAG_BANK0_END);
        fmc_flag_clear(FMC_FLAG_BANK0_WPERR);
        fmc_flag_clear(FMC_FLAG_BANK0_PGERR);
    }

    /* lock the main FMC after the erase operation */
    fmc_lock();

    return 0;
}


int fmc_program(uint32_t addr, uint8_t * data, uint32_t size)
{
    /* unlock the flash program/erase controller */
    fmc_unlock();

    uint32_t *word_addr = (uint32_t*)data;
    uint32_t address = addr ;
    uint32_t end_address = address + size;


    /* program flash */
    while(address < end_address){
        fmc_word_program(address, *word_addr++);
        address += 4;
        fmc_flag_clear(FMC_FLAG_BANK0_END);
        fmc_flag_clear(FMC_FLAG_BANK0_WPERR);
        fmc_flag_clear(FMC_FLAG_BANK0_PGERR);
    }

    /* lock the main FMC after the program operation */
    fmc_lock();
    return 0;
}

