%Filtra si se ha colado un valor de tiempo decreciente en el vector
    ix=[true; diff(R(:,1))>0];
    R=R(ix,:);

%mejor
Kp = 0.065;
seta_p = 1.0;
wn_p = 28.5;
s= tf("s");
% P = Kp/(1/wn_p^2*s^2 + 2*seta_p/wn_p*s + 1);
P = Kp/(1+s/24)/(1+s/57)
retraso = 0.090; 
Pm = zpk(pade(P*exp(-retraso*s),1))
Ptotal =P*exp(-retraso*s)

sim_matlab = sim("SIM");
hold on
subplot(2,1,1);
plot(sim_matlab.tout ,sim_matlab.sim_mando,'--m','LineWidth',2)
subplot(2,1,2); 
plot(sim_matlab.tout ,sim_matlab.sim_salida,'--m','LineWidth',2)
% 0.062/(1/23.5^2*s^2 + 2*0.70/23.5*s + 1)
%0.062/(1/23.5^2*s^2 + 2*0.70/23.5*s + 1)*exp(-0.06*s)