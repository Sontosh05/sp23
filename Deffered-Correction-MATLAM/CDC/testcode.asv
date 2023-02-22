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
    F=@(t,y) y; % dy/dx=y
    exact=exp(t);
    y(1)=1;
    i=1;
    for t=a+h:h:b
        i=i+1;
        y(i)=y(i-1)+h*F(t, y(i-1)); %Euler steps
        tt(i)=t;
    end
    Cs=spline(tt, y');
    P=ppval(Cs, tt); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, tt); % Derivative of the Polynomial
    yprime=deP;

    Ef=@(yprime, t, y, E) (y+E)-yprime;

    E(1)=0;
    ynew(1)=1;
    i=1;
    for t=a+h:h:b
        i=i+1;
        E(i) = E(i-1)+h*Ef(yprime(i-1), t, y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end

    y2=ynew;
    y1=y;
    y=ynew;
    Cs=spline(tt, y);
    P=ppval(Cs, tt); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, tt); % Derivative of the Polynomial
    yprime=deP;

    Ef=@(yprime, t, y, E) (y+E)-yprime;

    E(1)=0;
    ynew(1)=1;
    i=1;
    for t=a+h:h:b
        i=i+1;

        E(i) = E(i-1)+h*Ef(yprime(i-1), t, y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end

    y3=ynew;
    y=ynew;
    Cs=spline(tt, y);
    P=ppval(Cs, tt); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, tt); % Derivative of the Polynomial
    yprime=deP;

    Ef=@(yprime, t, y, E) (y+E)-yprime;

    E(1)=0;
    ynew(1)=1;
    i=1;
    for t=a+h:h:b
        i=i+1;

        E(i) = E(i-1)+h*Ef(yprime(i-1), t, y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end
    y4=ynew;
    y=ynew;
    Cs=spline(tt, y);
    P=ppval(Cs, tt); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, tt); % Derivative of the Polynomial
    yprime=deP;

    Ef=@(yprime, t, y, E) (y+E)-yprime;

    E(1)=0;
    ynew(1)=1;
    i=1;
    for t=a+h:h:b
        i=i+1;
        E(i) = E(i-1)+h*Ef(yprime(i-1), t, y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end
    y5=ynew;
    y=ynew;
    Cs=spline(tt, y);
    P=ppval(Cs, tt); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, tt); % Derivative of the Polynomial
    yprime=deP;

    Ef=@(yprime, t, y, E) (y+E)-yprime;

    E(1)=0;
    ynew(1)=1;
    i=1;
    for t=a+h:h:b
        i=i+1;
        E(i) = E(i-1)+h*Ef(yprime(i-1), t, y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end
    y6=ynew;
    err1(j)=norm(exact(n)-y1(n));
    err2(j)=norm(exact(n)-y2(n));
    err3(j)=norm(exact(n)-y3(n));
    err4(j)=norm(exact(n)-y4(n));
    err5(j)=norm(exact(n)-y5(n));
    %err6(j)=norm(exact(n)-y6(n));
end
clf
loglog(N, err1, '-ko','MarkerSize',12);
hold on
loglog(N, err2, '-sb', 'MarkerSize', 10);
loglog(N, err3, '-dr', 'MarkerSize', 10);
loglog(N, err4, '-dg', 'MarkerSize', 10);
loglog(N, err5, '-dm', 'MarkerSize', 10);
%loglog(N, err6, '-dm', 'MarkerSize', 10);
legend('Provisional', '1 Correction', '2 Corrections', '3 Corrections', '4 Corrections')
p=polyfit(log(N'),log(err3),1);
slope = p(1)
p=polyfit(log(N'),log(err4),1);
slope = p(1)
p=polyfit(log(N'),log(err5),1);
slope = p(1)
% p=polyfit(log(N'),log(err6),1);
% slope = p(1)



