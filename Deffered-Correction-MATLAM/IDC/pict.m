clear all;
close all; 

a=0; b=0.5;
n=160;
h=(b-a)/n;
syms t y

f=y^2;
y0=1;

%initial Substitution
f1=y0+subs(int(f, t, 0, t), y, y0);


iter=1;
w=[0.555555556, 0.888888889, 0.555555556]; xi=[-0.774596669, 0.000000000, 0.774596669];
% n=3;
ys=0;yval=zeros(1,n);

%Picard Iteration
for i=1:iter
    fn1=subs(f, y, f1); % y1, susbtitued by f1 in the original function
    f1=y0+int(fn1, t)
    
end

F1=matlabFunction(f1); % converting the symbolic system to function of variable


i=0;y1s=zeros(n+1, 1);

for k=a:h:b
    i=i+1;
    y1s(i)=y1s(i)+subs(f1, t, k);
    xx(i)=k;
end

% F=@(x) F1(((b-a)*x+(a+b))/2); %Transfering the function (t) to func(x) so that the integration limit becomes [-1, 1]
% n=3;
% y0=1;
% w=[0.555555556, 0.888888889, 0.555555556]; xi=[-0.774596669, 0.000000000, 0.774596669];
% %w=[1, 1]; xi=[1/sqrt(3), -1/sqrt(3)];
% %G=((b-a)/2)*(w(1)*F(xi(1))+w(2)*F(xi(2))+w(3)*F(xi(3)));
% ys=0;yval=zeros(1,n);
% for i=1:n
%     ys=ys+((b-a)/2)*(w(i)*F(xi(i)));
%     yval(i)=ys;
% end
% % Summing up
% y1=zeros(1,n);
% for j=1:n
%     y1(j)=y1(j)+y0+yval(j);
% end
