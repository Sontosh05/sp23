function[t, u]=forwardE(f, t0, tend, u0, N)

ndf=length(u0);
u=zeros(N+1);
t=linspace(t0, tend, N+1);
u(1)=u0;
dt=(tend-t0)/N;
for i=1:N
    u(i+1)=u(i)+dt*f(t(i), u(i));
end