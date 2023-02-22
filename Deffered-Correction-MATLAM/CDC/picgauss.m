close all
clear all


a=2;b=4;
n=10;
h=(b-a)/n;
t=a:h:b;
f=@(x) y^2;
y0=1;
w=[5/9, 8/9, 5/9]; phi=[-sqrt(3/5), 0, sqrt(3/5)];