FROM ros:kinetic-desktop-full

SHELL ["/bin/bash", "-c"]

# install required package
RUN apt-get update && apt-get install -y \
        python-pip \
        ros-kinetic-joy \
        ros-kinetic-mrpt* \
        ros-kinetic-yocs-cmd-vel-mux \
        ros-kinetic-map-server \
        ros-kinetic-amcl \
        ros-kinetic-move-base

RUN pip install crc16

# create workspace
RUN mkdir -p /catkin_ws/src
# WORKDIR /catkin_ws/src
# RUN git clone https://github.com/tuw-cpsg/general-ros-modules.git

# build custom ROS packages
WORKDIR /catkin_ws
RUN source /opt/ros/kinetic/setup.bash && catkin_make

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
