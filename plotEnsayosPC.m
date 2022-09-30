clear
if ConexionControlInterno('192.168.97.51','30')==0
    return
end

% Parametros PID
% K = 7.79;
% Ti = 0.179;
% Td =0.0432;
% b=2;
% N = 4.65;
% AD=0;
% Parametros PI
K = 7.27;
Ti = 0.065;
Td =0;
b=0.8;
N = 5;
AD=0;
% % Parametros P
% K = 10;
% Ti = inf;
% Td =0;
% b=1;
% N =80;
% AD=0;
% 


clf
for t = 1:1    
    ensayo = sim("Monitorizacion");
    Y = ensayo.ensayo_salida;
    R = ensayo.ensayo_ref;
    U = ensayo.ensayo_mando;
    [R,U,Y] = plotEnsayo(K,Ti,Td,b,R,U,Y);
    hold on
end


% stopNode(d,'EnsayoControlVelocidadRASP2')
Tsim = U(end,1) 
% Fit_modelo
