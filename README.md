# ros_docker

ROS docker with GUI tools

## Usage

```bash
./ros_docker.sh [build|init|start|into|stop]
```

- build: build `ros-kinetic-desktop-full` image with image tag ros:kinetic-desktop-full.
- init: create container namely `ros`.
- start: start ros container.
- into: into ros container.
- stop: stop ros container.

## Run GUI tools

```bash
git clone https://github.com/mviereck/x11docker.git
cd x11docker
./x11docker --hostnet IMAGENAME [COMMAND]
```

e.g. `./x11docker --hostnet ros:kinetic-desktop-full rviz`