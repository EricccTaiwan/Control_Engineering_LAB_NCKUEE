clc
clear all;
num=1;
den=poly([0 -1 -2]);
sys=tf(num,den);
[Gm,Pm,Wcp,Wcg]=margin(sys);
w=logspace(-1,1,100);
[mag,phase]=bode(num,den,w);
figure(1);
subplot(211);

semilogx(w,20*log10(mag));
title('Bode diagram (open-loop system)');
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (db)');
grid;
subplot(212);
semilogx(w,phase);
grid;
xlabel('Frequency (rad/sec)');
ylabel('Phase (degree)');
