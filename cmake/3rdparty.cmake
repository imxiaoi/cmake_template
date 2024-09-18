# 3rdparty.cmake

# 包含各个第三方库的配置
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/iniparser.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/canopenlinux.cmake)

add_library(3rdparty INTERFACE)


# header-only库 方便暴露给上层
target_include_directories(3rdparty INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/spdlog-1.14.1/include)

# 动态库
target_link_libraries(3rdparty INTERFACE 
                      canopenlinux
                      iniparser_lib)