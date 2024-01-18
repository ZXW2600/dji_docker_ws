#!/bin/bash
cd /catkin_ws
source /opt/ros/noetic/setup.bash
source devel/setup.bash

roslaunch vins  vins_rmua.launch &
sleep 3
roslaunch circle_detector circle_detector.launch & 
# roslaunch circle_detector vis.launch &
roslaunch vio_gps_fusion airsim.launch&

sleep 5
roslaunch perc testall_vins_detect.launch &
roslaunch uav_control tracking_vins_detect.launch 

# exit 0

# exit 0