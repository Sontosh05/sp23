clear all
close all
% Cubic spline s(x)=aj+bj(x-xj)+cj(x-xj)^2+dj(x-xj)^3

x=[0, 0.2, 0.4, 0.6, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5]; % data points
f=exp(sin(x)); % function
m=12;
h=zeros(1, m-1);
a=zeros(1, m);
% step size
for i=1:m-1
    h(i)=x(i+1)-x(i);
end
% calculating the constant coefficent a
for k=1:m
    a(k)=f(k);
end
% Now we compute the coefficient c since c is dependent on a's
% The expression for computing c is 
% h(j-1)c(j-1)+2(h(j-1)+h(j))+h(j)c(j+1)=3/h(j) (a(j+1)-a(j))-3/h(j-1)
% (a(j)-a(j-1)) (*) 
% we call the right hand side of the above equation as matrix B where the
% first and last entry (which is 0) of B is coming from the Natural spline boundary condition.

B=zeros(1, m);
% internal values
for k=2:m-1
    B(k)=(3/h(k))*(a(k+1)-a(k))-(3/h(k-1))*(a(k)-a(k-1));
end
% Now we build the matrix A for the left hand side of the above eqn (*)

A=zeros(m, m); % initialize the matrix
A(1, 1)=1; % Natural Boundary condition
A(m, m)=1; % Natural Boundary condition
for j=1:m  % Here i and j represents row and column of the matrix A
    for i=2:m-1
        if i==j
            A(i, j)=2*(h(i-1)+h(i)); % Main diagonal
        elseif i==j+1
                A(i, j)=h(i-1);      % Below main diagonal 
        elseif i==j-1
            A(i, j)=h(i);            % Above main diagonal
        end
    end
end
% coefficient cj

c=A\B'; % solves c=A^-1*B

% Compute the coefficinet bj and dj Formula ( bj = 1/hj (a(j+1)-a(j))-hj/3(2c(j)+c(j+1))) for j=1,...m-1
% dj=1/3h(j) (c(j+1)-c(j))
for j=1:m-1
    b(j)=(1/h(j))*(a(j+1)-a(j))-(h(j)/3)*(2*c(j)+c(j+1));
    d(j)=(c(j+1)-c(j))/(3*h(j));
end
% Ploting the cubic spline
for p=1:m-1
    t=x(p):0.01:x(p+1);
    S=a(p)+b(p)*(t-x(p))+c(p)*(t-x(p)).^2+d(p)*(t-x(p)).^3; % Spline
    s{p}=S;
    T{p}=t;
    hold on
end
spl=[s{1,1},s{1,2},s{1,3},s{1,4},s{1,5},s{1,6}, s{1,7}, s{1,8},s{1,9}, s{1,10}, s{1,11}];
tp=[T{1,1},T{1,2},T{1,3},T{1,4},T{1,5},T{1,6},T{1,7},T{1,8},T{1,9},T{1,10},T{1,11}];
% figure(1)
% plot(x, f, 'o', 'LineWidth',5);
% hold on
% plot(tp, spl , 'x', 'LineWidth',2);
% legend('Function', 'Spline', 'Location','northwest')
v=exp(sin(tp)); % function value test points

%error

for i=1:5
z(i)=5*(2^i);
end
for l=1:5
    nd=z(l);
err(l)=norm(v(nd+1)-spl(nd+1))
end
figure(1), clf
loglog(z, err, '-ko', 'MarkerSize',12)