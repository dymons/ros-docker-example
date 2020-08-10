ARG ROS_DISTRO=melodic
FROM ros:${ROS_DISTRO}

SHELL ["/bin/bash", "-c"]

RUN apt-get update && sudo apt-get install -y ros-${ROS_DISTRO}-desktop-full python-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

ENV ROS_ROOT /opt/ros/${ROS_DISTRO}/share/ros
ENV ROS_PACKAGE_PATH /opt/ros/${ROS_DISTRO}/share
# ENV ROS_MASTER_URI http://localhost:11311
ENV ROS_VERSION 1
ENV LD_LIBRARY_PATH /opt/ros/${ROS_DISTRO}/lib:/opt/ros/${ROS_DISTRO}/lib/x86_64-linux-gnu
ENV PATH /opt/ros/${ROS_DISTRO}/bin:/home/stribuda/gcc-arm-none-eabi-7-2017-q4-major/bin:/home/stribuda/bin:/home/stribuda/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
ENV ROS_DISTRO ${ROS_DISTRO}
ENV PYTHONPATH /opt/ros/${ROS_DISTRO}/lib/python2.7/dist-packages
ENV PKG_CONFIG_PATH /opt/ros/${ROS_DISTRO}/lib/pkgconfig:/opt/ros/${ROS_DISTRO}/lib/x86_64-linux-gnu/pkgconfig
ENV CMAKE_PREFIX_PATH /opt/ros/${ROS_DISTRO}
ENV ROS_ETC_DIR /opt/ros/${ROS_DISTRO}/etc/ros

RUN mkdir -p /catkin_ws/src/ros-docker-example

COPY . /catkin_ws/src/ros-docker-example

WORKDIR /catkin_ws/

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
# RUN source ~/.bashrc

RUN catkin init
RUN rosdep install -y -r --from-path src
RUN catkin build

# CMD ["source ~/.bashrc"]
# CMD ["source /catkin_ws/devel/setup.bash"]
# CMD ["roslaunch", "ros_docker_example", "ros_docker_example.launch"]
# source ~/.bashrc
# roslaunch ros_docker_example ros_docker_example.launch