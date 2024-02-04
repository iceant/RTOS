#ifndef INCLUDED_OS_RINGBUFFER_H
#define INCLUDED_OS_RINGBUFFER_H

////////////////////////////////////////////////////////////////////////////////
//// 
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
//// 
typedef struct os_ringbuffer_t{
    uint8_t* buffer;
    os_size_t read_offset;
    os_size_t write_offset;
    os_size_t buffer_size;
}os_ringbuffer_t;

typedef enum {
    kRB_RET_OK,
    kRB_RET_ERROR,
    kRB_RET_ENOMEN,
    kRB_RET_EFULL,
    kRB_RET_EEMPTY,
}rb_ret_t;

typedef struct os_ringbuffer_text_t{
    os_ringbuffer_t * buffer;
    int start;
    int end;
}os_ringbuffer_text_t;

typedef struct os_ringbuffer_iter_t{
    os_ringbuffer_text_t* text;
    int start;
    int end;
}os_ringbuffer_iter_t;
////////////////////////////////////////////////////////////////////////////////
//// METHODS

rb_ret_t os_ringbuffer_init(os_ringbuffer_t* buffer, uint8_t *block, os_size_t size);

os_size_t os_ringbuffer_write(os_ringbuffer_t* buffer, uint8_t* data, os_size_t data_size);

//rb_ret_t os_ringbuffer_read(os_ringbuffer_t* buffer, uint8_t* out_buffer, uint32_t out_buffer_size, uint32_t* read_size);

os_size_t os_ringbuffer_read(os_ringbuffer_t* buffer, int offset,  uint8_t* buf, os_size_t buf_size);

void os_ringbuffer_reset(os_ringbuffer_t* buffer);

//rb_ret_t os_ringbuffer_set(os_ringbuffer_t* buffer, uint32_t out_buffer_size, uint32_t* read_size);

os_size_t os_ringbuffer_try_read(os_ringbuffer_t* buffer, int offset, uint8_t* out_buffer, os_size_t out_buffer_size);

os_size_t os_ringbuffer_used(os_ringbuffer_t* buffer);

uint8_t os_ringbuffer_peek(os_ringbuffer_t* buffer, int idx);

rb_ret_t os_ringbuffer_put(os_ringbuffer_t* buffer, uint8_t data);
rb_ret_t os_ringbuffer_get(os_ringbuffer_t* buffer, uint8_t* data);
int os_ringbuffer_is_full(os_ringbuffer_t* buffer);
int os_ringbuffer_is_empty(os_ringbuffer_t* buffer);

int os_ringbuffer_count(os_ringbuffer_t* ringbuffer, int start, int end, const char* token);

/*从 buffer 中找到数据，如果没找到返回 -1，找到返回数据开始的 index*/
int os_ringbuffer_find(os_ringbuffer_t* buffer, int offset,  uint8_t* data, os_size_t data_size);
int os_ringbuffer_find_str(os_ringbuffer_t* ringbuffer, int offset,  const char* string);
int os_ringbuffer_index(os_ringbuffer_t * ringbuffer, int index);
int os_ringbuffer_cut(os_ringbuffer_text_t * result, os_ringbuffer_t * buffer, int start, int end, const char* prefix, const char* postfix);
unsigned long os_ringbuffer_strtoul(os_ringbuffer_t* buffer, int offset, int* endptr, int base);

void os_ringbuffer_iter_init(os_ringbuffer_iter_t* iter, os_ringbuffer_text_t * text);
int os_ringbuffer_iter(os_ringbuffer_iter_t* text, const char* token);
unsigned long os_ringbuffer_iter_strtoul(os_ringbuffer_iter_t* iter, int base);
int os_ringbuffer_strcmp(os_ringbuffer_t * buffer, int offset, int end, const char* str);

os_size_t os_ringbuffer_memcpy(uint8_t * dst, os_ringbuffer_t* buffer, int offset, os_size_t size);

int os_ringbuffer_pos(os_ringbuffer_t *buffer, int pos);
void os_ringbuffer_set_read_offset(os_ringbuffer_t* buffer, int read_offset);
void os_ringbuffer_set_write_offset(os_ringbuffer_t* buffer, int write_offset);


uint32_t os_ringbuffer_read_uint32_be(os_ringbuffer_t* buffer);
uint16_t os_ringbuffer_read_uint16_le(os_ringbuffer_t* buffer);
uint16_t os_ringbuffer_read_uint16_be(os_ringbuffer_t* buffer);

#endif /*INCLUDED_OS_RINGBUFFER_H*/
