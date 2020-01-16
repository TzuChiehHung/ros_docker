FROM ros:kinetic

SHELL ["/bin/bash", "-c"]

# ros desktop full for GUIs
RUN apt-get update && apt-get install -y \
        ros-kinetic-desktop-full

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
