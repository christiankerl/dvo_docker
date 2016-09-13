#!/bin/bash
source /opt/ros/fuerte/setup.bash
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$PWD

WD=$PWD
roscd dvo_core
git apply $WD/fix_build.patch
cd $WD

rosmake interactive_markers dvo_core dvo_ros dvo_benchmark
