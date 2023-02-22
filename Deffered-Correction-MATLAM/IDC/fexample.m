clear all
close all

for k=1:5
    nodes(k)=10*2^(k-1);
end

for j=1:5
t0=0; tend=1;
N=nodes(j);u0=1;
dt=(tend-t0)/N;
t=linspace(t0, tend, N+1);

f=@(t, u) u;
exact=exp(t);
[t, u]=forwardE(f, t0, tend,u0, N);

u1=u;

Cs=spline(t, u);
P=ppval(Cs, t); % Polynomial
deCs=fnder(Cs);
deP=ppval(deCs, t); % Derivative of the Polynomial
uprime=deP;

Ef=@(uprime, t, u, E) (u+E).^2-uprime;
unew=zeros(1, N+1);
unew(1)=1;
E(1)=0;
for i=1:N
    E(i+1)=E(i)+dt*Ef(uprime(i), t(i), u(i), E(i));
    unew(i)=u(i)+E(i);
end
err1(j)=norm(exact(N)-u1(N));

loglog(N, err1, '-ko', 'MarkerSize',12);
end
