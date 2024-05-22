#include <sdk_hex.h>

extern int printf(const char* fmt, ...);

void sdk_hex_dump(const char* name, const void* data, int size) {
    if(name){
        printf("-- DUMP: %s --\n", name);
    }
    char ascii[17];
    size_t i, j;
    ascii[16] = '\0';
    for (i = 0; i < size; ++i) {
        printf("%02X ", ((unsigned char*)data)[i]);
        if (((unsigned char*)data)[i] >= ' ' && ((unsigned char*)data)[i] <= '~') {
            ascii[i % 16] = ((unsigned char*)data)[i];
        } else {
            ascii[i % 16] = '.';
        }
        if ((i+1) % 8 == 0 || i+1 == size) {
            printf(" ");
            if ((i+1) % 16 == 0) {
                printf("|  %s \n", ascii);
            } else if (i+1 == size) {
                ascii[(i+1) % 16] = '\0';
                if ((i+1) % 16 <= 8) {
                    printf(" ");
                }
                for (j = (i+1) % 16; j < 16; ++j) {
                    printf("   ");
                }
                printf("|  %s \n", ascii);
            }
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
////
#define MIN(A, B) ((A)>(B)?(B):(A))

os_size_t sdk_hex_encode(char* buffer, uint32_t offset, os_size_t buffer_size, const uint8_t *data, os_size_t data_offset, os_size_t data_size, os_bool_t isUpperCase, sdk_byteorder_t byteOrder)
{
    os_size_t i;
    os_size_t index;

    static const uint8_t LOOKUP_TABLE_LOWER[] = {0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66};
    static const uint8_t LOOKUP_TABLE_UPPER[] = {0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46};

    os_size_t size = MIN(buffer_size/2, data_size);
    os_size_t result_size = MIN(buffer_size-1, size*2);

    const uint8_t* lookup = isUpperCase?LOOKUP_TABLE_UPPER:LOOKUP_TABLE_LOWER;

    for(i =0; i<size; i++){
        index = (byteOrder==kSDK_ByteOrder_BigEndian)?i:(size-i-1);
        buffer[offset + (i<<1)] = lookup[(data[data_offset + index] >> 4) & 0x0F];
        buffer[offset + (i<<1) + 1] = lookup[(data[data_offset + index] & 0x0F)];
    }

    buffer[result_size] = '\0';

    return result_size;
}

os_size_t sdk_hex_decode(uint8_t *buffer, os_size_t buffer_offset, os_size_t buffer_size, const char* hex, os_size_t hex_offset, os_size_t hex_size){
    uint8_t b1, b2;

    static const unsigned char TBL[] = {
            0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  58,  59,  60,  61,
            62,  63,  64,  10,  11,  12,  13,  14,  15,  71,  72,  73,  74,  75,
            76,  77,  78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,
            90,  91,  92,  93,  94,  95,  96,  10,  11,  12,  13,  14,  15
    };
    static const unsigned char *LOOKUP = TBL - 48;

    os_size_t size = MIN(buffer_size*2, hex_size);

    const char* in = hex + hex_offset;
    const char* end = in + size;
    while(in < end){
        b1 = LOOKUP[*(in++)];
        b2 = LOOKUP[*(in++)];
        *(buffer++) = ( b1 << 4) | b2;
    }

    return size/2;
}


