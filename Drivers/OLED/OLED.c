#include <OLED.h>
#include <OLED_Font.h>
#include <drv_i2c.h>
#include <stdio.h>
#include <assert.h>

static volatile drv_i2c_t* OLED__device;

////////////////////////////////////////////////////////////////////////////////
////
static volatile int OLED_Startup_Flag = 0;
static OLED_Result OLED_Startup(void){
    OLED_Result result;

    if(OLED_Startup_Flag==1){
        return kOLED_Result_ERROR;
    }
    OLED_Startup_Flag = 1;

__startup:
    __NOP();__NOP();__NOP();__NOP();__NOP();
    result = OLED_WriteCommand(0xAE);    //关闭显示
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0xD5);    //设置显示时钟分频比/振荡器频率
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0x80);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xA8);    //设置多路复用率
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0x1F);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xD3);    //设置显示偏移
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0x00);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0x40);    //设置显示开始行
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xA1);    //设置左右方向，0xA1正常 0xA0左右反置
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xC8);    //设置上下方向，0xC8正常 0xC0上下反置
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xDA);    //设置COM引脚硬件配置
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0x02);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0x81);    //设置对比度控制
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0x10);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xD9);    //设置预充电周期
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0xF1);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0xDB);    //设置VCOMH取消选择级别
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result = OLED_WriteCommand(0x49);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }


    result = OLED_WriteCommand(0xA6);    //设置正常/倒转显示
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    result = OLED_WriteCommand(0x8D);    //设置充电泵
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    result =OLED_WriteCommand(0x14);
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    
    
    result = OLED_WriteCommand(0xA4);    //设置整个显示打开/关闭
    if(result!=kOLED_Result_OK){
        goto __startup;
    }
    
    result = OLED_WriteCommand(0xAF);    //开启显示
    if(result!=kOLED_Result_OK){
        goto __startup;
    }

    OLED_Startup_Flag = 0;
    return kOLED_Result_OK;
}


////////////////////////////////////////////////////////////////////////////////
////

OLED_Result OLED_Init(drv_i2c_t* device){
    OLED__device = device;
    OLED_Startup();
    return OLED_Clear();
}

OLED_Result OLED_WriteCommand(uint8_t command){
    uint8_t array[2]={0x00, command};
    int err = drv_i2c_write(OLED__device, OLED_ADDRESS,  array, 2, I2C_LONG_TIMEOUT);
    if(err!=DRV_I2C_RET_OK){
        printf("OLED_WriteCommand: %02X, err=%d\n", command, err);
        OLED_Startup();
        return kOLED_Result_ERROR;
    }
    return kOLED_Result_OK;
}

OLED_Result OLED_WriteData(uint8_t data)
{
    uint8_t array[]={0x40, data};
    int err = drv_i2c_write(OLED__device, OLED_ADDRESS, array, 2, I2C_LONG_TIMEOUT);
    if(err!=DRV_I2C_RET_OK){
        printf("OLED_WriteData: %02X, err=%d\n", data, err);
        OLED_Startup();
        return kOLED_Result_ERROR;
    }
    return kOLED_Result_OK;
}


/**
  * @brief  OLED设置光标位置
  * @param  X 以左上角为原点，向右方向的坐标，范围：0~127
  * @param  Y 以左上角为原点，向下方向的坐标，范围：0~7
  * @retval 无
  */
OLED_Result OLED_SetCursor(uint8_t x, uint8_t y){
    OLED_Result result = kOLED_Result_ERROR;
    result = OLED_WriteCommand(0xB0|y);
    if(result!=kOLED_Result_OK){
        return result;
    }
    result = OLED_WriteCommand(0x10 | ((x&0xF0)>>4));
    if(result!=kOLED_Result_OK){
        return result;
    }
    result = OLED_WriteCommand(0x00 | (x&0x0F));
    if(result!=kOLED_Result_OK){
        return result;
    }
    return result;
}

OLED_Result OLED_Clear(void)
{
    OLED_Result result;
    uint8_t i, j;
    for (j = 0; j < 8; j++)
    {
        result = OLED_SetCursor(0, j);
        if(result!=kOLED_Result_OK){
            return result;
        }
        for(i = 0; i < 128; i++)
        {
            result = OLED_WriteData(0x00);
            if(result!=kOLED_Result_OK){
                return result;
            }
        }
    }
    return kOLED_Result_OK;
}

/**
  * @brief  OLED显示一个字符
  * @param  x 列位置，范围：1~16
  * @param  y 行位置，范围：1~4
  * @param  Char 要显示的一个字符，范围：ASCII可见字符
  * @retval 无
  */
OLED_Result OLED_ShowChar(uint8_t x, uint8_t y, char Char)
{
    OLED_Result result;
#if (FONT_SIZE==16)
    uint8_t i;
    char ch = Char - ' ';
    result = OLED_SetCursor((x - 1) * 8, (y-1) );		//设置光标位置在上半部分
    if(result!=kOLED_Result_OK){
        return result;
    }
    for (i = 0; i < 8; i++)
    {
        result = OLED_WriteData(F8X16[ch*16+i]);			//显示上半部分内容
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
    result = OLED_SetCursor((x - 1) * 8, (y-1) + 1);	//设置光标位置在下半部分
    if(result!=kOLED_Result_OK){
        return result;
    }
    for (i = 0; i < 8; i++)
    {
        result = OLED_WriteData(F8X16[ch*16 + i + 8]);		//显示下半部分内容
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
#endif

#if (FONT_SIZE==8)
    uint8_t i;
    char ch = Char - ' ';
    result = OLED_SetCursor((x-1)*6, (y-1));		//设置光标位置
    if(result!=kOLED_Result_OK){
        return result;
    }
    for (i = 0; i < 6; i++)
    {
        result = OLED_WriteData(F6x8[ch][i]);			//显示内容
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
#endif
    return kOLED_Result_OK;
}

/**
  * @brief  OLED显示字符串
  * @param  x 起始列位置，范围：1~16
  * @param  y 起始行位置，范围：1~4
  * @param  String 要显示的字符串，范围：ASCII可见字符
  * @retval 无
  */
OLED_Result OLED_ShowString(uint8_t x, uint8_t y, char* string)
{
    OLED_Result result;
    uint8_t i;
    char* p = string;
    for (i = 0; *p!='\0'; i++)
    {
        result = OLED_ShowChar(x + i, y, *p++);
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
    return kOLED_Result_OK;
}


/**
  * @brief  OLED次方函数
  * @retval 返回值等于X的Y次方
**/
uint32_t OLED_Pow(uint32_t x, uint32_t y)
{
    uint32_t Result = 1;
    while (y--)
    {
        Result *= x;
    }
    return Result;
    
}

OLED_Result OLED_ShowNum(uint8_t x, uint8_t y, uint32_t number, uint8_t length)
{
#if 1
    OLED_Result result;
    uint8_t i;
    for (i = 0; i < length; i++)
    {
        result = OLED_ShowChar(x + i, y, number / OLED_Pow(10, length - i - 1) % 10 + '0');
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
    return kOLED_Result_OK;
#endif

#if 0
    uint8_t t,temp;
    uint8_t enshow=0;
    int size2 = FONT_SIZE;
    for(t=0;t<length;t++)
    {
        temp=(number/OLED_Pow(10,length-t-1))%10;
        if(enshow==0&&t<(length-1))
        {
            if(temp==0)
            {
                OLED_ShowChar(x+(size2/2)*t,y,' ');
                continue;
            }else enshow=1;

        }
        OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
    }
#endif
}

OLED_Result OLED_ShowSignedNum(uint8_t x, uint8_t y, int32_t  number, uint8_t length)
{
    OLED_Result result;
    uint8_t i;
    uint32_t Number1;
    if (number >= 0)
    {
        result = OLED_ShowChar(x, y, '+');
        if(result!=kOLED_Result_OK){
            return result;
        }
        Number1 = number;
    }
    else
    {
        result = OLED_ShowChar(x, y, '-');
        if(result!=kOLED_Result_OK){
            return result;
        }
        Number1 = -number;
    }
    for (i = 0; i < length; i++)
    {
        result = OLED_ShowChar(x + i + 1, y, Number1 / OLED_Pow(10, length - i - 1) % 10 + '0');
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
    return kOLED_Result_OK;
}

OLED_Result OLED_ShowHexNum(uint8_t x, uint8_t y, uint32_t number, uint8_t length)
{
    OLED_Result result;
    uint8_t i, SingleNumber;
    for (i = 0; i < length; i++)
    {
        SingleNumber = number / OLED_Pow(16, length - i - 1) % 16;
        if (SingleNumber < 10)
        {
            result = OLED_ShowChar(x + i, y, SingleNumber + '0');
            if(result!=kOLED_Result_OK){
                return result;
            }
        }
        else
        {
            result = OLED_ShowChar(x + i, y, SingleNumber - 10 + 'A');
            if(result!=kOLED_Result_OK){
                return result;
            }
        }
    }
}

OLED_Result OLED_ShowBinNum(uint8_t x, uint8_t y, uint32_t number, uint8_t length)
{
    OLED_Result result;
    uint8_t i;
    for (i = 0; i < length; i++)
    {
        result = OLED_ShowChar(x + i, y, number / OLED_Pow(2, length - i - 1) % 2 + '0');
        if(result!=kOLED_Result_OK){
            return result;
        }
    }
}
//
//void OLED_ShowGBK(u8 x, u8 y,  u8 num, u8 size,u8 mode)
//{
//    u8 temp,t,t1;
//    u8 y0=y;
//    //u8 size = 16;
//    u8 csize=(size/8 + ((size%8)?1:0)) * size;     //得到字体一个字符对应点阵集所占的字节数
//
//    for(t=0;t<csize;t++)
//    {
//        //  我只定义了16，12号字体   没有声明其他字体
//        if(size==12)      temp =gbk_1212[num][t];    //调用1212字体
//        else if(size==16) temp = gbk_1616[num][t];    //调用1616字体
////      else if(size==24)temp=asc2_2412[chr][t];    //调用2412字体
//        else return;                                //没有的字库
//        for(t1=0;t1<8;t1++)
//        {
//            if(temp&0x80)OLED_DrawPoint(x,y,mode);
//            else OLED_DrawPoint(x,y,!mode);
//            temp<<=1;
//            y++;
//            if((y-y0)==size)
//            {
//                y=y0;
//                x++;
//                break;
//            }
//        }
//    }
//}

/**
  * @brief  OLED显示浮点数字（十进制，带符号数）
  * @param  Line 起始行位置，范围：1~4
  * @param  Column 起始列位置，范围：1~16
  * @param  Number 要显示的数字
  * @param  Length 要显示数字的长度，范围：1~10
  * @param  Flength 要显示的小数点后几位
  * @retval 无
  */
void OLED_ShowFloat(uint8_t Column, uint8_t Line, float Number, uint8_t Length, uint8_t Flength)
{
    uint8_t i;
    uint32_t Number2;
    float Number1;
    uint8_t flag = 1;

    if (Number >= 0)
    {
        Number1 = Number;
        OLED_ShowChar(Column, Line, '+');
    }
    else
    {
        Number1 = -Number;
        OLED_ShowChar(Column, Line, '-');
    }
    //将浮点数转换成整数然后显示
    Number2 = (int)(Number1 * OLED_Pow(10,Flength));

    for (i = Length; i > 0; i--)
    {
        if(i == (Length - Flength))
        {
            OLED_ShowChar(Column + i + flag, Line, '.');
            flag = 0;
            OLED_ShowChar(Column + i + flag, Line, Number2 / OLED_Pow(10, Length - i) % 10 + '0');
        }
        else
        {
            OLED_ShowChar(Column + i + flag, Line,  Number2 / OLED_Pow(10, Length - i) % 10 + '0');
        }
    }
}