folderPath = fullfile(pwd,'subset');
bag = ros2bag(folderPath);
bag2info = ros2("bag","info",folderPath)
msgs = readMessages(bag);
bagSel = select(bag,"Topic","/signals");
msgsFiltered = readMessages(bagSel);
U = cellfun(@(m) double(m.twist.linear.x),msgsFiltered)
Y = cellfun(@(m) double(m.twist.linear.y),msgsFiltered)
R = cellfun(@(m) double(m.twist.linear.z),msgsFiltered)
ts = cellfun(@(m) double(m.header.stamp.sec),msgsFiltered)
ts = ts -ts(1)
tns = cellfun(@(m) double(m.header.stamp.nanosec),msgsFiltered)
t = ts + tns*1e-9

clf 
hold on 
plot(t,R,'*')
plot(t,Y,'*')
bagSel = select(bag,"Topic","/joint_states");
msgsFiltered = readMessages(bagSel);

Yjs = cellfun(@(m) double(m.velocity(1)/0.033),msgsFiltered)
tsjs = cellfun(@(m) double(m.header.stamp.sec),msgsFiltered)
tsjs = tsjs -tsjs(1) % -0.55
tnsjs = cellfun(@(m) double(m.header.stamp.nanosec),msgsFiltered)
tjs = tsjs + tnsjs*1e-9
% plot(tjs,Yjs,'*')