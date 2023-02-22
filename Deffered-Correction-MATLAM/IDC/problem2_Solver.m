clear all
close all
format long
a=0; b=2*pi;
tol=1e-4;

N=10000;

f=@(t, u) cos(t)*u;


[t, u]=problem2(f, a, b, N);

exact=exp(sin(t));

err=abs(exact(end)-u(end));

