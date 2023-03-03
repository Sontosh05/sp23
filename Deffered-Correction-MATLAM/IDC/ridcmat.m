function [tval, y, prs]=ridcmat(f, a, b, h, y0, E0, n, itr)

% Creating a 3D array to store my y solutions
y=zeros(1, n+1, itr+1);
% generating my provisional solution
[tval, prs]=forwardE(f, a, b, y0, n);
% parsing the provision to the 1st iteration
y(1, :, 1)=prs;

% Error function
errfun=@(y, E, t) f(y+E, t) - f(y, t);   % f(y+e)-f(y)
E(1)=E0;
% Correction loop starts from here.

for i=1:itr

    y(1, 1, i+1)=y0;
    nfval=f(y(1, :, i), tval); % New function value with updates

    % First ith steps of correction K
    for k=2:i
        
            E(k)=E(k-1)-(y(1, k, i)-y(1,k-1, i)) + ...
            h*errfun(y(1, k-1, i), E(k-1), tval(k-1)) +...
            Lpoly(tval(1:i+1), nfval(1:i+1),tval(k-1), tval(k));
            y(1, k, i+1)=y(1, k, i)+E(k);
        
    end

    for j=i+1:n+1
        E(j)=E(j-1)-(y(1, j, i)-y(1,j-1, i))+h*errfun(y(1, j-1, i),E(j-1),tval(j-1))+...
            Lpoly(tval(j-i:j), nfval(j-i:j),tval(j-1), tval(j));
        y(1, j, i+1)=y(1, j, i)+E(j);
    end
end

end