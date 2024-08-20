# 协议包

| 字段    | 类型            | 说明                                                         |
| ------- | --------------- | ------------------------------------------------------------ |
| START   | BYTE[2]         | {0xBE, 0XEF}                                                 |
| DU_SIZE | BYTE[2]         | 大端格式                                                     |
| DU_TYPE | BYTE            | 0x00 - PRINT;  GD303 → GD470<br />0x01 - ECRC; GD303 → GD470 \| GD470 → GD303<br />0x02-DATETIME; GD470 → GD303<br />0x03-CPUID GD470 → GD303<br />0x04-CAN数据 GD303 → GD470 |
| DU      | BYTE[DU_SIZE-1] | 最大 4096 bytes                                              |
| CRC     | BYTE[2]         | Modbus CRC16 小端格式                                        |



# `0x00` PRINT

**功能**

GD303 向 GD470 发送 字符串，用于调试显示信息



# `0x01` CRC

**功能**

接收到的数据无法完成 CRC 认证，表示数据不正确，根据业务决定是否重发



# `0x02` DATETIME

**功能**

由 GD470 向 GD303 发送当前时间，每秒发送一次，用于记录数据采集时间和打包时间



# `0x03` CPUID

**功能**

由GD470 向 GD303 发送GD470 的 CPUID，数据打包时需要



# `0x04` CAN 

**功能**

由 GD303 向 GD470 发送采集的 CAN 数据包

