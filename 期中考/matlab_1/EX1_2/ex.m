clc

num=[1];
den=[1 1];
sys1=tf(num,den);

z=[20];
p=[2 2 5];
sys2=zpk(z,p,1)

sysp=parallel(sys1,sys2);

syss=series(sys1,sys2);

sysf=feedback(sys1,1,-1);

[num_all,den_all]=tfdata(sysf,'v');
[z_all,p_all,k_all]=zpkdata(sysf,'v');
get(sysf);
get(syss);
