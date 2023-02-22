function [t, u]=ForwardEuler(f, a, b, N)
h=(b-a)/N;
t=a:h:b;

u=[20; 5; -5];

for i=2:N+1
    u(:, i)=u(:,i-1)+h*f(t(:,i-1), u(:,i-1));
end

end