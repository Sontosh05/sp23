function [t, E,unew]=correctionfe(Ef,uprime, u, t0, tend, E0, N)
E=zeros(1,N+1);
unew=zeros(1, N+1);
t=linspace(t0, tend, N+1);
E(1)=E0;
unew(1)=1;
dt=(tend-t0)/N;
for i=1:N
    E(i+1)=E(i)+dt*Ef(uprime(i), t(i), u(i), E(i));
    unew(i)=u(i)+E(i);
end

