# 定义自定义目标，编译第三方库
add_custom_target(
    build_iniparser_lib
    COMMAND +make CC=aarch64-linux-gnu-gcc libiniparser.so.1 -C ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/iniparser-4.2.1/
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/iniparser-4.2.1/libiniparser.so.1 .
)

# 定义 iniparser 库接口
add_library(iniparser_lib SHARED IMPORTED)
set_target_properties(iniparser_lib PROPERTIES
    IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/iniparser-4.2.1/libiniparser.so.1
)

# 添加包含路径
target_include_directories(iniparser_lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/iniparser-4.2.1/src)

# 使 iniparser_lib 依赖于 build_iniparser_lib
add_dependencies(iniparser_lib build_iniparser_lib)