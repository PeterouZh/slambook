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

elif [ $1 = ch3useGeometry ]
then

    # ./run.sh ch3useGeometry False Debug|Release
    buildPath="ch3/useGeometry/build"
    rebuild=$2
    buildType=$3
    make_build_dir $buildPath "$rebuild"
    cd $buildPath
    cmake -DCMAKE_BUILD_TYPE="$buildType" ..
    make

    if [ "$buildType" = Debug ]
    then
    gdbserver localhost:8080 ./eigenGeometry
    else
    ./eigenGeometry
    fi

elif [ $1 = ch3visualizeGeometry ]
then

    # ./run.sh ch3visualizeGeometry False Debug|Release
    buildPath="ch3/visualizeGeometry/build"
    rebuild=$2
    buildType=$3
    make_build_dir $buildPath "$rebuild"
    cd $buildPath
    cmake -DCMAKE_BUILD_TYPE="$buildType" -DCMAKE_PREFIX_PATH="/home/shhs/Desktop/user/soft/Pangolin" ..
    make

    if [ "$buildType" = Debug ]
    then
    gdbserver localhost:8080 ./visualizeGeometry
    else
    ./visualizeGeometry
    fi

elif [ $1 = ch4/useSophus ]
then

    # ./run.sh ch4/useSophus False Debug|Release
    buildPath="ch4/useSophus/build"
    rebuild=$2
    buildType=$3
    make_build_dir $buildPath "$rebuild"
    cd $buildPath
    cmake -DCMAKE_BUILD_TYPE="$buildType" -DCMAKE_PREFIX_PATH="/home/shhs/Desktop/user/soft/Sophus" ..
    make

    if [ "$buildType" = Debug ]
    then
    gdbserver localhost:8080 ./useSophus
    else
    ./useSophus
    fi

elif [ $1 = ch5/joinMap ]
then

    # ./run.sh ch5/joinMap False Debug|Release
    buildPath="ch5/joinMap/build"
    rebuild=$2
    buildType=$3
    make_build_dir $buildPath "$rebuild"
    cd $buildPath
    cmake -DCMAKE_BUILD_TYPE="$buildType" \
      -DCMAKE_PREFIX_PATH="/home/shhs/env/pcl-1.8.1;/home/shhs/env/opencv3_2" \
      -DCMAKE_CXX_FLAGS="-std=c++11" ..
    make

    cd ..

    if [ "$buildType" = Debug ]
    then
        gdbserver localhost:8080 ./build/joinMap
    else
        LD_LIBRARY_PATH=/home/shhs/env/pcl-1.8.1/lib
        ./build/joinMap
        /home/shhs/env/pcl-1.8.1/bin/pcl_viewer map.pcd
    fi


else
    echo "Pass"
fi