num=[40];
den=conv([1 0],[1 2]);
[numc,denc]=cloop(num,den,1);
sys=tf(num,den);
sysc=tf(numc,denc);

w=logspace(-5,5,100);
[mag,phase]=bode(num,den,w);

figure(1);

subplot(321);
semilogx(w,20*log10(mag));
title('Bode Plot Magnitude - open loop');
xlabel('w (rad/s)');
ylabel('Mag');

subplot(323);
semilogx(w,phase);
title('Bode Plot Phase - open loop');
xlabel('w (rad/s)');
ylabel('Phase');

subplot(325);
t=0:0.01:1;
[y_step,t]=step(sys,t);
plot(t,y_step);
title('Step response - open loop');
xlabel('Time (s)');
ylabel('Mag');

[magc,phasec]=bode(numc,denc,w);
subplot(322);
semilogx(w,20*log10(magc));
title('Bode Plot Magnitude - closed loop');
xlabel('w (rad/s)');
ylabel('Mag');

subplot(324);
semilogx(w,phasec);
title('Bode Plot Phase - closed loop');
xlabel('w (rad/s)');
ylabel('Phase');

subplot(326);
t=0:0.01:1;
[y_stepc,t]=step(sysc,t);
plot(t,y_stepc);
title('Step response of feedback');
xlabel('Time (s)');
ylabel('Mag');

figure(2);
rlocus(num,den);
sgrid;
title('Root Locus Diagram');
xlabel('Real Axes');
ylabel('Imaginary Axes');

figure(3);
w2=linspace(0,2*pi,100);
ejw=exp(j*w2);
r1=real(ejw);
i1=imag(ejw);
[r,i]=nyquist(num,den,w);
plot(r1,i1,r,i);
axis([-1,1,-1,1]);
grid

figure(4);
subplot(211);
g=tf([40],[1 2 0]);
bode(g);
margin(g);

subplot(212);
h=tf([0.227 1],[0.24*0.227 1]);
sys=series(g,h);
bode(sys);
margin(sys);
