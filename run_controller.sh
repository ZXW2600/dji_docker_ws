#! /usr/bin/bash

docker run --gpus all -it --net=host -e ROS_MASTER_URI\
 -v.:/catkin_ws\
 -v./entrypoint:/entrypoint \
 --rm --entrypoint /entrypoint/run_game.sh \
 rmua_devel
