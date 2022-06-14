Tsim =5;
% ref = 0.2;
% DOMAIN_ID = 30;
% [R,U,Y] = EnsayoPC(DOMAIN_ID,Tsim*0.1,0);
K = 10
Ti = 10
Td =  0
b=1

clf
for t = 1:1
%     pause(0.8)
%     [R,U,Y] = EnsayoPC(DOMAIN_ID,Tsim,ref);
    ensayo = sim("Monitorizacion");
    Y = ensayo.ensayo_salida;
    R = ensayo.ensayo_ref;
    U = ensayo.ensayo_mando;
    [R,U,Y] = plotEnsayo(K,Ti,Td,b,R,U,Y);

    hold on
end
Fit_modelo
grid