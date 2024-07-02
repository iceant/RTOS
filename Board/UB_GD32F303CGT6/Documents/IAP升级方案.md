# 固件类型
- MCU0_BOOT - GD32F407 Bootloader
- MCU0_APP  - GD32F407 Application
- MCU1_BOOT - GD32F303 Bootloader
- MCU1_APP  - GD32F303 Application

# `upgrade.json` 文件格式
- 文件存储在服务器 `[base]/Devices/[CPUID]/upgrade.json`
- `v`: 版本
- `s`:文件大小
- `md5`: 文件 md5 校验码
- `url`: 下载地址

## 示例
```json
{
  "model":"DC_METER", 
  "MCU0_APP":{
    "v":2024070101, 
    "s":63840, 
    "md5":"45fbac613fe4541da8da08bc58a38df5",
    "url":"http://ubattery.cn:19093/Devices/3601115052335637350f2020/MCU0_APP.bin"
  }, 
  "MCU3_APP":{
    "v":2024070101, 
    "s":35868, 
    "md5":"1866742157c784a9b5c7b7d36ae4301e",
    "url":"http://ubattery.cn:19093/Devices/3601115052335637350f2020/MCU3_APP.bin"}
}
```

## MCU0_BOOT 升级处理流程

- 系统启动时，会先进入 `MCU0_BOOT`, 这时会对是否有升级包信息进行检查，检查的原理如下:
  - [x] 网络连接成功
  - [x] 访问 http://ubattery.cn:19093/Devices/[CPUID]/upgrade.json
  - [x] 下载固件
    - 将之前下载区的固件保存到备份区
    - 然后执行下载
    - 保存头部信息
    ```c
    struct firmware_header{
        uint32_t    version;
        uint8_t     md5[16];
        uint8_t     state;          /* 1: Need Upgrade, 2:Install Success, 3:Install Failed */
        uint32_t    data_size;
    };
    ```
  - [x] 并进行校验, 固件保存在外部 flash 中
  - [x] 是否有 `MCU0_APP` 需要升级，如果有，直接写入 `MCU0_APP` 在 MCU0 中的 Flash 地址
  - [x] 检查是否有 `MCU1_BOOT` 或者 `MCU0_BOOT` 需要升级，如果有，执行对应的升级流程
  - [x] 如果需要升级 `MCU0_BOOT`，做好标记，然后跳转到 `MCU0_APP` 由 `MCU0_APP` 来执行 `MCU0_BOOT` 的升级流程
  

## MCU0_APP 升级处理流程
1. 启动时检查 `MCU0_BOOT` 是否需要升级, 
   - 如果 `MCU0_BOOT` 有升级标识需要升级, 启动 `MCU0_BOOT` 升级流程
   - 将数据从下载区写入 `MCU0_BOOT` 的 Flash 区
   - 重启，进入`MCU0_BOOT`, `MCU0_BOOT` 会跳转回 `MCU0_APP`
2. 没有需要升级的情况，直接进入 APP 运行 

## MCU1_BOOT 升级流程


## MCU1_APP 升级流程


