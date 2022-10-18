#Description: Middleware sdmmc host sdioc; user_visible: True
include_guard(GLOBAL)
message("middleware_sdmmc_host_sdioc component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/host/sdioc
)

#OR Logic component
if(CONFIG_USE_middleware_sdmmc_host_sdioc_freertos) 
    include(middleware_sdmmc_host_sdioc_freertos)
endif()
if(CONFIG_USE_middleware_sdmmc_host_sdioc_interrupt) 
    include(middleware_sdmmc_host_sdioc_interrupt)
endif()

