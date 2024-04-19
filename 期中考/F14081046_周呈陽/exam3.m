zeta=0.707;
wn=40;
a=32;
b=4.8;
kp=1600/a;
kd=(2*zeta*wn-b)/a;

num = [a*kd a*kp];
den = [1 b+a*kd a*kp];
sys=tf(num,den);
t=0:0.01:1;
[y_step,t]=step(sys,t);
subplot(311)
plot(t,y_step)
title('Step response')
xlabel('Time(sec)')
ylabel('y-step(t)')

w=logspace(-1,3,100);
[mag,phase]=bode(num,den,w);
subplot(312)
semilogx(w,20*log10(mag))
title('Bode diagram')
xlabel('frequency(rad/s)')
ylabel('magnitude(db)')

subplot(313)
semilogx(w,phase)
xlabel('frequency(rad/s)')
ylabel('phase(degree)')