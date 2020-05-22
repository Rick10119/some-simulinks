%%ÎÄ¼þ2£­lecture21_22.m
fprintf('\n Wait simulation is in process. \n')
VF = 400; rF = 0.4; iF0 = VF/rF;
f = 50;    w = 2.*pi*f; pi2=2.*pi/3;
d = 180;     d=d*pi/180.
t0 = 0 ; tfinal = 1.0;
i0 = [0; 0; 0; iF0; 0; 0;];           % Initial currents
%[t,i] = ode45('Gllshort', t0, tfinal, i0);         % use for MATLAB 4
tspan = [t0, tfinal];                              % use for MATLAB 5
[t,i] = ode45('Gllshort', tspan, i0);               % use for MATLAB 5
% id,iq,i0 = Armature current  iF=Field current
id=i(:,1); iq=i(:,2);i0=i(:,3); iF=i(:,4); iD=i(:,5); iQ=i(:,6);
%current dq0 to current abc
nn=length(id);
for kk=1:nn,
tt=t(kk);thetaa=w*tt+d;thetab=thetaa-pi2;thetac=thetaa+pi2;%½Ç¶È
ia(kk)=cos(thetaa)*id(kk)-sin(thetaa)*iq(kk)+i0(kk);
ib(kk)=cos(thetab)*id(kk)-sin(thetab)*iq(kk)+i0(kk);
ic(kk)=cos(thetac)*id(kk)-sin(thetac)*iq(kk)+i0(kk);
end 
figure(1), plot(t,ia), xlabel('t, sec'), ylabel('ia, A'), grid
title(['three phase short circuit  ia,  ','delta = ', num2str(d)])
figure(2), plot(t,ib), xlabel('t, sec'), ylabel('ib, A'), grid
title(['three phase short circuit  ib,  ','delta = ', num2str(d)])
figure(3), plot(t,ic), xlabel('t, sec'), ylabel('ic, A'), grid
title(['three phase short circuit  ic,  ','delta = ', num2str(d)])
