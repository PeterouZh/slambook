cmake_minimum_required( VERSION 3.10)
project( useEigen )

#set( CMAKE_BUILD_TYPE "Release" )
#set( CMAKE_BUILD_TYPE "Debug" )
set( CMAKE_CXX_FLAGS "-static-libstdc++" )

# 添加Eigen头文件
include_directories( "/usr/include/eigen3" )
include_directories(/usr/local/include ./include)

# in osx and brew install
# include_directories( /usr/local/Cellar/eigen/3.3.3/include/eigen3 )

add_executable( eigenMatrix eigenMatrix.cpp )
