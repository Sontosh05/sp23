n=160;
a=0;
b=1;
h=(b-a)/n;
t=a:h:b;
y1exact=exp(t).*(cos(0.5*t.^2)+sin(0.5*t.^2));
y2exact=exp(t).*(cos(0.5*t.^2)-sin(0.5*t.^2));
yexact=[y1exact' y2exact'];
y(1,:)=[1.0 1.0]; %initial condition
i=0;
for t=a:h:b
    i=i+1;
    y(i+1, :)=y(i,:) + h*rhs(t, y(i,:));
    tt(i)=t;
end
%error
error160=norm(y(1:n+1,:)-yexact);
figure(2)
r=abs_error;
semilogy(n_steps,r)