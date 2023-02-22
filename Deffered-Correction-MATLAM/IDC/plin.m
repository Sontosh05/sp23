clear all
close all

% Picard iteration


a=0;b=1;

n=160;
h=(b-a)/n;



f=3-y1;
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

for i=1:5
    N(i)=10*2^(i-1);
end
for j=1:5
n=N(j);    
h=(b-a)/n;
i=0;y1s=zeros(n+1, 1);
x=a:h:b;
exact=exp(-x).*(3*exp(x)-2);
for k=a:h:b
    i=i+1;
    y1s(i)=y1s(i)+subs(f1, t, k);
    xx(i)=k;
end

err(j)=norm(y1s(n+1)-y1s(n));

end
figure(1), clf;
loglog(N, err, '-ko', 'MarkerSize',12);
p=polyfit(log(N'),log(err),1);
slope = p(1)