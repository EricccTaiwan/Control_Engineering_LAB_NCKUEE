clc;clear all
num=[1 6 10];
den=conv([1 5 0 0],[1 18 77]);
sys=tf(num,den);
rlocus(num,den)
sgrid

t=0:0.01:100;
[y_step,t]=step(sys,t);