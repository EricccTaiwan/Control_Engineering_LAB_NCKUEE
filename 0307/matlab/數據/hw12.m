clc;clear;close all;
tf1 = tf([1],[1 -2 1]);
tf2a = tf([12 ],[1 3]);
tf2b = tf([1 -1],[1 1]);
tf2c = tf([1],[1 2]);
tf2 =tf2a * tf2b* tf2b *tf2c;
syss =series(tf1,tf2);
sysf = feedback(syss,-1);
t=0:0.1:30;
[y_step,t] = step(sysf,t);
figure(1)
plot(t,y_step)
grid on;
title('實驗練習1-4 , y')
xlabel('t')
ylabel('y_step')




