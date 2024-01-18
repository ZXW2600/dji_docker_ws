#!/bin/bash
cd /catkin_ws
source /opt/ros/noetic/setup.bash
source devel/setup.bash

roslaunch circle_detector vis.launch 
# exit 0