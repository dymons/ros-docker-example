FROM ros:melodic-ros-base
RUN apt-get update
RUN mkdir -p /catkin_ws/src/ros-docker-example
COPY . /catkin_ws/src/ros-docker-example
ENV ROS_PACKAGE_PATH=/catkin_ws/src/ros-docker-example
RUN rosdep install -y -r --from-path /catkin_ws/src
RUN source /opt/ros/$ROS_DISTRO/setup.bash; \
    cd /catkin_ws; \
    catkin init; \
    catkin build

CMD ["roslaunch", "ros_docker_example", "ros_docker_example.launch"]