function [t, u]=problem2(f, a, b, N)
h=(b-a)/N;
t=a+[0:N]*h;

u(1)=1;

for i=2:N+1
    u(i)=u(i-1)+h*f(t(i-1), u(i-1));
end

end