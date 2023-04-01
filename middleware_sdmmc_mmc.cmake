#Description: SDMMC mmc stack; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_mmc component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/mmc/fsl_mmc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/mmc
)


include(middleware_sdmmc_host_usdhc)
include(middleware_sdmmc_common)
