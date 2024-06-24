# 协议包

| 字段    | 类型            | 说明                                                         |
| ------- | --------------- | ------------------------------------------------------------ |
| START   | BYTE[2]         | {0xBE, 0XEF}                                                 |
| DU_SIZE | BYTE[2]         | 大端格式                                                     |
| DU_TYPE | BYTE            | 0x00 - PRINT;  GD303 → GD470<br />0x01 - ECRC; GD303 → GD470 \| GD470 → GD303<br />0x02-DATETIME; GD470 → GD303<br />0x03-CPUID GD470 → GD303<br />0x04-CAN数据 GD303 → GD470<br />0xD0 - RECEIVED 数据接收完成<br />0xDE - 数据接收错误，需要重发 |
| DU      | BYTE[DU_SIZE-1] | 最大 4096 bytes                                              |
| CRC     | BYTE[2]         | Modbus CRC16 小端格式                                        |



# `0x00` PRINT

**功能**

GD303 向 GD470 发送 字符串，用于调试显示信息



# `0x01` CRC

**功能**

接收到的数据无法完成 CRC 认证，表示数据不正确，根据业务决定是否重发



