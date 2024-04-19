clc
clf
clear

num=[1 3 3];
den=conv([1 1 0 0],[1 30 200]);
sys=tf(num,den);
rlocus(sys)
grid
