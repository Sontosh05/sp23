function [t, u]=backwardE(lambda, tspan, u0, N)
dt=(tspan(2)-tspan(1))/N;
t=(tspan(1):dt:tspan(2));
u=zeros(N+1, 1);
u(1, 1)=u0;
for n=1:N
    u(n+1, 1)=u(n, 1) ./ (1-dt*lambda);
end

end