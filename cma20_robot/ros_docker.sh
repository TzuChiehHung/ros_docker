#! /bin/bash

name=`basename $0 .sh`
case $1 in
    build)
        docker build -t ros:cma20-robot .
        ;;
    init)
        docker run -dt --privileged \
            -v ~/Repository/cma20_robot:/catkin_ws/src/cma20_robot \
            -v ~/Repository/sick_scan:/catkin_ws/src/sick_scan \
            --network host \
            --name ros \
            ros:cma20-robot
        docker stop ros
        ;;
    start)
        docker start ros
        ;;
    into)
        docker exec -it ros /docker-entrypoint.sh bash
        ;;
    stop)
        docker stop ros
        ;;
    *)
        echo "Usage: ./$name.sh [build|init|start|into|stop]"
        exit 1
        ;;
esac
exit 0