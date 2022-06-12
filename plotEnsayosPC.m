Tsim = 1;
ref = 0.2;
K=20
Ti =0
Td =0 
b=1
Ds=0    
DOMAIN_ID = 30;
clf
[R,U,Y] = EnsayoPC(DOMAIN_ID,Tsim*0.1,0);
for t = 1:3
    pause(1)
    [R,U,Y] = EnsayoPC(DOMAIN_ID,Tsim,ref);
    escalonencero = U(find(R(:,2)>0,1),1);
    if isempty(escalonencero)
        escalonencero = 0;
    end
    U(:,1) = U(:,1) - escalonencero;
    Y(:,1) = U(:,1);
    R(:,1) = U(:,1);
    subplot(2,1,1);
    hold on
    
    plot(U(:,1),[U(:,2)],'*')
    xlim([0,Tsim]);
    subplot(2,1,2);
    hold on
    Yrec= Y(1,:);
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
%     plot(Y(:,1),[Y(:,2)],'*')
    plot(Yrec(:,1),[Yrec(:,2)],'*')
    plot(R(:,1),[R(:,2)],'*')
    xlim([0,Tsim]);
end
Fit_modelo