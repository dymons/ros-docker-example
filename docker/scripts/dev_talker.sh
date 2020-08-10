docker run --network host --rm --name talker -it ros-docker-example \
/bin/bash -c "source /catkin_ws/devel/setup.bash && roslaunch ros_docker_example ros_docker_example.launch"