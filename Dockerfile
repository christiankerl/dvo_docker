FROM ubuntu:12.04
WORKDIR root

# install ros.key and setup ros repository
ADD http://packages.ros.org/ros.key ros.key
RUN apt-key add ros.key && sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'

# copy scripts and make them executable
COPY scripts/*.sh ./
RUN chmod +x *.sh

# install dependencies
RUN ./fixnetwork.sh && apt-get update && apt-get install -y git make libeigen3-dev ros-fuerte-ros-comm ros-fuerte-opencv2 ros-fuerte-vision-opencv ros-fuerte-perception-pcl ros-fuerte-image-common

COPY fix_build.patch ./

# download dvo and build
RUN ./fixnetwork.sh && git clone -b fuerte https://github.com/ros-visualization/visualization.git && git clone https://github.com/tum-vision/dvo.git && ./build.sh

# copy updated launch file
COPY benchmark.launch ./dvo/dvo_benchmark/launch/benchmark.launch

ENTRYPOINT ["/root/ros_entrypoint.sh"]
CMD ["roslaunch", "dvo_benchmark", "benchmark.launch", "dataset:=/dataset", "output_dir:=/dataset/"]
