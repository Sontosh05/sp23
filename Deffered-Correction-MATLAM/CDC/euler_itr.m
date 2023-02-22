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

for i=2:n+1
    y(i, :)=y(i-1,:)+h*euler_st(t(i-1), y(i-1,:)); % Euler Steps
end
    Cs=spline(t, y'); % Cubic Spline
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1.0 1.0];
    for i=2:n+1
        E(i,:)=E(i-1,:)+h*eivp(t(i-1), y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    y2=ynew;
    y1=y;
    y=ynew;
    Cs=spline(t, y'); % Cubic Spline
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1.0 1.0];
    for i=2:n+1
        E(i,:)=E(i-1,:)+h*eivp(t(i-1), y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    y3=ynew;
    y=ynew;
    Cs=spline(t, y'); % Cubic Spline
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1.0 1.0];
    for i=2:n+1
        E(i,:)=E(i-1,:)+h*eivp(t(i-1), y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    y4=ynew;
    y=ynew;
    Cs=spline(t, y'); % Cubic Spline
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1.0 1.0];
    for i=2:n+1
        E(i,:)=E(i-1,:)+h*eivp(t(i-1), y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    y5=ynew;
    y=ynew;
    Cs=spline(t, y'); % Cubic Spline
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1.0 1.0];
    for i=2:n+1
        E(i,:)=E(i-1,:)+h*eivp(t(i-1), y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    y6=ynew;
    y=ynew;
    Cs=spline(t, y'); % Cubic Spline
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); 
    yprime=deP'; % Derivative of the Polynomial
    % Error IVP E'=f(t, y+E)-y'
    E(1,:)=[0.0 0.0];
    ynew(1, :)=[1.0 1.0];
    for i=2:n+1
        E(i,:)=E(i-1,:)+h*eivp(t(i-1), y(i-1,:), E(i-1,:), yprime(i-1,:)); % kth Euler steps
        ynew(i,:)= y(i,:)+E(i,:);
    end
    y7=ynew;
  
% %Storing Error at nodes, 10, 20, ...160
err1(j)=norm(yexact(n,:)-y1(n,:));
err2(j)=norm(yexact(n,:)-y2(n,:));
err3(j)=norm(yexact(n,:)-y3(n,:));
err4(j)=norm(yexact(n,:)-y4(n,:));
err5(j)=norm(yexact(n,:)-y5(n,:));
err6(j)=norm(yexact(n,:)-y6(n,:));
err7(j)=norm(yexact(n,:)-y7(n,:));
end

loglog(N, err1, '-ko','MarkerSize',12);
hold on
loglog(N, err2, '-dr','MarkerSize',12);
loglog(N, err3, '-dg','MarkerSize',12);
loglog(N, err4, '-db','MarkerSize',12);
loglog(N, err5, '-dm','MarkerSize',12);
loglog(N, err6, '-sk','MarkerSize',12);
loglog(N, err7, '-*r','MarkerSize',12);
legend('Provisional', '1 Correction', '2 Corrections', '3 Corrections', '4 Corrections')
p=polyfit(log(N'),log(err2),1);
slope = p(1)
p=polyfit(log(N'),log(err3),1);
slope = p(1)
p=polyfit(log(N'),log(err4),1);
slope = p(1)
p=polyfit(log(N'),log(err5),1);
slope = p(1)
p=polyfit(log(N'),log(err6),1);
slope = p(1)
p=polyfit(log(N'),log(err7),1);
slope = p(1)