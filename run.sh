#!/bin/bash

make_build_dir()
{
buildPath=$1
rebuild=$2

if [ -d "$buildPath" ] && [ "$rebuild" = True ]
then
rm -rf "$buildPath"
fi

if [ ! -d "$buildPath" ]
then
mkdir -p "$buildPath"
fi
}


if [ $1 = useEigen ]
then
# ./run.sh useEigen False Debug|Release
buildPath="ch3/useEigen/build"
rebuild=$2
buildType=$3
make_build_dir $buildPath "$rebuild"
cd $buildPath
cmake -DCMAKE_BUILD_TYPE="$buildType" ..
make

if [ $buildType = Debug ]
then
gdbserver localhost:8080 ./eigenMatrix
else
./eigenMatrix
fi

elif [ $1 = LKFlow ]
then
# ./run.sh LKFlow False Debug|Release
buildPath="ch8/LKFlow/build"
rebuild=$2
buildType=$3
make_build_dir $buildPath "$rebuild"
cd $buildPath
cmake -DCMAKE_BUILD_TYPE="$buildType" -DCMAKE_PREFIX_PATH="/home/shhs/env/opencv3_2" -DCMAKE_CXX_FLAGS=-std=c++11 ..
make

if [ "$buildType" = Debug ]
then
gdbserver localhost:8080 ./useLK ../../data
else
./useLK ../../data
fi

else
echo "Pass"
fi