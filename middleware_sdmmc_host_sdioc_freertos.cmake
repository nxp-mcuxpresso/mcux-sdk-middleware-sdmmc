#Description: Middleware sdmmc host sdioc freertos; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_sdioc_freertos component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/host/sdioc/non_blocking/fsl_sdmmc_host.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/sdioc
)


include(driver_mw_sdioc)
include(middleware_sdmmc_osa_freertos)
include(middleware_sdmmc_common)
