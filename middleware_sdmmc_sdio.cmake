#Description: SDMMC sdio stack; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_sdio component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/sdio/fsl_sdio.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/sdio
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "MIMXRT1052")
    include(middleware_sdmmc_host_usdhc)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54628")
    include(middleware_sdmmc_host_sdif)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54S018")
    include(middleware_sdmmc_host_sdif)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54S018M")
    include(middleware_sdmmc_host_sdif)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT685S_cm33")
    include(middleware_sdmmc_host_usdhc)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT595S_cm33")
    include(middleware_sdmmc_host_usdhc)
endif()

include(middleware_sdmmc_common)
