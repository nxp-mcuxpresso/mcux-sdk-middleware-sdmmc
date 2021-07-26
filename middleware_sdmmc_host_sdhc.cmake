#Description: Middleware sdmmc host sdhc; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_sdhc component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/sdhc
)

#OR Logic component
if(CONFIG_USE_middleware_sdmmc_host_sdhc_freertos) 
    include(middleware_sdmmc_host_sdhc_freertos)
endif()
if(CONFIG_USE_middleware_sdmmc_host_sdhc_interrupt) 
    include(middleware_sdmmc_host_sdhc_interrupt)
endif()
if(CONFIG_USE_middleware_sdmmc_host_sdhc_polling) 
    include(middleware_sdmmc_host_sdhc_polling)
endif()

