clear all
close all
for i=1:5
    N(i)=10*2^(i-1);
end
for j=1:5
  n=N(j);
  a=0;b=1;
  h=(b-a)/n;
  t=a:h:b;
  F=@(t,y) t; % dy/dx=t
  exact=0.5*t.^2 +1;
  y(1)=1;
  for i=2:n+1
      y(i)=y(i-1)+h*F(t(i-1),y(i-1)); %Euler steps
  end
  Cs=spline(t, y);
  xx=linspace(0, 1, n);
  P=ppval(Cs, t); % Polynomial
  deCs=fnder(Cs);
  deP=ppval(deCs, t); % Derivative of the Polynomial
  yprime=deP;
  Ef=@(t, y, E, yprime) t+E-yprime;
  E(1)=0;
  ynew(1)=1;
  for i=2:n+1
      E(i) = E(i-1)+h*Ef(t(i-1), y(i-1), E(i-1), yprime(i-1)); %Euler steps
      ynew(i)=y(i)+E(i);
  end
  y2=ynew;
  y1=y;
  y=ynew;
  Cs=spline(t, y);
  P=ppval(Cs, t); % Polynomial
  deCs=fnder(Cs);
  deP=ppval(deCs, t); % Derivative of the Polynomial
  yprime=deP;
  Ef=@(t, y, E, yprime) t+E-yprime;
  E(1)=0;
  ynew(1)=1;
  for i=2:n+1
      E(i) = E(i-1)+h*Ef(t(i-1), y(i-1), E(i-1), yprime(i-1)); %Euler steps
      ynew(i)=y(i)+E(i);
  end
  y3=ynew;
  y=ynew;
%   Cs=spline(t, y);
%   P=ppval(Cs, t); % Polynomial
%   deCs=fnder(Cs);
%   deP=ppval(deCs, t); % Derivative of the Polynomial
%   yprime=deP;
%   Ef=@(yprime, t, y, E) t+E-yprime;
%   E(1)=0;
%   ynew(1)=1.0;
%   for i=2:n+1
%       E(i) = E(i-1)+h*Ef(yprime(i-1), t(i-1), y(i-1), E(i-1)); %Euler steps
%       ynew(i)=y(i)+E(i);
%   end
%   y4=ynew;
%   y=ynew;
%   Cs=spline(t, y);
%   P=ppval(Cs, t); % Polynomial
%   deCs=fnder(Cs);
%   deP=ppval(deCs, t); % Derivative of the Polynomial
%   yprime=deP;
%   Ef=@(yprime, t, y, E) t+E-yprime;
%   E(1)=0;
%   ynew(1)=1.0;
%   for i=2:n+1
%       E(i) = E(i)+h*Ef(yprime(i-1), t(i-1), y(i-1), E(i-1)); %Euler steps
%       ynew(i)=y(i)+E(i);
%   end
%   y5=ynew;
  err1(j)=norm(exact(n)-y1(n));
  err2(j)=norm(exact(n)-y2(n));
  err3(j)=norm(exact(n)-y3(n)); 
%   err4(j)=norm(exact(n)-y4(n)); 
%   err5(j)=norm(exact(n)-y5(n)); 
end
% 
loglog(N, err1, '-ko','MarkerSize',12);
hold on
loglog(N, err2, '-sb', 'MarkerSize', 10);
loglog(N, err3, '-dr', 'MarkerSize', 10);
% loglog(N, err4, '-dg', 'MarkerSize', 10);
% loglog(N, err5, '-dm', 'MarkerSize', 10);
% legend('Provisional', '1 Correction', '2 Corrections', '3 Corrections', '4 Corrections')