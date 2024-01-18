FROM nvidia/cuda:11.6.1-base-ubuntu20.04

# replace source
RUN bash -c 'echo -e "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse\n\
    deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse\n\
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse\n\
    deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse\n\
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse\n\
    deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse\n\
    deb http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\n\
    deb-src http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\n\
    " > /etc/apt/sources.list'

# install ros
ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y update
RUN apt install -y debian-keyring debian-archive-keyring wget gnupg2 lsb-release curl

RUN sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ focal main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt -y update
RUN apt install -y --no-install-recommends ros-noetic-ros-core

# install pip and replace source
# install
RUN apt install -y pip python3-catkin-tools ros-noetic-geographic-msgs \
    ros-noetic-tf2-sensor-msgs ros-noetic-tf2-geometry-msgs ros-noetic-image-transport \
    net-tools && apt install -y libgflags-dev libgoogle-glog-dev 

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple 

# pip install circle detector dependence
RUN bash -c 'echo -e "numpy<=1.23.5\n onnx\n onnxsim\n opencv-python\n torch\n torchvision\n casadi" > /tmp/req.txt && pip3 install -r /tmp/req.txt'

RUN apt install -y ros-noetic-cv-bridge