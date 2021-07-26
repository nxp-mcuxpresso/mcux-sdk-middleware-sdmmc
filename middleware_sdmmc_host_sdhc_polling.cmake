#Description: Middleware sdmmc host sdhc polling; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_sdhc_polling component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/host/sdhc/blocking/fsl_sdmmc_host.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/sdhc
)


include(middleware_sdmmc_osa_bm)
include(driver_sdhc)
include(middleware_sdmmc_common)
