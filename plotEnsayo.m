function [R,U,Y] = plotEnsayo(K,Ti,Td,b,R,U,Y)
    
    indiceEscalonCero = find(R(:,2)>0,1);
    escalonenceroU = R(indiceEscalonCero-1,1);
    escalonencero = R(indiceEscalonCero,1);
    if isempty(escalonencero)
        escalonencero = 0;
    end
    U(:,1) = U(:,1) - escalonenceroU;
    Y(:,1) = Y(:,1) - escalonencero;
    R(:,1) = R(:,1) - escalonencero;
    subplot(2,1,1);
    title("Ensayo Escalón "+max(R(:,2))+" | Control: K="+K+" Ti="+Ti+" Td="+Td+" b="+1)
    hold on
    grid on
    U(indiceEscalonCero-1,2) = U(indiceEscalonCero,2) - U(indiceEscalonCero-1,1)*(U(indiceEscalonCero+1,1)-U(indiceEscalonCero,1))
    plot(U(:,1),[U(:,2)],'-')
    xlim([0,U(end,1)]);
    xlabel('Tiempo [s]')
    ylabel('PWM [%]')
    subplot(2,1,2);
    hold on
    Yrec= Y(1,:);
    xlabel('Tiempo [s]')
    ylabel('Velocidad [rad/seg]')
    ant = Yrec;
    for i = 2:length(Y)
        act = Y(i,:);
        if(act(2)>0.0001 && ant(2)==0)
            Yrec = [Yrec;Y(i-3,:);];
        end
        if(abs(act(2) - ant(2))>0.01)
            Yrec = [Yrec;act];
        end
        ant = act;
    end
%     plot(Y(:,1),[Y(:,2)],'-*')
    hold on
    plot(Yrec(:,1),[Yrec(:,2)],'-')
    plot(R(:,1),[R(:,2)],'g-*')
    hold on
    xlim([0,U(end,1)]);
    grid on
    

end