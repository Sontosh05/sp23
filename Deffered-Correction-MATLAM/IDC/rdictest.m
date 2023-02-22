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
    f=@(y, t) t.^2.*y.*sin(t);
    % Forward Euler method to get the provisional solution
    [t, y]=forwardE(f, a, b, y0, n);
    exact=exp(-2-(-2+t.^2).*cos(t)+2.*t.*sin(t));
    % Error function
    errfun=@(y, E, t) f(y+E, t) - f(y, t);   % f(y+e)-f(y)
    E(1)=E0;
    % Correction loop starts from here.
    ynew(1)=y0; % Initial condition
 for i=1:itr
    
    nfval=f(y, t); % New function value with updates

    % First ith steps of correction K
    for k=2:i
        E(k)=E(k-1)-(y(k)-y(k-1)) + ...
            h*errfun(y(k-1), E(k-1), t(k-1)) +...
            Lpoly(t(1:i+1), nfval(1:i+1),t(k-1), t(k));
        ynew(k)=y(k)+E(k);
    end

    for j=i+1:n+1
        E(j)=E(j-1)-(y(j)-y(j-1))+h*errfun(y(j-1),E(j-1),t(j-1))+...
            Lpoly(t(j-i:j), nfval(j-i:j),t(j-1), t(j));
        ynew(j)=y(j)+E(j);
    end
    y=ynew;
    
end
    
end
