clc
clf
clear

K=2.861523162;
num=K;
den=[1 2 K];
m=50;
sys=tf(num,den)
omegan=sqrt(den(3))
zeta=den(2)/(2*omegan)
Ts=3.8/(zeta*omegan)
Tp=pi/(omegan*sqrt(1-zeta^2))
pos=exp(-zeta*pi/sqrt(1-zeta^2))*100
t=0:0.1:m;
[yout,t]=step(sys,t);
max_y=max(yout)

yss=polyval(num,0)/polyval(den,0);

if zeta>1
    for i=1:m/0.1+1
        if yout(i)<0.1*yss
            t1=t(i);
        elseif yout(i)==max_y
            break;
        end
    end

    for i=1:m/0.1+1
        if yout(i)<0.9*yss
            t2=t(i);
        elseif yout(i)==max_y
            break;
        end
        end
end

t1=0;
    for i=1:m/0.1+1
        if yout(i)<1.0*yss
            t2=t(i);
        elseif yout(i)==max_y
            break;
        end
    end

Tr=t2-t1

figure(1);
plot(t,yout,'b--*');
xlabel('Time (sec)');
ylabel('yout(t)');
title('Step Response');
grid;
