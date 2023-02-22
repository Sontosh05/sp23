function[sol]=myquad(f, a, b, n)

h=(b-a)/n;
x1=a+[0:n]*h;

np=3; % Number of Gauss-Points

[x, w]=gausslegendre(np); % Gauss Legendre abscissa and weights

sol=0;
dx=h/2; % (b-a)/2
ts=zeros(np,1);
ds=0;
for k=1:n
    avg=(x1(k)+x1(k+1))/2; % (a+b)/2
    for j=1:np
      ts(j)=dx*x(j)+avg;
      dy=dx*w(j)*f(ts(j));
      ds=ds+dy;
    end
    sol=ds;
end

end
