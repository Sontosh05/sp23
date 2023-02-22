function[t, y]=forwardE(f, a, b, y0, n)

y=zeros(1,n+1);
t=linspace(a, b, n+1);
y(1)=y0;
h=(b-a)/n;
for i=1:n
    y(i+1)=y(i)+h*f(y(i), t(i));
end
end