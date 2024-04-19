num=[1];
den=[1 -2 1];
sys1=tf(num,den);
z=[1 1];
p=[-3 -1 -1 -2];
sys2=zpk(z,p,12)
%sysp=parallel(sys1,sys2);
syss=series(sys1,sys2);
sysf=feedback(syss,1,-1);
[num_all,den_all]=tfdata(sysf,'v');
[z_all,p_all,k_all]=zpkdata(sysf,'v');
get(sysf);


t=0:0.1:30;
%[y_impulse,t]=impulse(sys1,t);
[y_step,t]=step(sysf,t);

figure(1);
subplot(211);
plot(t,y_step,'b--*');
xlabel('Time (sec)');
ylabel('y-step(t)');
text(0,0,'(0,0)');
legend('Step response');
title('Response Plot');

u=sysf/sys2;
[u_step,t]=step(u,t);
subplot(212);
plot(t,u_step,'g:o');
xlabel('Time (sec)');
ylabel('u(t)');
text(0,0,'(0,0)');
legend('u response');
hold on;
