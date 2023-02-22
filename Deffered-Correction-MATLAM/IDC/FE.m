% function[sol]=ForwardEuler(f, y0, a, b, t)
% y0=1;
% h=(b-a)/n;
% t=a+[0:n]*h;
% end

clear all
close all

a=0; b=1;
n=160;
h=(b-a)/n
t=a+[0:n]*h;
y(1)=1;
f=@(t, y) t*y;
for i=2:n+1
    y(i)=y(i-1)+h*f(t(i-1), y(i-1));
end
plot(t, y, 'b')