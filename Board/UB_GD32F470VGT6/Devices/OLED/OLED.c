#include <OLED.h>
#include <OLED_Font.h>
#include <stdio.h>
#include <assert.h>

////////////////////////////////////////////////////////////////////////////////
////
#define OLED_STATE_IDLE     (0)
#define OLED_STATE_READY    (1)
#define OLED_STATE_EIO      (-1)

////////////////////////////////////////////////////////////////////////////////
////
static OLED_IO_T * OLED__device;
static int OLED_State = OLED_STATE_IDLE;


////////////////////////////////////////////////////////////////////////////////
////

//OLED的显存
//存放格式如下.
//[0]0 1 2 3 ... 127
//[1]0 1 2 3 ... 127
//[2]0 1 2 3 ... 127
//[3]0 1 2 3 ... 127
//[4]0 1 2 3 ... 127
//[5]0 1 2 3 ... 127
//[6]0 1 2 3 ... 127
//[7]0 1 2 3 ... 127

////////////////////////////////////////////////////////////////////////////////
////

//-----------------OLED IIC端口定义----------------
#if 0
#define OLED_SCLK_Clr() GPIO_ResetBits(GPIOB,GPIO_PIN_8)//SCL
#define OLED_SCLK_Set() GPIO_SetBits(GPIOB,GPIO_PIN_8)

#define OLED_SDIN_Clr() GPIO_ResetBits(GPIOB,GPIO_PIN_9)//SDA
#define OLED_SDIN_Set() GPIO_SetBits(GPIOB,GPIO_PIN_9)

void IIC_Start(void){
    OLED_SCLK_Set();
    OLED_SDIN_Set();
    OLED_SDIN_Clr();
    OLED_SCLK_Clr();
}

void IIC_Stop(void)
{
    OLED_SCLK_Set() ;
//	OLED_SCLK_Clr();
    OLED_SDIN_Clr();
    OLED_SDIN_Set();
}


void IIC_Wait_Ack()
{

    //GPIOB->CRH &= 0XFFF0FFFF;	//设置PB12为上拉输入模式
    //GPIOB->CRH |= 0x00080000;
//	OLED_SDA = 1;
//	delay_us(1);
    //OLED_SCL = 1;
    //delay_us(50000);
/*	while(1)
	{
		if(!OLED_SDA)				//判断是否接收到OLED 应答信号
		{
			//GPIOB->CRH &= 0XFFF0FFFF;	//设置PB12为通用推免输出模式
			//GPIOB->CRH |= 0x00030000;
			return;
		}
	}
*/
    OLED_SCLK_Set() ;
    OLED_SCLK_Clr();
}


////////////////////////////////////////////////////////////////////////////////
////

/**********************************************
// IIC Write byte
**********************************************/

void Write_IIC_Byte(unsigned char IIC_Byte)
{
    unsigned char i;
    unsigned char m,da;
    da=IIC_Byte;
    OLED_SCLK_Clr();
    for(i=0;i<8;i++)
    {
        m=da;
        //	OLED_SCLK_Clr();
        m=m&0x80;
        if(m==0x80)
        {OLED_SDIN_Set();}
        else OLED_SDIN_Clr();
        da=da<<1;
        OLED_SCLK_Set();
        OLED_SCLK_Clr();
    }
}
#endif

/**********************************************
// IIC Write Command
**********************************************/
void Write_IIC_Command(unsigned char IIC_Command)
{
//    IIC_Start();
//    Write_IIC_Byte(OLED_ADDRESS);            //Slave address,SA0=0
//    IIC_Wait_Ack();
//    Write_IIC_Byte(0x00);			//write command
//    IIC_Wait_Ack();
//    Write_IIC_Byte(IIC_Command);
//    IIC_Wait_Ack();
//    IIC_Stop();
//    uint8_t data[]={0x00, IIC_Command};
    int err = OLED__device->send(OLED_ADDRESS, 0x00, &IIC_Command, 1);
    if(err<0){
        OLED_State = OLED_STATE_EIO;
        printf("OLED Write CMD 0x%02X Failed! Err=%d\n", IIC_Command, err);
    }
}

/**********************************************
// IIC Write Data
**********************************************/
void Write_IIC_Data(unsigned char IIC_Data)
{
//    IIC_Start();
//    Write_IIC_Byte(OLED_ADDRESS);			//D/C#=0; R/W#=0
//    IIC_Wait_Ack();
//    Write_IIC_Byte(0x40);			//write data
//    IIC_Wait_Ack();
//    Write_IIC_Byte(IIC_Data);
//    IIC_Wait_Ack();
//    IIC_Stop();
//    uint8_t data[]={0x40, IIC_Data};
//    int err = OLED__device->send(OLED_ADDRESS, data, 2);
    int err = OLED__device->send(OLED_ADDRESS, 0x40, &IIC_Data, 1);
    if(err<0){
        OLED_State = OLED_STATE_EIO;
        printf("OLED Write Data 0x%02X Failed! Err=%d\n", IIC_Data, err);
    }
}

void OLED_WR_Byte(unsigned dat,unsigned cmd)
{
    if(cmd)
    {
        Write_IIC_Data(dat);
    }
    else {
        Write_IIC_Command(dat);
    }
}


/********************************************
// fill_Picture
********************************************/
void fill_picture(unsigned char fill_Data)
{
    if(OLED_State!=OLED_STATE_READY) return;

    unsigned char m,n;
    for(m=0;m<8;m++)
    {
        OLED_WR_Byte(0xb0+m,OLED_CMD);		//page0-page1
        OLED_WR_Byte(0x02,OLED_CMD);		//low column start address
        OLED_WR_Byte(0x10,OLED_CMD);		//high column start address
        for(n=0;n<128;n++)
        {
            OLED_WR_Byte(fill_Data,OLED_DATA);
        }
    }
}

/***********************Delay****************************************/
void Delay_50ms(unsigned int Del_50ms)
{
    unsigned int m;
    for(;Del_50ms>0;Del_50ms--)
        for(m=6245;m>0;m--);
}


void Delay_1ms(unsigned int Del_1ms)
{
    unsigned char j;
    while(Del_1ms--)
    {
        for(j=0;j<123;j++);
    }
}


//坐标设置

void OLED_Set_Pos(unsigned char x, unsigned char y)
{
#if defined(ENABLE_OLED)
    if(OLED_State!=OLED_STATE_READY) return;
    OLED_WR_Byte(0xb0+y,OLED_CMD);
    OLED_WR_Byte((((x+2)&0xf0)>>4)|0x10,OLED_CMD);
    OLED_WR_Byte(((x+2)&0x0f),OLED_CMD);
#endif
}

//开启OLED显示
void OLED_Display_On(void)
{
#if defined(ENABLE_OLED)
    OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
    OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
    OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
    if(OLED_State!=OLED_STATE_EIO){
        OLED_State=OLED_STATE_READY;
    }
#endif
}


//关闭OLED显示
void OLED_Display_Off(void)
{
#if defined(ENABLE_OLED)
    if(OLED_State!=OLED_STATE_READY) return;
    OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
    OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
    OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
#endif
}

//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!
void OLED_Clear(void)
{
#if defined(ENABLE_OLED)
    if(OLED_State!=OLED_STATE_READY) return;
    uint8_t i,n;
    for(i=0;i<8;i++)
    {
        OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
        OLED_WR_Byte (0x02,OLED_CMD);      //设置显示位置—列低地址
        OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
        for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
    } //更新显示
#endif
}

void OLED_On(void)
{
#if defined(ENABLE_OLED)
    if(OLED_State!=OLED_STATE_READY) return;
    uint8_t i,n;
    for(i=0;i<8;i++)
    {
        OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
        OLED_WR_Byte (0x02,OLED_CMD);      //设置显示位置—列低地址
        OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
        for(n=0;n<128;n++)OLED_WR_Byte(1,OLED_DATA);
    } //更新显示
#endif
}

//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63
//mode:0,反白显示;1,正常显示
//size:选择字体 16/12
void OLED_ShowChar(uint8_t x,uint8_t y,uint8_t chr,uint8_t Char_Size)
{
#if defined(ENABLE_OLED)
    if(OLED_State!=OLED_STATE_READY) return;
    unsigned char c=0,i=0;
    c=chr-' ';//得到偏移后的值
    if(x>Max_Column-1){x=0;y=y+2;}
    if(Char_Size==16)
    {
        OLED_Set_Pos(x,y);
        for(i=0;i<8;i++) {
            OLED_WR_Byte(F8X16[c * 16 + i], OLED_DATA);
        }
        OLED_Set_Pos(x,y+1);
        for(i=0;i<8;i++) {
            OLED_WR_Byte(F8X16[c * 16 + i + 8], OLED_DATA);
        }
    }
    else {
        OLED_Set_Pos(x,y);
        for(i=0;i<6;i++) {
            OLED_WR_Byte(F6x8[c][i], OLED_DATA);
        }
    }
#endif
}

//m^n函数
uint32_t oled_pow(uint8_t m,uint8_t n)
{
    uint32_t result=1;
    while(n--)result*=m;
    return result;
}

//显示2个数字
//x,y :起点坐标
//len :数字的位数
//size:字体大小
//mode:模式	0,填充模式;1,叠加模式
//num:数值(0~4294967295);
void OLED_ShowNum(uint8_t x,uint8_t y,uint32_t num,uint8_t len,uint8_t size2)
{
    uint8_t t,temp;
    uint8_t enshow=0;
    for(t=0;t<len;t++)
    {
        temp=(num/oled_pow(10,len-t-1))%10;
        if(enshow==0&&t<(len-1))
        {
            if(temp==0)
            {
                OLED_ShowChar(x+(size2/2)*t,y,' ',size2);
                continue;
            }else enshow=1;

        }
        OLED_ShowChar(x+(size2/2)*t,y,temp+'0',size2);
    }
}
//显示一个字符号串
void OLED_ShowString(uint8_t x,uint8_t y,uint8_t *chr,uint8_t Char_Size)
{
#if defined(ENABLE_OLED)
    if(OLED_State!=OLED_STATE_READY) return;
    unsigned char j=0;
    while (chr[j]!='\0')
    {
        OLED_ShowChar(x,y,chr[j],Char_Size);
        x+=6;
        if(x>120){x=0;y+=1;}
        if(y>8){y=0;}
        j++;
    }
#endif
}
//显示汉字
void OLED_ShowChinese(uint8_t x,uint8_t y,uint8_t no)
{
    uint8_t t,adder=0;
    OLED_Set_Pos(x,y);
    for(t=0;t<16;t++)
    {
        OLED_WR_Byte(Hzk[2*no][t],OLED_DATA);
        adder+=1;
    }
    OLED_Set_Pos(x,y+1);
    for(t=0;t<16;t++)
    {
        OLED_WR_Byte(Hzk[2*no+1][t],OLED_DATA);
        adder+=1;
    }
}
/***********功能描述：显示显示BMP图片128×64起始点坐标(x,y),x的范围0～127，y为页的范围0～7*****************/
void OLED_DrawBMP(unsigned char x0, unsigned char y0,unsigned char x1, unsigned char y1,unsigned char BMP[])
{
    unsigned int j=0;
    unsigned char x,y;

    if(y1%8==0) y=y1/8;
    else y=y1/8+1;
    for(y=y0;y<y1;y++)
    {
        OLED_Set_Pos(x0,y);
        for(x=x0;x<x1;x++)
        {
            OLED_WR_Byte(BMP[j++],OLED_DATA);
        }
    }
}

//初始化SSD1306
void OLED_Init(OLED_IO_T * device)
{
    OLED__device = device;
    OLED_State = OLED_STATE_IDLE;
}

void OLED_TurnOn(void){
    
    OLED_WR_Byte(0xAE,OLED_CMD);//--display off
    OLED_WR_Byte(0x02,OLED_CMD);//---set low column address
    OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
    OLED_WR_Byte(0x40,OLED_CMD);//--set start line address
    OLED_WR_Byte(0xB0,OLED_CMD);//--set page address
    OLED_WR_Byte(0x81,OLED_CMD); // contract control
    OLED_WR_Byte(0xFF,OLED_CMD);//--128
    OLED_WR_Byte(0xA1,OLED_CMD);//set segment remap
    OLED_WR_Byte(0xA6,OLED_CMD);//--normal / reverse
    OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
    OLED_WR_Byte(0x3F,OLED_CMD);//--1/32 duty
    OLED_WR_Byte(0xC8,OLED_CMD);//Com scan direction
    OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset
    OLED_WR_Byte(0x00,OLED_CMD);//
    
    OLED_WR_Byte(0xD5,OLED_CMD);//set osc division
    OLED_WR_Byte(0x80,OLED_CMD);//
    
    OLED_WR_Byte(0xD8,OLED_CMD);//set area color mode off
    OLED_WR_Byte(0x05,OLED_CMD);//
    
    OLED_WR_Byte(0xD9,OLED_CMD);//Set Pre-Charge Period
    OLED_WR_Byte(0xF1,OLED_CMD);//
    
    OLED_WR_Byte(0xDA,OLED_CMD);//set com pin configuartion
    OLED_WR_Byte(0x12,OLED_CMD);//
    
    OLED_WR_Byte(0xDB,OLED_CMD);//set Vcomh
    OLED_WR_Byte(0x30,OLED_CMD);//
    
    OLED_WR_Byte(0x8D,OLED_CMD);//set charge pump enable
    OLED_WR_Byte(0x14,OLED_CMD);//
    
    OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel

    if(OLED_State!=OLED_STATE_EIO){
        OLED_State=OLED_STATE_READY;
    }

    OLED_Clear();
}




