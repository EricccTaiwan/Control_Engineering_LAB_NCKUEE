a=25;
b=3.6;
kd=(28.28-b)/a;
kp=400/a;

num=[a*kd a*kp];
den=[1 b+(a*kd) a*kp];
sys=tf(num,den);

t=0:0.01:1;
[y_step,t]=step(sys,t);

figure(1);
subplot(311);
plot(t,y_step);
title('Step response');
xlabel('Time (s)');
ylabel('Mag');
grid;

w=logspace(-1,1,100);
[mag,phase]=bode(num,den,w);
subplot(312);
semilogx(w,20*log10(mag));
title('Magnitude');
xlabel('w (rad/s)');
ylabel('Mag');
grid;

subplot(313);
semilogx(w,phase);
title('Phase');
xlabel('w (rad/s)');
ylabel('Phase');
grid;
