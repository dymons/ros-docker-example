cmake_minimum_required(VERSION 3.12...3.14)

project(ros_docker_example DESCRIPTION "An example of the use of dockers with ROS" LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(catkin REQUIRED COMPONENTS roscpp std_msgs)

include_directories(${catkin_INCLUDE_DIRS})

add_executable(ros_node_talker src/ros_node_talker.cpp)
target_link_libraries(ros_node_talker ${catkin_LIBRARIES})

add_executable(ros_node_listener src/ros_node_listener.cpp)
target_link_libraries(ros_node_listener ${catkin_LIBRARIES})