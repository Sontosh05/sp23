clear all
close all

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
i=1;
for t=a+h:h:b
    i=i+1;
    y(i, :)=y(i-1,:)+h*euler_st(t, y(i-1,:)); % Euler Steps
    tt(i)=t;
end
    Cs=spline(tt, y'); % Cubic Spline
    P=ppval(Cs, tt); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, tt); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1 1];
    i=1;
    for t=a+h:h:b
        i=i+1;
        E(i,:)=E(i-1)+h*eivp(t, y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    
%Storing Error at nodes, 10, 20, ...160
err1(j)=norm(yexact(n,:)-y(n,:));
err2(j)=norm(yexact(n,:)-ynew(n,:));
end

loglog(N, err1, '-ko','MarkerSize',12);
hold on
loglog(N, err2, '-s','MarkerSize',12);
legend('Provisonal', '1 correction')
% p=polyfit(log(N'),log(Error),1);
% slope = p(1)