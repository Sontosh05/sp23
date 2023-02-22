clear all
close all


for i=1:5
    N(i)=10*2^(i-1);
end

for p=1:5
    n=N(p);
    a1=0;b1=1;
    h=(b1-a1)/n;
    t=a1:h:b1;
    F=@(y) y*(1-y);
    exact=2.*exp(t)./(2*exp(t)-1);
    y(1)=2;
    
    for i=2:n+1
        y(i)=y(i-1)+h*F(y(i-1)); %Euler steps
    end
    
    y1=y;

% Correction loop starts here
for q=1:6
    Cs=spline(t, y);
    P=ppval(Cs, t); % Polynomial
    deCs=fnder(Cs);
    deP=ppval(deCs, t); % Derivative of the Polynomial
    yprime=deP;

% Cubic Spline and derivative of the cubic spline ends here.

% Error value problem
Ef=@(yprime, y, E) ((y+E)-(y+E)^2)-yprime;

    E(1)=0;
    ynew(1)=2;
 
    for i=2:n+1
        E(i) = E(i-1)+h*Ef(yprime(i-1), y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end
    yz{q}=ynew;
    y=ynew;
end % correction loop ends here
    y2=yz{1,1};
    y3=yz{1,2};
    y4=yz{1,3};
    y5=yz{1,4};
    y6=yz{1,5};
    y7=yz{1,6};

    err1(p)=norm(exact(n)-y1(n));
    err2(p)=norm(exact(n)-y2(n));
    err3(p)=norm(exact(n)-y3(n));
    err4(p)=norm(exact(n)-y4(n));
    err5(p)=norm(exact(n)-y5(n));
    err6(p)=norm(exact(n)-y6(n));
    err7(p)=norm(exact(n)-y7(n));
end
loglog(N, err1, '-ko', 'MarkerSize',12);
hold on
loglog(N, err2, '-sb', 'MarkerSize',12);
loglog(N, err3, '-sr', 'MarkerSize',12);
loglog(N, err4, '-sg', 'MarkerSize',12);
loglog(N, err5, '-sm', 'MarkerSize',12);
loglog(N, err6, '-sy', 'MarkerSize',12);
loglog(N, err7, '-sc', 'MarkerSize',12);
p=polyfit(log(N'),log(err7),1);
slope = p(1)