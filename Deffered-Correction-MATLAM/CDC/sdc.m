clear all
close all
% syms t y

N=zeros(5,1);
for i=1:5
    N(i)=10*2^(i-1);
end

for j=1:5
n=N(j);
a=0;
b=1;
h=(b-a)/n;
t=a:h:b;
%Exact Solution
y1exact=exp(t).*(cos(0.5*t.^2)+sin(0.5*t.^2));
y2exact=exp(t).*(cos(0.5*t.^2)-sin(0.5*t.^2));
yexact=[y1exact' y2exact'];
y(1,:)=[1.0 1.0]; %initial condition
% fg=@euler_st;
% f1=fg;
% f1(1,:)=y(1,:)+subs(int(f1, t, 0, t), y, y(1,:));
% 
% for j=a:h:b
%     i=i+1;
%     fn=subs(fg, y, f1);
%     f1=y(1,:)+int(fn, t);
%     xx(i)=j;
% end
%    
end

