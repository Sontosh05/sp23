% Numerical Integration by Lagrange polynomial.
function [apprx]=Lpoly(t, f, a, b)
n=length(t);
dt=b-a;
s=(t-a)/dt;
sum=0;
for k=1:n
    V=1;
    for l=1:n
        if k~=l
            V=conv(V, poly(s(l)))/(s(k)-s(l)); %weights of the polynomial
        end
    end
    L(k,:)=V;
    pint(k,:)=polyint(V);
    pval(k)=f(k)*(polyval(pint(k,:),1)-polyval(pint(k,:), 0));
    sum=sum+pval(k);
end

apprx=dt*sum;

end