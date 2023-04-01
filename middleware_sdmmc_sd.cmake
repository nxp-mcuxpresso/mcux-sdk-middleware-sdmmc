#Description: SDMMC sd stack; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_sd component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/sd/fsl_sd.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/sd
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "MIMXRT1062")
    include(middleware_sdmmc_host_usdhc)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1042")
    include(middleware_sdmmc_host_usdhc)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm4")
    include(middleware_sdmmc_host_usdhc)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm7")
    include(middleware_sdmmc_host_usdhc)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC55S66_cm33_core0")
    include(middleware_sdmmc_host_sdif)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC55S69_cm33_core0")
    include(middleware_sdmmc_host_sdif)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT595S_cm33")
    include(middleware_sdmmc_host_usdhc)
endif()

include(middleware_sdmmc_common)
