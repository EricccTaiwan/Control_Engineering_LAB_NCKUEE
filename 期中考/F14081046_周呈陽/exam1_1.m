clc;clear all
num1=[1];
den1=[1 -4 4];
sys1=tf(num1,den1);
num2=[2 2];
den2=[-5 -1 -1 -4];
sys2=zpk(num2,den2,10);
sys3=series(sys1,sys2);
sys4=feedback(sys3,1,-1);
t=0:0.01:10;
[y_step,t]=step(sys4,t);
plot(t,y_step)
xlabel('Time(sec)')
ylabel('y-step(t)')
title('Response Plot')
legend('Step response')