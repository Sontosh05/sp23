function [pint, L]=lagpoly(t, f)
d=0;
n=length(t);
for k=1:n
    V=1;
    for l=1:n
        if k~=l
            V=conv(V, [1, -t(l)])/(t(k)-t(l)); %weights of the polynomial
        end
    end
    L(k,:)=V;
    pint(k,:)=polyint(L(k,:));
    %pval(k)=f(k)*(polyval(pint(k,:),1)-polyval(pint(k,:), 0));
end


