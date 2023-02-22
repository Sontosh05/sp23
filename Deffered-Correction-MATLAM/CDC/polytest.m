clear all
close all

x=linspace(0, 2*pi, 10);
y=sin(x);

sp=spline(x, y);

u=polyfit(x, y, 3);
u2=polyval(u, x);
[u1,S]=polyfit(x, y, 4);
x1=linspace(0, 2*pi);
y1=polyval(u1, x1, S);
yp1=polyder(u);
yp11=polyval(yp1,x1);
cs=spline(x, y);
dcs=fnder(cs);
yp2=ppval(dcs, x1);
