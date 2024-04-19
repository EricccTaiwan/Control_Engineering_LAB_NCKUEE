clc
clf
clear

num=[1 6];
den=conv([1 4 0],[1 4 8]);
sys=tf(num,den);
rlocus(sys)
grid
