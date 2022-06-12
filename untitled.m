ipaddress = '192.168.93.51';
d = ros2device(ipaddress,'ubuntu','turtlebot');
d.ROS2Folder = '/opt/ros/foxy';
d.ROS2Workspace = '~/turtlebot3_ws'
% runNode(d,'EnsayoControlVelocidadRASP')
runNode(d,'Angulo')