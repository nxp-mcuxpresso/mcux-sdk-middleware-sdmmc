# NXP sdmmc driver
SDMMC driver provide a generic driver for Secure Digital Card(SDCARD), Embedded MultiMedia card(EMMC/MMC PLUS) and Secure digital IO card(SDIO), which are target to support the application based on NXP's microcontroller, but not limit to NXP's soc, as it is easy to porting to any platform based on arm core controller.

## SDMMC driver features

### Secure Digital Card(SDCARD)
    1. SDCARD driver compliant with SD V3.0 specification and compatible legacy SD version.
    2. SDCARD driver has added mutual exclusive access support for init/deinit/write/read/erase function.
    Please note that the card init function will create the mutex lock dynamically by default,
    so to avoid the mutex create redundantly, application must follow bellow sequence for card re-initialization
    3. Detail runtime log information for debug purpose if the functionality is enabled
    4. Support SD/SPI interface, please SPI interface SD driver support SD V2.0 only

### Embedded MultiMedia card(EMMC/MMC PLUS)
    1. EMMC/MMC PLUS driver compliant with MMC V5.0 specification and compatible legacy MMC version.
    2. MMCCARD driver has added mutual exclusive access support for init/deinit/write/read/erase function.
    Please note that the card init function will create the mutex lock dynamically by default,
    so to avoid the mutex create redundantly, application must follow bellow sequence for card re-initialization.
    3. Detail runtime log information for debug purpose if the functionality is enabled

### Secure Digital IO Card(SDIO)
    1. SDIO driver compliant with SD/SDIO V3.0 specification and compatible legacy SD version.
    2. SDIO driver has added mutual exclusive access support for init/deinit/write/read/erase function.
    Please note that the card init function will create the mutex lock dynamically by default,
    so to avoid the mutex create redundantly, application must follow bellow sequence for card re-initialization
    3. Detail runtime log information for debug purpose if the functionality is enabled


## SDMMC driver orginization
    - host
    -- blocking
    -- non-blocking
    - osa

    - common
    - sd
    - sdspi
    - sdio
    - mmc

## How to use the driver
Content will be available later..


## Host driver porting guide
Content will be available later..
