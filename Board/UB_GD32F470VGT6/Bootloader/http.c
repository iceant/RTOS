#include <http.h>
#include <A7670C.h>
////////////////////////////////////////////////////////////////////////////////
#define PAGE(T, SZ) (((T)+(SZ)-1)/(SZ))
#define PAGE_SIZE 1024

////////////////////////////////////////////////////////////////////////////////
int Http_Init(void)
{
    A7670C_HTTPINIT_Exec_Response HTTPINIT_Exec_Response;
    A7670C_Result result = A7670C_HTTPINIT_Exec(&HTTPINIT_Exec_Response, 12000);
    if(HTTPINIT_Exec_Response.code == kA7670C_Response_Code_OK){
        return HTTP_RET_OK;
    }

    return HTTP_RET_ERROR;
}

int Http_Destroy(void)
{
    A7670C_HTTPTERM_Exec_Response HTTPTERM_Exec_Response;
    A7670C_Result result = A7670C_HTTPTERM_Exec(&HTTPTERM_Exec_Response, 12000);
    if(kA7670C_Response_Code_OK==HTTPTERM_Exec_Response.code){
        return HTTP_RET_OK;
    }
    return HTTP_RET_ERROR;
}

int Http_Get(const char* url, void* data, size_t data_size, size_t offset, size_t* size, size_t* total_size)
{
    A7670C_HTTPPARA_Write_Response HTTPPARA_Write_Response;
    A7670C_Result result = A7670C_HTTPPARA_Write_URL(&HTTPPARA_Write_Response, url, 12000);
    if(kA7670C_Response_Code_OK!=HTTPPARA_Write_Response.code){
        return HTTP_RET_ERROR;
    }

#if 0
    result = A7670C_HTTPPARA_Write_READMODE(&HTTPPARA_Write_Response, 1, 12000);
	if(kA7670C_Response_Code_OK!=HTTPPARA_Write_Response.code){
		return HTTP_RET_ERROR;
	}
#endif

    A7670C_HTTPACTION_Write_Response HTTPACTION_Write_Response;
    result = A7670C_HTTPACTION_Write(&HTTPACTION_Write_Response, kA7670C_HTTPACTION_Method_GET, 12000);
    if(kA7670C_Response_Code_OK!=HTTPACTION_Write_Response.code){
        return HTTP_RET_ERROR;
    }

    if(HTTPACTION_Write_Response.data_length==-1){
        return HTTP_RET_ERROR;
    }

    if(HTTPACTION_Write_Response.status_code==404){
        return HTTP_RET_404;
    }

    if(HTTPACTION_Write_Response.status_code==500){
        return HTTP_RET_500;
    }

    if(total_size){
        *total_size = HTTPACTION_Write_Response.data_length;
    }

    A7670C_HTTPREAD_Write_Response HTTPREAD_Write_Response;
    HTTPREAD_Write_Response.data = data;
    HTTPREAD_Write_Response.data_len = data_size;

    result = A7670C_HTTPREAD_Write(&HTTPREAD_Write_Response, offset, data_size, 12000);
    if(kA7670C_Response_Code_OK!=HTTPREAD_Write_Response.code){
        return HTTP_RET_ERROR;
    }

    if(size){
        *size = HTTPREAD_Write_Response.data_len;
    }

    if(HTTPREAD_Write_Response.data_len!=0){
        return HTTP_RET_MORE;
    }

    return HTTP_RET_OK;
}

int Http_Post(const char* url, void* post_data, size_t post_data_size)
{
    return HTTP_RET_ERROR;
}

