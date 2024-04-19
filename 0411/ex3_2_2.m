clc;clear all;close all
kd=0.1;
kp=1;
num=[40*kd 40*kp];
den=[1 2 0];
[num1,num2]=cloop(num,den,-1);
sys2=tf(num1,num2)
margin(sys2)
