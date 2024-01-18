#!/bin/bash
docker run --gpus all -it --net=host -e DISPLAY -e ROS_MASTER_URI\
 -v/tmp/.X11-unix:/tmp/.X11-unix:rw\
  -v.:/catkin_ws \
  -v./entrypoint:/entrypoint \
  --rm  --entrypoint  /entrypoint/visulation.sh\
   rmua_devel
