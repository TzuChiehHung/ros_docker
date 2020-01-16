#! /bin/bash

name=`basename $0 .sh`
case $1 in
    build)
        docker build -t ros:kinetic-desktop-full .
        ;;
    init)
        docker run -dt --network host --name ros ros:kinetic-desktop-full
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