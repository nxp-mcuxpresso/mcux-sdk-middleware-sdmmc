#Description: Middleware sdmmc host sdif; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_sdif component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/sdif
)

#OR Logic component
if(CONFIG_USE_middleware_sdmmc_host_sdif_interrupt) 
    include(middleware_sdmmc_host_sdif_interrupt)
endif()
if(CONFIG_USE_middleware_sdmmc_host_sdif_polling) 
    include(middleware_sdmmc_host_sdif_polling)
endif()
if(CONFIG_USE_middleware_sdmmc_host_sdif_freertos) 
    include(middleware_sdmmc_host_sdif_freertos)
endif()

