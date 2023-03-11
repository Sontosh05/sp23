function U=parareal(F, G, T, u0, N, K)

dT=T/N;
TT=0:dT:T;
Go=zeros(N+1);
Gn=zeros(N+1);
U{1}(1)=u0;
for n=1:N
    Go(n+1)=G(TT(n), TT(n+1), U{1}(n));
    U{1}(n+1)=Go(n+1);
end
for k=1:K
    for n=1:N
        Fn(n+1)=F(TT(n), TT(n+1), U{k}(n));
    end
    U{k+1}(1)=u0;
    for n=1:N
        Gn(n+1)=G(TT(n), TT(n+1), U{k+1}(n));
        U{k+1}(n+1)=Fn(n+1)+Gn(n+1)-Go(n+1);
    end
    Go=Gn;
end
end