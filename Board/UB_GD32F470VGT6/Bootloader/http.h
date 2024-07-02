#ifndef INCLUDED_HTTP_H
#define INCLUDED_HTTP_H

////////////////////////////////////////////////////////////////////////////////
#include <A7670C.h>

////////////////////////////////////////////////////////////////////////////////
#define HTTP_RET_OK 		0
#define HTTP_RET_ERROR 	(-1)
#define HTTP_RET_MORE 	(-2)
#define HTTP_RET_404    (404)
#define HTTP_RET_500    (500)

////////////////////////////////////////////////////////////////////////////////
int Http_Init(void);

int Http_Destroy(void);

int Http_Get(const char* url, void* data, size_t data_size, size_t offset, size_t* size, size_t* total_size);

int Http_Post(const char* url, void* post_data, size_t post_data_size);


#endif /*INCLUDED_HTTP_H*/
