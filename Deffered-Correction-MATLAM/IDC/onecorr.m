function[t, ynew]=onecorr(Erf, f, y, a, b, n)
t=linspace(a, b, n+1);
E(1)=0;
h=(b-a)/n;
ynew(1)=1.0;
for j=1:n
    E(j+1)=E(j)-(y(j+1)-y(j)) + h*Erf(y(j), E(j)) + (h/2)*(f(y(j+1))+f(y(j)));
    ynew(j+1)=y(j+1)+E(j+1);
end
