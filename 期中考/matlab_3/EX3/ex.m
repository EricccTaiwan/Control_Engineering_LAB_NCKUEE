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


figure(2);
w2=linspace(0,2*pi,100);
ejw=exp(j*w2);
r1=real(ejw);
i1=imag(ejw);
[r,i]=nyquist(num,den,w);
plot(r1,i1,r,i);
axis([-1,1,-1,1]);
grid
title('Nyquist Diagram');
xlabel('Real Axes');
ylabel('Imaginary Axes');


figure(3);
subplot(211);
[num2,den2]=cloop(num,den,1);
[mag2,phase2]=bode(num2,den2,w);
semilogx(w,20*log10(mag2));
grid;
title('Bode diagram (closed-loop system)');
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (db)');

subplot(212);
rlocus(num,den);
sgrid;
title('Root Locus Diagram');
xlabel('Real Axes');
ylabel('Imaginary Axes');
