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
    F=@(t,y) t*y; % dy/dx=y
    exact=exp((t.^2)/2);
    y(1)=1;
 
    for i=2:n+1
        
        y(i)=y(i-1)+h*F(t(i-1), y(i-1)); %Euler steps
        
    end
    y1=y;
    for q=1:4
        pol=polyfit(t, y, 10);
        P=polyval(pol, t); % Polynomial values
        yp1=polyder(pol);
        yp=polyval(yp1, t);
        Ef=@(yp, t, y, E) t*(y+E)-yp;

        E(1)=0;
        ynew(1)=1;

        for i=2:n+1
            E(i) = E(i-1)+h*Ef(yp(i-1), t(i-1), y(i-1), E(i-1)); %Euler steps
            ynew(i)=y(i)+E(i);
        end
     
        yz{q}=ynew;
        y=ynew;
    
    end
    y2=yz{1,1};
    y3=yz{1,2};
    y4=yz{1,3};
    y5=yz{1,4};

    err1(j)=norm(exact(n)-y1(n));
    err2(j)=norm(exact(n)-y2(n));
    err3(j)=norm(exact(n)-y3(n));
    err4(j)=norm(exact(n)-y4(n));
    err5(j)=norm(exact(n)-y5(n));
end
loglog(N, err1, '-ko', 'MarkerSize',12);
hold on
loglog(N, err2, '-sb', 'MarkerSize',12);
loglog(N, err3, '-sr', 'MarkerSize',12);
loglog(N, err4, '-sg', 'MarkerSize',12);
loglog(N, err5, '-sm', 'MarkerSize',12);
p=polyfit(log(N'),log(err5),1);
slope = p(1)



