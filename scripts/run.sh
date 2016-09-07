#!/bin/bash

set -e

source /opt/ros/fuerte/setup.bash
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/root

exec roslaunch dvo_benchmark benchmark.launch dataset:=/dataset/ output_dir:=/dataset/
