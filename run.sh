#!/bin/bash


if [ $1 = useEigen ]
then

buildPath="ch3/useEigen/build"
if [ ! -d $buildPath ]
then
mkdir -p $buildPath
fi

cd $buildPath
cmake -DCMAKE_BUILD_TYPE=Debug ..
make

gdbserver localhost:8080 \
  ./eigenMatrix

else
echo "Pass"
fi