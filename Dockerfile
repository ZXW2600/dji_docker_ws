FROM rmua_devel
ADD ./ /catkin_ws/
# ADD src /catkin_ws/src/
ADD entrypoint /entrypoint 

RUN chmod +x /entrypoint/run_game.sh

USER root

ENV ROS_DISTRO noetic

WORKDIR /catkin_ws/
RUN set -x && . /opt/ros/${ROS_DISTRO}/setup.sh && catkin build  && . devel/setup.sh 
ENTRYPOINT [ "/entrypoint/run_game.sh" ]
