# NXP SDMMC driver
The SDMMC driver provides a generic driver for the Secure Digital Card(SDCARD), Embedded MultiMedia Card(EMMC/MMC PLUS) and Secure Digital IO Card(SDIO), which are targets to support the application based on NXP's micro-controller, but not limited to NXP's SoC, as it is easy to port to any platform based on arm core controller.

## SDMMC driver license
This project is under BSD-3-Clause license, license copy please check [COPYING_BSD-3](COPYING-BSD-3).

## SDMMC driver features

### Secure Digital Memory Card(SDCARD)
###### The SDCARD driver
- is compliant with SD V3.0 specification and compatible with legacy SD version;
- has added mutual exclusive access support for init/deinit/write/read/erase function;
- provides detailed runtime log information for debug purpose if the functionality is enabled;
- supports SD/SPI interface. SPI interface SD driver supports SD V2.0 only.

### Embedded MultiMedia Card(EMMC/MMC PLUS CARD)
###### The EMMC/MMC PLUS CARD driver
- is compliant with MMC V5.0 specification and compatible with legacy MMC version;
- has added mutual exclusive access support for init/deinit/write/read/erase function;
- provides detailed runtime log information for debug purpose if the functionality is enabled;

### Secure Digital IO Card(SDIO CARD)
###### The SDIO CARD driver
- is compliant with SD/SDIO V3.0 specification and compatible with legacy SD version;
- has added mutual exclusive access support for init/deinit/write/read/erase function;
- provides detailed runtime log information for debug purpose if the functionality is enabled.

> Note
> For the 3 cards mentioned above, the init function will create the mutex lock dynamically by default.
To avoiding redundant mutex being created, application must follow the sequence described in section below for card re-initialization,
        xxx_Init
        xxx_Deinit
        xxx_Init

## SDMMC driver organization
```
├─common
├─host
│  ├─sdhc
│  │  ├─blocking
│  │  └─non_blocking
│  ├─sdif
│  │  ├─blocking
│  │  └─non_blocking
│  └─usdhc
│      ├─blocking
│      └─non_blocking
├─mmc
├─osa
├─sd
├─sdio
├─sdspi
```
>Note
>OSA layer provides event/mutex/delay functional for sdmmc driver and host driver, it depends on MCUX SDK OSA component which can adapt to baremetal or rtos.

## How to use the driver
### Secure Digital Memory Card(SDCARD)
```c
SD_Init(card);
SD_WriteBlocks(card, buffer, startBlock, blockCount);
SD_ReadBlocks(card, buffer, startBlock, blockCount);
SD_EraseBlocks(card, startBlock, blockCount);
```
```c
SD_CardInit(card);
SD_WriteBlocks(card, buffer, startBlock, blockCount);
SD_ReadBlocks(card, buffer, startBlock, blockCount);
SD_EraseBlocks(card, startBlock, blockCount);
```
>Note
>+ The difference between SD_Init and SD_CardInit is that SD_Init function will initialize the host controller and poll the card insert status.
>+ The sdcard read/write function supports non-WORD align buffer address transfer. If application clears the flag noInteralAlign(in card descriptor sd_card_t), the driver will spilt it into several small WORD align transfer pieces.
>+ The sdcard driver supports customizing card power/detect/io strength/bus frequency parameters. Refer to sd_usr_param_t for detail.
>+ The bigger the buffer and blocks count in one transfer, the better the performance.

### Embedded MultiMedia card(EMMC/MMC PLUS CARD)
```c
MMC_Init(card);
MMC_WriteBlocks(card, buffer, startBlock, blockCount);
MMC_ReadBlocks(card, buffer, startBlock, blockCount);
MMC_EraseGroups(card, startGroup, endGroup);
```
```c
MMC_CardInit(card);
MMC_WriteBlocks(card, buffer, startBlock, blockCount);
MMC_ReadBlocks(card, buffer, startBlock, blockCount);
MMC_EraseGroups(card, startBlock, endGroup);
```
>Note
>+ The difference between MMC_Init and MMC_CardInit is that MMC_Init function will initialize the host controller.
>+ The mmccard read/write function supports non-WORD align buffer address transfer. If application clears the flag noInteralAlign(in card descriptor mmc_card_t), the driver will spilt it into several small WORD align transfer pieces.
>+ The mmccard driver supports customizing card io strength/bus frequency parameters. Please refer to mmc_usr_param_t for detail.
>+ The bigger buffer and blocks count in one transfer, the better the performance.

### Secure Digital IO Card(SDIO CARD)
```c
SDIO_Init(card);
SDIO_IO_RW_Direct(card, direction, func, register, write, &read);
SDIO_IO_Write_Extended(card, func, register, buffer, size, flags);
SDIO_IO_Read_Extended(card, func, register, buffer, size, flags);
SDIO_IO_Transfer(card, cmd, argument, blockSize, &txData, &rxData, dataSize, &response);
```
```c
SDIO_CardInit(card);
SDIO_IO_RW_Direct(card, direction, func, register, write, &read);
SDIO_IO_Write_Extended(card, func, register, buffer, size, flags);
SDIO_IO_Read_Extended(card, func, register, buffer, size, flags);
SDIO_IO_Transfer(card, cmd, argument, blockSize, &txData, &rxData, dataSize, &response);
```
>Note
>+ The difference between SDIO_Init and SDIO_CardInit is that SDIO_Init function will initialize the host controller and poll the card insert status.
>+ The SDIO_IO_Transfer function supports non-WORD align buffer address transfer. If application clears the flag noInteralAlign(in card descriptor sdio_card_t) and the transfer size is smaller than internal align buffer size, then the driver will use internal align buffer to ensure better performance.
>+ The sdio driver supports customizing card power/detect/io strength/bus frequency/card interrupt callback parameters. Please refer to sdio_usr_param_t for detail.

### Secure Digital memory Card(SDSPI)
```c
SDSPI_Init(card);
SDSPI_ReadBlocks(card, buffer, startBlock, blockCount);
SDSPI_WriteBlocks(card, buffer, startBlock, blockCount);
SDSPI_EraseBlocks(card, startBlock, blockCount);
```
>Note
>Before calling the SDSPI relate interfaces, application should prepare a sdspi_host_t object and initial the relate configurations properly.

## Host driver porting guide
For the host controller that imcompatible with UHS/HS200/HS400, please refer to the SDHC/SDIF host driver. Otherwise please refer to the USDHC host driver.
