cmake_minimum_required(VERSION 3.4.1)
project(native_math)

add_library(
        native_math
        SHARED
        native_math.cpp
)

target_link_libraries(
        native_math
        android
        log
)