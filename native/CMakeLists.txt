cmake_minimum_required(VERSION 3.4.1)
project(math_operations)

set(CMAKE_CXX_STANDARD 14)

add_library(
        math_operations
        SHARED
        ${NATIVE_DIR}/src/math_operations.cpp
)

target_include_directories(math_operations PUBLIC include)

set_target_properties(math_operations PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../build")