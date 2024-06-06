#include <sdk_ringbuffer.h>
#include <string.h>
#include <ctype.h>
#include <limits.h>

////////////////////////////////////////////////////////////////////////////////
////
#define RB_ISFULL(B) ((((B)->write_offset+1)%(B)->buffer_size)==(B)->read_offset)
#define RB_ISEMPTY(B) ((B)->write_offset==(B)->read_offset)
#define RB_USED(B) (((B)->write_offset >= (B)->read_offset)? \
                    ((B)->write_offset - (B)->read_offset)  \
                    :((B)->write_offset + (B)->buffer_size - (B)->read_offset))


////////////////////////////////////////////////////////////////////////////////
////

rb_ret_t sdk_ringbuffer_init(sdk_ringbuffer_t *buffer, uint8_t *block, os_size_t size) {
    buffer->read_offset = 0;
    buffer->write_offset = 0;
    buffer->buffer_size = size;
    buffer->buffer = block;
    memset(buffer->buffer, 0, size);
    return kRB_RET_OK;
}

void sdk_ringbuffer_reset(sdk_ringbuffer_t *buffer) {
    buffer->read_offset = 0;
    buffer->write_offset = 0;
    //memset(buffer->buffer, 0, buffer->buffer_size);
}

rb_ret_t sdk_ringbuffer_put(sdk_ringbuffer_t *buffer, uint8_t data) {
    os_size_t write_idx;
    write_idx = buffer->write_offset + 1;
    if (write_idx == buffer->buffer_size) {
        write_idx = 0;
    }
    if (write_idx == buffer->read_offset) return kRB_RET_EFULL;

    buffer->buffer[buffer->write_offset] = data;
    buffer->write_offset = write_idx;
    return kRB_RET_OK;
}

rb_ret_t sdk_ringbuffer_get(sdk_ringbuffer_t *buffer, uint8_t *data) {
    if (RB_ISEMPTY(buffer)) {
        return kRB_RET_EEMPTY;
    }
    *data = buffer->buffer[buffer->read_offset];
    buffer->read_offset += 1;
    if (buffer->read_offset == buffer->buffer_size) {
        buffer->read_offset = 0;
    }
    return kRB_RET_OK;
}


os_size_t sdk_ringbuffer_write(sdk_ringbuffer_t *buffer, uint8_t *data, os_size_t data_size) {
    if (buffer == NULL) return kRB_RET_ERROR;
    if (RB_ISFULL(buffer)) return 0;
    if(data_size==0) return 0;

    os_size_t write_offset = buffer->write_offset;
    os_size_t buffer_size = buffer->buffer_size;
    os_size_t used_size = RB_USED(buffer);

    uint8_t *block = buffer->buffer;
    os_size_t write_size = buffer_size - used_size - 1 /* 1 lost byte for management */;
    write_size = (write_size > data_size) ? data_size : write_size;

    if ((write_size + write_offset) <= buffer_size) {
        memcpy(block + write_offset, data, data_size);
    } else {
        os_size_t first_write_size = buffer_size - write_offset;
        memcpy(block + write_offset, data, first_write_size);
        memcpy(block, data + first_write_size, write_size - first_write_size);
    }

    buffer->write_offset += write_size;
    buffer->write_offset %= buffer_size;

    return write_size;
}

os_size_t sdk_ringbuffer_read(sdk_ringbuffer_t *buffer, int offset, uint8_t *buf, os_size_t buf_size) {

    if (RB_ISEMPTY(buffer)) {
        return 0;
    }

    os_size_t read_offset = buffer->read_offset + offset;
    os_size_t buffer_size = buffer->buffer_size;
    os_size_t used_size = RB_USED(buffer);
    os_size_t read_size = (buf_size > used_size) ? used_size : buf_size;
    uint8_t *block = buffer->buffer;

    if (buf) {
        if ((buffer_size - read_offset) >= read_size) {
            memcpy(buf, block + read_offset, read_size);
        } else {
            uint32_t first_read_size = buffer_size - read_offset;
            memcpy(buf, block + read_offset, first_read_size);
            memcpy(buf + first_read_size, block, read_size - first_read_size);
        }
    }

    buffer->read_offset += read_size;
    buffer->read_offset %= buffer_size;

    return read_size;
}

//rb_ret_t sdk_ringbuffer_set(sdk_ringbuffer_t* buffer, uint32_t out_buffer_size, uint32_t* read_size){
//
////    uint32_t read_offset = buffer->read_offset;
//    uint32_t total_size = buffer->buffer_size;
////    uint32_t first_read_size = 0;
//    uint32_t size = (out_buffer_size > buffer->used_size)?buffer->used_size:out_buffer_size;
//
//    if(buffer->used_size==0){
//        *read_size = 0;
//        return kRB_RET_EEMPTY;
//    }
//
//    if(read_size) *read_size = size;
//
//    buffer->read_offset += size;
//    buffer->read_offset %= total_size;
//    buffer->used_size -= size;
//
//    return kRB_RET_OK;
//}


os_size_t sdk_ringbuffer_try_read(sdk_ringbuffer_t *buffer, int offset, uint8_t *buf, os_size_t buf_size) {


    if (RB_ISEMPTY(buffer)) {
        return 0;
    }

    os_size_t read_offset = buffer->read_offset + offset;
    os_size_t buffer_size = buffer->buffer_size;
    os_size_t used_size = RB_USED(buffer);
    os_size_t read_size = (buf_size > used_size) ? used_size : buf_size;
    uint8_t *block = buffer->buffer;

    if (!buf) return 0;

    if ((buffer_size - read_offset) >= read_size) {
        memcpy(buf, block + read_offset, read_size);
    } else {
        os_size_t first_read_size = buffer_size - read_offset;
        memcpy(buf, block + read_offset, first_read_size);
        memcpy(buf + first_read_size, block, read_size - first_read_size);
    }

    return read_size;
}

os_size_t sdk_ringbuffer_used(sdk_ringbuffer_t *buffer) {
    return RB_USED(buffer);
}

uint8_t sdk_ringbuffer_peek(sdk_ringbuffer_t *buffer, int idx) {
    uint32_t read_idx = buffer->read_offset;

    if (idx < 0) {
        read_idx = (read_idx + RB_USED(buffer) + idx) % buffer->buffer_size;
    } else {
        read_idx = (idx + read_idx) % buffer->buffer_size;
    }

    return buffer->buffer[read_idx];
}

int sdk_ringbuffer_is_full(sdk_ringbuffer_t *buffer) {
    uint32_t next_write_idx = buffer->write_offset + 1;
    if(next_write_idx>=buffer->buffer_size){
        next_write_idx = 0;
    }
    return (next_write_idx==buffer->read_offset);
}

int sdk_ringbuffer_is_empty(sdk_ringbuffer_t *buffer) {
    return RB_ISEMPTY(buffer);
}

int sdk_ringbuffer_find(sdk_ringbuffer_t* buffer, int offset, uint8_t* data, os_size_t data_size){
    int i;
    int a = 0;
    int b = 0;

    os_size_t buffer_size = sdk_ringbuffer_used(buffer);

    for(i=offset; i<buffer_size; i++){
        if(sdk_ringbuffer_peek(buffer, i)!=data[b]){
            continue;
        }
        /*找到了开始的数据*/
        a = i;
        while(1){
            if(b==data_size){
                return a;
            }
            if(sdk_ringbuffer_peek(buffer, i++) != data[b++]){
                break;
            }
        }
        b = 0;
    }
    return -1;
}

/* return find position, -1 otherwise*/
int sdk_ringbuffer_find_str(sdk_ringbuffer_t* ringbuffer, int offset, const char* string){
    return sdk_ringbuffer_find(ringbuffer, offset, (uint8_t*)string, strlen(string));
}

int sdk_ringbuffer_index(sdk_ringbuffer_t * ringbuffer, int index){
//    return (index + ringbuffer->read_offset) % ringbuffer->buffer_size;
    int offset = ringbuffer->read_offset + index;
    if(offset >= ringbuffer->buffer_size){
        offset -= ringbuffer->buffer_size;
    }
    return offset;
}

int sdk_ringbuffer_cut(sdk_ringbuffer_text_t * result,
                      sdk_ringbuffer_t * buffer, int start, int end,
                      const char* prefix, const char* postfix)
{
    int offset = start;
    result->start =0;
    result->end =0;

    size_t prefix_size = strlen(prefix);
    int prefix_pos = sdk_ringbuffer_find(buffer, offset, (uint8_t *)prefix, prefix_size);
    if(prefix_pos==-1){
        return -1;
    }
    int postfix_pos = sdk_ringbuffer_find_str(buffer, prefix_size + prefix_pos,  postfix);
    if(postfix_pos==-1){
        return -2;
    }

    if(postfix_pos>=end){
        return -3;
    }

    result->buffer = (sdk_ringbuffer_t*)buffer;
    result->start = sdk_ringbuffer_index(buffer, prefix_pos + prefix_size);
    result->end = sdk_ringbuffer_index(buffer, postfix_pos);

    return 0;
}

unsigned long sdk_ringbuffer_strtoul(sdk_ringbuffer_t* buffer, int offset, int* endptr, int base)
{
    int nptr;
    uint8_t c;
    uint8_t s;
    int neg=0;
    unsigned long cutoff;
    int cutlim;
    int any;
    int acc;

    nptr = offset;

    do {
        c = sdk_ringbuffer_peek(buffer, offset++);
    } while (isspace(c));

    if(c=='-'){
        neg = 1;
        c = sdk_ringbuffer_peek(buffer, offset++);
    }else if(c=='+'){
        c = sdk_ringbuffer_peek(buffer, offset++);
    }
    s = sdk_ringbuffer_peek(buffer, offset);
    if((base==0 || base==16) && c=='0' && (s =='x' || s=='X')){
        c = sdk_ringbuffer_peek(buffer, offset+1);
        offset+=2;
        base = 16;
    }
    if(base==0){
        base = (c=='0')?8:10;
    }
    cutoff = (unsigned long)ULONG_MAX/(unsigned long)base;
    cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;

    for(acc = 0, any = 0;; c = sdk_ringbuffer_peek(buffer, offset++)){
        if(isdigit(c)){
            c-='0';
        }
        else if(isalpha(c)){
            c-= isupper(c)?'A'-10:'a'-10;
        }else{
            break;
        }
        if(c>=base){
            break;
        }
        if(any < 0 || acc > cutoff || acc==cutoff && c>cutlim){
            any = -1;
        }else{
            any = 1;
            acc *= base;
            acc +=c;
        }
    }
    if(any<0){
        acc = ULONG_MAX;
    }else if(neg){
        acc = -acc;
    }
    if(endptr!=0){
        *endptr = (any?offset-1:nptr);
    }
    return (acc);
}

void sdk_ringbuffer_iter_init(sdk_ringbuffer_iter_t* iter, sdk_ringbuffer_text_t * text)
{
    iter->text = text;
    iter->start = text->start;
    iter->end = text->start;
}

// 0: success, -1: failed!
int sdk_ringbuffer_iter(sdk_ringbuffer_iter_t* iter, const char* token)
{
    int token_size = strlen(token);
    int find_start = (iter->end==iter->text->start)?iter->end:(iter->end + token_size);
    int find = sdk_ringbuffer_find_str(iter->text->buffer, find_start, token);
    int text_end = sdk_ringbuffer_index(iter->text->buffer, iter->text->end);

    if(find!=-1 && find<text_end){
        iter->start = find_start;
        iter->end = find;
        return 0;
    }else {
        int end = sdk_ringbuffer_index(iter->text->buffer, iter->end);
        if(end < text_end){
            /*虽然没有找到 token ，但是这时上次找到的划分区间的最后一块*/
            iter->start = iter->end+token_size;
            iter->end = text_end;
            return 0;
        }else{
            return -1;
        }
    }
}

unsigned long sdk_ringbuffer_iter_strtoul(sdk_ringbuffer_iter_t* iter, int base){
    return sdk_ringbuffer_strtoul(iter->text->buffer, iter->start, 0, base);
}

int sdk_ringbuffer_count(sdk_ringbuffer_t* ringbuffer, int start, int end, const char* token)
{
    os_size_t token_size = strlen(token);
    int count = 0;
    int find = 0;
    while((find= sdk_ringbuffer_find_str(ringbuffer, start, token))!=-1)
    {
        if(find>end){
            break;
        }
        count+=1;
        start = find + token_size;
    }
    return count;
}

os_size_t sdk_ringbuffer_memcpy(uint8_t * dst, sdk_ringbuffer_t* buffer, int offset, os_size_t size)
{
    uint8_t c;
//    rt_kprintf("buffer.write=%d, buffer.read=%d\n", buffer->write_offset, buffer->read_offset);
    os_size_t buffer_size = sdk_ringbuffer_used(buffer);
    os_size_t copy_size = buffer_size>size?size:buffer_size;
//    rt_kprintf("buffer_size: %d, copy_size:%d\n", buffer_size, copy_size);
    os_size_t i;
    for(i=0; i<copy_size; i++){
        c = sdk_ringbuffer_peek(buffer, (int)(i+offset));
        *dst++ = c;
    }
    return copy_size;
}

int sdk_ringbuffer_strcmp(sdk_ringbuffer_t* buffer, int offset, int end,  const char* str){
    int status = 0;
    uint8_t c=0;
    int i;
    char* p =(char*)str;
    for(i = offset; i< end; i++){
        c = sdk_ringbuffer_peek(buffer, i);
        if(c!=*p++){
            break;
        }
    }
    status = (c==*(p-1))?0:(c>*(p-1))?1:-1;
    return status;
}

int sdk_ringbuffer_pos(sdk_ringbuffer_t *buffer, int pos){
    int read_idx = 0;

    if (pos < 0) {
        read_idx = (read_idx + RB_USED(buffer) + pos) % buffer->buffer_size;
    } else {
        read_idx = (pos + read_idx) % buffer->buffer_size;
    }

    return read_idx;
}

void sdk_ringbuffer_set_read_offset(sdk_ringbuffer_t* buffer, int read_offset)
{
    buffer->read_offset = sdk_ringbuffer_pos(buffer, read_offset);
}

void sdk_ringbuffer_set_write_offset(sdk_ringbuffer_t* buffer, int write_offset)
{
    buffer->write_offset = sdk_ringbuffer_pos(buffer, write_offset);
}

uint32_t sdk_ringbuffer_read_uint32_be(sdk_ringbuffer_t* buffer)
{
    uint8_t d1;
    uint8_t d2;
    uint8_t d3;
    uint8_t d4;

    rb_ret_t err = sdk_ringbuffer_get(buffer, &d1);
    if(err!=kRB_RET_OK){
        return -1U;
    }
    err = sdk_ringbuffer_get(buffer, &d2);
    if(err!=kRB_RET_OK){
        return -1U;
    }
    err = sdk_ringbuffer_get(buffer, &d3);
    if(err!=kRB_RET_OK){
        return -1U;
    }
    err = sdk_ringbuffer_get(buffer, &d4);
    if(err!=kRB_RET_OK){
        return -1U;
    }


    return (((d1 & 0xFF)<<24) | ((d2 & 0xFF) << 16) | ((d3 & 0xFF) << 8) | (d4 & 0xFF));
}

uint16_t sdk_ringbuffer_read_uint16_le(sdk_ringbuffer_t* buffer)
{
    uint8_t d1;
    uint8_t d2;

    rb_ret_t err = sdk_ringbuffer_get(buffer, &d1);
    if(err!=kRB_RET_OK){
        return 0xFFFFU;
    }
    err = sdk_ringbuffer_get(buffer, &d2);
    if(err!=kRB_RET_OK){
        return 0xFFFFU;
    }

    return ((d1 & 0xFF) | ((d2 & 0xFF)<<8));

}

uint16_t sdk_ringbuffer_read_uint16_be(sdk_ringbuffer_t* buffer)
{
    uint8_t d1;
    uint8_t d2;

    rb_ret_t err = sdk_ringbuffer_get(buffer, &d1);
    if(err!=kRB_RET_OK){
        return 0xFFFFU;
    }
    err = sdk_ringbuffer_get(buffer, &d2);
    if(err!=kRB_RET_OK){
        return 0xFFFFU;
    }

    return (((d1 & 0xFF)<<8) | (d2 & 0xFF));
}
