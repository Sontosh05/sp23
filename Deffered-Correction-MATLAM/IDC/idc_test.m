clear all
close all
K=8;
for i=1:K
    N(i)=floor(10*1.8^(i-1));
end
itr=8;
err=zeros(K,itr);
% Convergence Study
for p=1:K
    a=0;b=0.5;
    n=N(p);
    h=(b-a)/n;
    y0=1;
    E0=0;
     % Number of correction
    f=@(y, t) t.*y.^2.*cos(t).^2;
    [t, y]=myidc(f, a, b, h, y0, E0,n, itr);
    exact=-8./(-9+2.*t.^2+cos(2.*t)+2*t.*sin(2.*t));
    %Storing the errors
    for j=1:(itr+1)
        err(p,j)=norm(exact(n+1)-y{j}(n+1))+eps;
    end
end
clf
for j=1:(itr+1)
    loglog(N',err(:,j))
    hold on
    p=polyfit(log(N'), log(err(:,j)),1);
    slope=p(1)
end
hold off

legend('Provisional', '1st correction', '2nd correction', '3rd correction','4th correction')
