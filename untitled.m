% ipaddress = '192.168.163.51';
% d = ros2device(ipaddress,'ubuntu','turtlebot');
% d.ROS2Folder = '/opt/ros/foxy';
% d.ROS2Workspace = '~/turtlebot3_ws'
% runNode(d,'EnsayoControlVelocidadRASP')
%
% stopNode(d,'EnsayoControlVelocidadRASP')
% runNode(d,'Angulo')
setenv("RMW_IMPLEMENTATION","rmw_cyclonedds_cpp")

node_1 = ros2node("/detection",30);
chatterPub = ros2publisher(node_1,"/control","geometry_msgs/Twist");
chatterMsg = ros2message(chatterPub);
chatterMsg.linear.x = 10;
chatterMsg.linear.x = 11;
% chatterSub = ros2subscriber(node_2,"/chatter",@exampleHelperROS2ChatterCallback)
while 1
    pause(0.01)
    send(chatterPub,chatterMsg);
end
