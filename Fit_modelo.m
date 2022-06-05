%mejor
Kp = 0.062;
seta_p = 0.8;%0.8;
wn_p = 26;%24.5;
s= tf("s");
P = Kp/(1/wn_p^2*s^2 + 2*seta_p/wn_p*s + 1);

retraso = 0.051; %0.051
sim_matlab = sim("SIM");
hold on
subplot(2,1,1);
plot(sim_matlab.tout ,sim_matlab.sim_mando,'blue')
subplot(2,1,2); 
plot(sim_matlab.tout ,sim_matlab.sim_salida,'--m','LineWidth',2)
