#ifndef INCLUDED_SDK_RINGBUFFER_H
#define INCLUDED_SDK_RINGBUFFER_H

////////////////////////////////////////////////////////////////////////////////
//// 
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
//// 
typedef struct sdk_ringbuffer_t{
    uint8_t* buffer;
    os_size_t read_offset;
    os_size_t write_offset;
    os_size_t buffer_size;
}sdk_ringbuffer_t;

typedef enum {
    kRB_RET_OK,
    kRB_RET_ERROR,
    kRB_RET_ENOMEN,
    kRB_RET_EFULL,
    kRB_RET_EEMPTY,
}rb_ret_t;

typedef struct sdk_ringbuffer_text_t{
    sdk_ringbuffer_t * buffer;
    int start;
    int end;
}sdk_ringbuffer_text_t;

typedef struct sdk_ringbuffer_iter_t{
    sdk_ringbuffer_text_t* text;
    int start;
    int end;
}sdk_ringbuffer_iter_t;

////////////////////////////////////////////////////////////////////////////////
#define SDK_RINGBUFFER_NOTFOUNT -1

////////////////////////////////////////////////////////////////////////////////
//// METHODS

rb_ret_t sdk_ringbuffer_init(sdk_ringbuffer_t* buffer, uint8_t *block, os_size_t size);

os_size_t sdk_ringbuffer_write(sdk_ringbuffer_t* buffer, uint8_t* data, os_size_t data_size);

//rb_ret_t sdk_ringbuffer_read(sdk_ringbuffer_t* buffer, uint8_t* out_buffer, uint32_t out_buffer_size, uint32_t* read_size);

os_size_t sdk_ringbuffer_read(sdk_ringbuffer_t* buffer, int offset,  uint8_t* buf, os_size_t buf_size);

void sdk_ringbuffer_reset(sdk_ringbuffer_t* buffer);

//rb_ret_t sdk_ringbuffer_set(sdk_ringbuffer_t* buffer, uint32_t out_buffer_size, uint32_t* read_size);

os_size_t sdk_ringbuffer_try_read(sdk_ringbuffer_t* buffer, int offset, uint8_t* out_buffer, os_size_t out_buffer_size);

int sdk_ringbuffer_used(sdk_ringbuffer_t* buffer);

uint8_t sdk_ringbuffer_peek(sdk_ringbuffer_t* buffer, int idx);

rb_ret_t sdk_ringbuffer_put(sdk_ringbuffer_t* buffer, uint8_t data);
rb_ret_t sdk_ringbuffer_get(sdk_ringbuffer_t* buffer, uint8_t* data);
int sdk_ringbuffer_is_full(sdk_ringbuffer_t* buffer);
int sdk_ringbuffer_is_empty(sdk_ringbuffer_t* buffer);

int sdk_ringbuffer_count(sdk_ringbuffer_t* ringbuffer, int start, int end, const char* token);

/*从 buffer 中找到数据，如果没找到返回 -1，找到返回数据开始的 index*/
int sdk_ringbuffer_find(sdk_ringbuffer_t* buffer, int offset,  uint8_t* data, os_size_t data_size);
int sdk_ringbuffer_find_str(sdk_ringbuffer_t* ringbuffer, int offset,  const char* string);
int sdk_ringbuffer_index(sdk_ringbuffer_t * ringbuffer, int index);
/* 从 buffer 中找到 prefix xxxx postfix 之间的内容，成功返回 0 否则返回负数 */
int sdk_ringbuffer_cut(sdk_ringbuffer_text_t * result, sdk_ringbuffer_t * buffer, int start, int end, const char* prefix, const char* postfix);
unsigned long sdk_ringbuffer_strtoul(sdk_ringbuffer_t* buffer, int offset, int* endptr, int base);

void sdk_ringbuffer_iter_init(sdk_ringbuffer_iter_t* iter, sdk_ringbuffer_text_t * text);
int sdk_ringbuffer_iter(sdk_ringbuffer_iter_t* text, const char* token);
unsigned long sdk_ringbuffer_iter_strtoul(sdk_ringbuffer_iter_t* iter, int base);
int sdk_ringbuffer_strcmp(sdk_ringbuffer_t * buffer, int offset, int end, const char* str);

os_size_t sdk_ringbuffer_memcpy(uint8_t * dst, sdk_ringbuffer_t* buffer, int offset, os_size_t size);

int sdk_ringbuffer_pos(sdk_ringbuffer_t *buffer, int pos);
void sdk_ringbuffer_set_read_offset(sdk_ringbuffer_t* buffer, int read_offset);
void sdk_ringbuffer_set_write_offset(sdk_ringbuffer_t* buffer, int write_offset);


uint32_t sdk_ringbuffer_read_uint32_be(sdk_ringbuffer_t* buffer);
uint16_t sdk_ringbuffer_read_uint16_le(sdk_ringbuffer_t* buffer);
uint16_t sdk_ringbuffer_read_uint16_be(sdk_ringbuffer_t* buffer);

#endif /*INCLUDED_SDK_RINGBUFFER_H*/
