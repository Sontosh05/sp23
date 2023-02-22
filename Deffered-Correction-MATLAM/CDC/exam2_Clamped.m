clear all
close all
% Cubic spline s(x)=aj+bj(x-xj)+cj(x-xj)^2+dj(x-xj)^3

x=[0, 1, 2, 3]; % data points
f=exp(x); % function
m=4;
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

    B(1)=3.0*(a(2)-a(1))/h(1)-3*exp(x(1));
    B(m)=3.0*exp(x(m))-3.0*(a(m)-a(m-1))/h(m-1);

    % internal values
    for l=2:m-1
        B(l)=3.0*(a(l+1)-a(l))/h(l)-3.0*(a(l)-a(l-1))/h(l-1);
    end
% Now we build the matrix A for the left hand side of the above eqn (*)

A=zeros(m, m); % initialize the matrix
A(1, 1)=2*h(1); % Natural Boundary condition
A(m, m)=2*h(m-1); % Natural Boundary condition
A(1, 2)=h(1);
A(m, m-1)=h(1);
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
    b(j)=(a(j+1)-a(j))/h(j)-h(j)*(2*c(j)+c(j+1))/3;
    d(j)=(c(j+1)-c(j))/(3*h(j));
end

fprintf('     a(i)          b(i)           c(i)         d(i)\n');

for i = 1:m-1  
 fprintf('%13.8f %13.8f %13.8f %13.8f\n',a(i),b(i),c(i),d(i));
end
