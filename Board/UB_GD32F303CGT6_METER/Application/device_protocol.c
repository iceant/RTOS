#include <device_protocol.h>
#include <string.h>


void device_protocol_init(device_protocol_t* p)
{
    memset(p, 0, sizeof(*p));
    p->read_idx = 0;
    p->write_idx = 0;
    p->lines = 0;
}
