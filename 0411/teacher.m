clc;clear all;
num=1;
den=poly([0 -1 -2]);
sys=tf(num,den);
[Gm,Pm,Wcp,Wcg]=margin(sys);
w=logspace(-1,1,100);
[mag,phase]=bode(num,den,w);
figure(1);
subplot(2,1,1);
semilogx(w,20*log10(mag));
title('Bode diagram(open-loop system)');
xlabel('Frequency(rad/sec)');
ylabel('Magnitude(db)');
grid;
subplot(2,1,2);
semilogx(w,phase);grid;
xlabel('Frequency(rad/sec)');
ylabel('Phase(degree)');

figure(2);
w2=linspace(0,2*pi,100);
ejw=exp(j*w2);
r1=real(ejw);
i1=imag(ejw);
[r,i]=nyquist(num,den,w);
plot(r1,i1,r,i);
axis([-1 ,1 ,-1,1]);
grid
title('nyquist diagram');
xlabel('real axes');
ylabel('imaginary axes');

figure(3);
subplot(2,1,1);
[num2,den2]=cloop(num,den,1);
[mag2,phase2]=bode(num2,den2,w);
semilogx(w,20*log10(mag2));grid;
title('bode diagram (closed-loop system)');
xlabel('frequency(rad/sec)');
ylabel('magnitude(db)');
subplot(2,1,2);
rlocus(num,den);
sgrid;
title('root locus diagram');
xlabel('real axes');
ylabel('imaginary axes');

rangek=[.25 .4 1 1.5 2];
character=['r' 'g' 'b' 'm' 'x'];
t=[0:.2:20];
figure(4);
hold on;
for loop =1:5
    [ntc,dtc]=cloop(num*rangek(loop),den);
    y=step(ntc,dtc,t);
    plot(y,character(loop));
    title('step response');
    xlabel('time(sec)');
    ylabel('amplitude');
end
