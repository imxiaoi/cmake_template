# 定义自定义目标，编译第三方库

set(CANOPENLINUX_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/305/CO_LSSslave.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/303/CO_LEDs.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_Emergency.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_NMT_Heartbeat.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_HBconsumer.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_SDOserver.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_SDOclient.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_TIME.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/305/CO_LSSmaster.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/309/CO_gateway_ascii.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_PDO.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_SYNC.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_ODinterface.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/crc16-ccitt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/301/CO_fifo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CO_epoll_interface.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CO_error.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CO_driver.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/CANopen.c
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/example/OD.c
)

set(CANOPENLINUX_INCLUDES
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/CANopenLinux/CANopenNode/example
    )

set(TARGET_LINK
    pthread
)

add_library(canopenlinux SHARED ${CANOPENLINUX_SOURCES})

#target_link_libraries(${PROJECT_NAME}, ${TARGET_LINK})

# 添加包含路径
target_include_directories(canopenlinux PUBLIC ${CANOPENLINUX_INCLUDES})