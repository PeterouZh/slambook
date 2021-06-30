cmake_minimum_required( VERSION 2.8 )
project( geometry )

set( CMAKE_CXX_FLAGS "-static-libstdc++" )

# 添加Eigen头文件
include_directories( "/usr/include/eigen3" )

add_executable( eigenGeometry eigenGeometry.cpp )
