#Description: Middleware sdmmc host sdif freertos; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_sdif_freertos component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/host/sdif/non_blocking/fsl_sdmmc_host.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/sdif
)


include(driver_sdif)
include(middleware_sdmmc_osa_freertos)
include(middleware_sdmmc_common)
