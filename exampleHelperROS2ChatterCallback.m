function exampleHelperROS2ChatterCallback(message)
    %exampleHelperROS2ChatterCallback - ROS 2 subscriber callback function to display data
    %   from the message.
    %   exampleHelperROS2ChatterCallback(MESSAGE) returns no arguments- it simply displays
    %   message content.
    %   
    %   See also ROS2PublishAndSubscribeExample
    
    %   Copyright 2019 The MathWorks, Inc.
    
    message.data
end