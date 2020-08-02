#include <ros/ros.h>
#include <std_msgs/String.h>

void callback(const std_msgs::String::ConstPtr& t_msg)
{
    ROS_INFO_STREAM("I heard: " << t_msg->data);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "listener");
    ros::NodeHandle nH;

    ROS_INFO_STREAM("listener is running");

    ros::Subscriber subscriber = nH.subscribe("in_chatter", 10, callback);

    ros::spin();

    return 0;
}