FROM ros:melodic

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get -y install wget && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

RUN apt-get clean && \
    apt-get update && apt-get -y install \
    htop \
    mongodb \
    python-pip \
    python-pymongo \
    ssh \
    terminator \
    usbutils \
    vim \
    pulseaudio \
    python-twisted \
    wget \
    python-catkin-tools && \
    apt-get update

RUN mkdir -p /root/catkin_ws/src
COPY . /root/catkin_ws/src/ros-docker-example

RUN source /opt/ros/$ROS_DISTRO/setup.bash && \
    cd /root/catkin_ws/ && \
    catkin init && \ 
    rosdep install -y -r --from-path src && \ 
    catkin build && \
    echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

RUN sudo rm -rf /var/lib/apt/lists/*