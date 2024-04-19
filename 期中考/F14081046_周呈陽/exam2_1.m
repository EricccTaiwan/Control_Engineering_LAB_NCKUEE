clc;clear all
num=[10];
den=[1 1.5 10];
wn=sqrt(den(3))
zeta=1.5/(2*wn)
tp=pi/(wn*sqrt(1-zeta^2))
ts=4/(zeta*wn)
pos=exp(-zeta*pi/(1-zeta^2))*100
sys=tf(num,den);
t=0:0.1:10;
[y_step,t]=step(sys,t);
plot(t,y_step)