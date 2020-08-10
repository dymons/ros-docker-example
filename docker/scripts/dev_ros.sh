docker run \
    --detach \
    --network host \
    --rm \
    --name talker \
    ros-docker-example \
    /bin/bash -c "source /root/catkin_ws/devel/setup.bash && roslaunch ros_docker_example ros_docker_example.launch"