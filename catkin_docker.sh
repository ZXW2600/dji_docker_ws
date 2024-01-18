#! /usr/bin/bash
docker run --gpus all -it  -v/data/zxw/workspace/dji_ws:/catkin_ws -v/data/zxw/workspace/dji_ws/entrypoint:/entrypoint --rm  --entrypoint  /entrypoint/catkin_build.sh rmua_devel
