clear all
close all
lambda=-1;
f=@(t, x) lambda*x;
u0=1;
K=10;
tspan=[0 1];
T=1;
N=10;
MF=20;
MG=1;
F=@(t0, t1, u0) endsol(lambda, t0, t1, u0, MF);
G=@(t0, t1, u0) endsol(lambda, t0, t1, u0, MG);
U=parareal(F, G, T, u0, N, K);
% Convergence analysis
%err=zeros(K+1);
[t, u]=backwardE(lambda, tspan, u0, MF*N);
for k=1:K+1
    err(k)=max(abs(u(1:MF:end)'-U{k}));
end
semilogy(err)