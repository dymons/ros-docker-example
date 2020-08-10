#include <ros/ros.h>
#include <std_msgs/String.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "talker");
    ros::NodeHandle nH { "~" };

    ROS_INFO_STREAM("talker is running");

    ros::Publisher publisher = nH.advertise<std_msgs::String>("out_chatter", 10);

    ros::Rate loopRate { 1 };

    while (ros::ok())
    {
        ros::spinOnce();

        std_msgs::String msg;
        msg.data = "Hello Docker!";

        publisher.publish(msg);
        loopRate.sleep();
    }

    return 0;
}