#Description: Middleware sdmmc host usdhc; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_usdhc component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/usdhc
)

#OR Logic component
if(CONFIG_USE_middleware_sdmmc_host_usdhc_polling) 
    include(middleware_sdmmc_host_usdhc_polling)
endif()
if(CONFIG_USE_middleware_sdmmc_host_usdhc_freertos) 
    include(middleware_sdmmc_host_usdhc_freertos)
endif()
if(CONFIG_USE_middleware_sdmmc_host_usdhc_interrupt) 
    include(middleware_sdmmc_host_usdhc_interrupt)
endif()

