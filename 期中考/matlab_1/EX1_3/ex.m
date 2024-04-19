num=[1];
den=[1 1];
sys1=tf(num,den);

z=[1 -20];
p=[2 2 5];
sys2=zpk(z,p,1);
sysp=parallel(sys1,sys2);
syss=series(sys1,sys2);
sysf=feedback(sys1,1,-1);
[num_all,den_all]=tfdata(sysf,'v');
[z_all,p_all,k_all]=zpkdata(sysf,'v');
get(sysf);


t=0:0.1:10;
[y_impulse,t]=impulse(sys1,t);
[y_step,t]=step(sys1,t);

figure(1);
subplot(211);
plot(t,y_impulse,'b--*');
xlabel('Time (sec)');
ylabel('y-impulse(t)');
text(0,1,'(0,1)');
legend('Impulse response');
title('Response Plot');

subplot(212);
plot(t,y_step,'g:o');
xlabel('Time (sec)');
ylabel('y-step(t)');
text(0,0,'(0,0)');
legend('Step response');
hold on;
