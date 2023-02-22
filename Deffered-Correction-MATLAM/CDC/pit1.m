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
syms t y1 y2
ex1=exp(t).*(cos(0.5*t.^2)+sin(0.5*t.^2));
ex2=exp(t).*(cos(0.5*t.^2)-sin(0.5*t.^2));
f=[t*y2+y1 -t*y1+y2];
y01=1;
y02=1;
%initial Substitution
f1=y01+subs(int(f(1), t, 0, t), [y1, y2], [y01, y02]);
f2=y02+subs(int(f(2), t, 0, t), [y1, y2], [y01, y02]);

iter=5;

%Picard Iteration
for i=1:iter
    fn1=subs(f(1), [y1, y2], [f1, f2]); % y1, y2 being susbtitued by f1, f2 on the original function
    fn2=subs(f(2), [y1, y2], [f1, f2]); % y1, y2 being susbtitued by f1, f2 on the original function
    f1=y01+int(fn1, t);
    f2=y02+int(fn2,t);
end

% Transfering systems into double and storing the solution.

i=0;y1s=zeros(n+1, 1);y2s=zeros(n+1, 1);
exact1=zeros(n+1, 1);exact2=zeros(n+1,1);

for k=a:h:b
    i=i+1;
    y1s(i)=y1s(i)+subs(f1, t, k);
    y2s(i)=y2s(i)+subs(f2, t, k);
    exact1(i)=exact1(i)+subs(ex1, t, k);
    exact2(i)=exact2(i)+subs(ex2, t, k);
    xx(i)=k;
end
y=[y1s y2s]; % coupling the y's
exact=[exact1 exact2]; % coupling the exact's


err(j)=norm(exact(n,:)-y(n,:));
end
plot(xx, y(1:161,1), '-b', xx, exact1, '-r')
