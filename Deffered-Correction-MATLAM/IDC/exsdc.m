clear all
close all

% Picard iteration

for i=1:5
    N(i)=10*2^(i-1);
end

for j=1:5

a=0;b=1;

n=N(j);
h=(b-a)/n;
x=a:h:b;
exact=exp(x);

syms t y1

f=y1;
y01=1;

%initial Substitution
f1=y01+subs(int(f, t, 0, t), y1, y01);


iter=5;

%Picard Iteration
for i=1:iter
    fn1=subs(f, y1, f1); % y1, susbtitued by f1 in the original function
    f1=y01+int(fn1, t);
end

% Transfering systems into double and storing the solution.

i=0;y1s=zeros(n+1, 1);

for k=a:h:b
    i=i+1;
    y1s(i)=y1s(i)+subs(f1, t, k);
    xx(i)=k;
end
y=y1s'; 



cs=spline(xx, y);
P=ppval(cs, xx);
plnt=polyint(P); % Polynomial Integration

% Residual function
for i=1:n+1
r(i)=y(1)+plnt(1,i)-y(i);
end

% Construct error function
%first create the polynomial for residual and find it's derivative
rsp=spline(xx, r);
drsp=fnder(rsp);
rprime=ppval(drsp, xx);

%error function

Ef=@(rprime, y, E) (y+E)+rprime;

E(1)=0;
ynew(1)=1;

for i=2:n+1
  E(i) = E(i-1)+h*Ef(rprime(i-1), y(i-1), E(i-1)); %Euler steps
  ynew(i)=y(i)+E(i);
end

err1(j)=abs(exact(n)-ynew(n));


end

figure(1), clf
loglog(N, err1, '-ko', 'MarkerSize',12);