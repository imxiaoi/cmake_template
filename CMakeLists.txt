cmake_minimum_required(VERSION 3.13.4)

project(demo VERSION 0.1
           DESCRIPTION "项目描述"
           LANGUAGES CXX C)

# 防止在根目录编译
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
    message(FATAL_ERROR "禁止在根目录编译,请删除根目录下的CMakeCache.txt和CMakeFiles后进入build子目录编译")
endif()

set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

# 包含汇总的第三方库 CMake 文件
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/3rdparty.cmake)

# 创建目标
add_executable(${PROJECT_NAME} 
    src/main.cpp
)

# 设置 C++ 标准
set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED YES
)

# 定义编译选项
target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:-Wall;-O0;-g;-static-libgcc;-static-libstdc++>
    $<$<CONFIG:Release>:-Wall;-O2;-static-libgcc;-static-libstdc++>
)

# 设置链接器选项
target_link_options(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:-Wl,-rpath=.>
    $<$<CONFIG:Release>:-Wl,-rpath=.>
)

# 链接库
target_link_libraries(${PROJECT_NAME}
    pthread
    3rdparty
)

# 设置包含目录
target_include_directories(${PROJECT_NAME} PRIVATE include)
