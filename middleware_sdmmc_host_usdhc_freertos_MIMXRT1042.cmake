#Description: Middleware sdmmc host usdhc freertos; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_usdhc_freertos component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/host/usdhc/non_blocking/fsl_sdmmc_host.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/usdhc
)


include(driver_usdhc)
include(middleware_sdmmc_osa_freertos)
include(middleware_sdmmc_common)
include(driver_cache_armv7_m7)
