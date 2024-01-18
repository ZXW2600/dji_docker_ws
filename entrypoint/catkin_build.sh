#! /usr/bin/bash
cd /catkin_ws
set -x && . /opt/ros/noetic/setup.sh && catkin_make  && . devel/setup.sh 