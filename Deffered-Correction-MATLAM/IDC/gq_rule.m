clear all
close all

a=0; b=0.5;
n=100;h=(b-a)/n;
y(1)=1.0;


f= @(y) y^2;

for i=1:n
    y(i+1)=y(i)+h*myquad(f, a, b, n);
end