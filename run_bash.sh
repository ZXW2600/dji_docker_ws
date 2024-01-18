#! /usr/bin/bash


docker run --gpus all -it --net=host -e ROS_MASTER_URI -v/data/zxw/workspace/dji_ws:/catkin_ws -v/data/zxw/workspace/dji_ws/entrypoint:/entrypoint --rm --name=rmua_debug --entrypoint  bash rmua_devel
