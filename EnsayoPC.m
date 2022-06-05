function [R,U,Y] = EnsayoPC(DOMAIN_ID,Tsim,ref,K,Ti,Td,b,Derror)
%EnsayoPC Summary of this function goes here
%   Detailed explanation goes here
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(ConexionControlInterno(DOMAIN_ID) ==0)
    return
end
fprintf("Inicio del ensayo:\n")
NodeList = ros2("node","list");
NodoControl = NodeList{find(contains(NodeList,'/EnsayoControlVelocidad'))};
ControlNode = ros2node(NodoControl,DOMAIN_ID);
SignalSub = ros2subscriber(ControlNode,"/signals","History","keeplast","Depth",1,"Reliability","besteffort");
RPub= ros2publisher(ControlNode,"/ref","std_msgs/Float32");
Rmsg = ros2message(RPub);
Rmsg.data = single(ref);
controlPub= ros2publisher(ControlNode,"/control","geometry_msgs/Twist");
controlmsg = ros2message(controlPub);
controlmsg.linear.x = double(K);
controlmsg.angular.x = double(1);
% controlmsg.data = single(K);
send(controlPub,controlmsg);
% 
vsize = round(Tsim * 100);
Message = receive(SignalSub, 5);
initialtime = double(Message.header.stamp.sec) + double(Message.header.stamp.nanosec)*1e-9; 
time = 0;
stepTime = 0;
k=0;
while time < (Tsim + initialtime +stepTime)
  k = k+1;
  Message = receive(SignalSub, 5);
  time = double(Message.header.stamp.sec) + double(Message.header.stamp.nanosec)*1e-9; 
  U(k,1) = time;
  U(k,2) = Message.twist.linear.x;
  Y(k,2) = Message.twist.linear.y;
  R(k,2) = Message.twist.linear.z;
  if(k == round(vsize/2/4))
    stepTime = time - initialtime;
    send(RPub,Rmsg);
  end
end
zero = U(1,1);
U(:,1) = U(:,1) - zero;
Y(:,1) = U(:,1);
R(:,1) = U(:,1);
U(  [false; diff(U(:,1))<0]   ,  : )=[];
Y(  [false; diff(Y(:,1))<0]   ,  : )=[];
R(  [false; diff(R(:,1))<0]   ,  : )=[];

fprintf("Fin del ensayo.\n")
Rmsg.data = single(0);
send(RPub,Rmsg)

 c = polyfit([1:length(U(:,1))]',U(:,1),1);
 fprintf("Leemos a %f Hz muestras cada %f seg.\n",1/c(1),c(1))
 fprintf("Esc a %i total %i",vsize/2/4,k)
end