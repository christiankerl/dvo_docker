#!/bin/bash
source /opt/ros/fuerte/setup.bash
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:`pwd`

rosmake interactive_markers dvo_core dvo_ros dvo_benchmark
