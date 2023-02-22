function [t, y]=myidc(f, a, b, h, y0, n, itr)
d=length(y0);
y=zeros(itr+1, d, n+1);


% Forward Euler method to get the provisional solution
[t, temp]=forwardE(f, a, b, y0, n);
y(1,:,:)=temp; % storing my predictor

% Error function
errfun=@(y, E, t) f(y+E, t) - f(y, t);   % f(y+e)-f(y)
E=zeros(d, n+1);

% Correction loop starts from here.

for i=1:itr
    y(i+1, :, 1)=y0; % Initial condition
    nfval=f(y(i, :, :), t); % New function value with updates

    % First ith steps of correction K
    for k=2:i
        E(:,k)=E(:,k-1)-(y(i,:,k)-y(i,:,k-1)) + ...
            h*errfun(y(i,:,k-1), E(:,k-1), t(k-1)) +...
            Lpoly(t(1:i+1), nfval(1:i+1),t(k-1), t(k));
        y{i+1}(k)=y{i}(k)+E(k);
    end

    for j=i+1:n+1
        E(j)=E(j-1)-(y{i}(j)-y{i}(j-1))+h*errfun(y{i}(j-1),E(j-1),t(j-1))+...
            Lpoly(t(j-i:j), nfval(j-i:j),t(j-1), t(j));
        y{i+1}(j)=y{i}(j)+E(j);
    end
end

end