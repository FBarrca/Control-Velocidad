function [NoError] = ConexionControlInterno(ipaddress,DOMAIN_ID)
%%%%%%%%%%%%%%%%%%%%%%%%
%Lectura de constantes
setenv("ROS_DOMAIN_ID",string(DOMAIN_ID))
fprintf("Domain ID ROS2: %s \n",DOMAIN_ID)
middleware ="rmw_cyclonedds_cpp";
setenv("RMW_IMPLEMENTATION",middleware) %rmw_cyclonedds_cpp 
fprintf("Middleware: %s \n",middleware)
%Comprobación de la conexion /turtlebot3_node
fprintf("Leyendo lista de nodos:\n")
if any(contains(ros2("node","list"),'/turtlebot3_node'))
    fprintf("    - Buena conexión con el robot. Nodo turtlebot3_node corriendo\n")
else
    fprintf("Error: No se encuentra el turtlebot3_node Asegurese que el robot está encendido y la configuración de domain es correcta\n")
    NoError = 0;
    return
end
%Comprobación de la conexion /EnsayoControlVelocidad
fprintf("Despliegue del control:\n")
if any(contains(ros2("node","list"),'/EnsayoControlVelocidad'))
    fprintf("    - Nodo '/EnsayoPolosInterno' ya estaba desplegado.\n")
else
    setenv("RMW_IMPLEMENTATION","rmw_cyclonedds_cpp")
    
    d = ros2device(ipaddress,'ubuntu','turtlebot');
    d.ROS2Folder = '/opt/ros/foxy';
    d.ROS2Workspace = '~/turtlebot3_ws'
    runNode(d,'EnsayoControlVelocidadRASP2')
    fprintf("    - Control desplegado.\n")
    pause(10)
    if any(contains(ros2("node","list"),'/EnsayoControlVelocidad'))
        fprintf("    - Nodo '/EnsayoControlVelocidad' creado\n")
    else
        fprintf(" Error: Nodo '/EnsayoControlVelocidad' no encontrado en ROS2\n")  
        NoError = 0;
        return
    end
end
fprintf("Fin de pruebas.\n")
NoError = 1;
return
end