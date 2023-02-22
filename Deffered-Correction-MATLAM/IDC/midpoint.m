clear all
close all
for i=1:5
    N(i)=10*2^(i-1);
end

for j=1:5
n=N(j);
a=0; b=1;h=(b-a)/n;

f=@(x, t) 2*x*t;
ex=@(x) exp(x.^2);
y(1)=1;
y(2)=y(1)+h*f(a, y(1));

i=0;
for x=a+h:h:b
    i=i+1;
    k=i+1;
    xx(i)=x;
    y(k+1)=y(k-1)+2*h*f(x, y(k));
end
x1=a:h:b;
exact=ex(x1);

err(j)=norm(exact(n+1)-y(n+1));
end

figure(1), clf;
loglog(N, err, '-ko', 'MarkerSize',12);
p=polyfit(log(N'),log(err),1);
slope = p(1)
