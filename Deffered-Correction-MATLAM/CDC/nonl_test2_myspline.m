clear all
close all


for i=1:5
    N(i)=10*2^(i-1);
end

for p=1:5
    n=N(p);
    a1=0;b1=1;
    h=(b1-a1)/n;
    t=a1:h:b1;
    F=@(y) y*(1-y);
    exact=2.*exp(t)./(2*exp(t)-1);
    y(1)=2;
    
    for i=2:n+1
        y(i)=y(i-1)+h*F(y(i-1)); %Euler steps
    end
    
    y1=y;

% Correction loop starts here
for q=1:6
    % Building Cubic spline for y

    % step size for cubic-spline
    for j=1:n
        H(j)=t(j+1)-t(j);
    end

    % calculate the constant coefficient a
    a=zeros(1,n+1);
    for k=1:n+1
        a(k)=y(k);
    end
% Now we compute the coefficient c since c is dependent on a's

% The expression for computing c is 

% H(j-1)c(j-1)+2(H(j-1)+H(j))+H(j)c(j+1)=3/H(j) (a(j+1)-a(j))-3/H(j-1) (a(j)-a(j-1)) (*) 
% we express the right hand side of the above equation (*) as matrix B where the
% first and last entry (which is 0) of B is coming from the Natural spline boundary condition.
    B=zeros(1, n+1);
    % internal values
    for l=2:n
        B(l)=(3/H(l))*(a(l+1)-a(l))-(3/H(l-1))*(a(l)-a(l-1));
    end
% Now we build the matrix A for the left hand side of the above eqn (*)
    
    A=zeros(n+1, n+1); % initialize the matrix
    A(1, 1)=1; % Natural Boundary condition
    A(n+1, n+1)=1; % Natural Boundary condition

    for j=1:n+1  % Here i and j represents row and column of the matrix A
        for i=2:n
            if i==j
            A(i, j)=2*(H(i-1)+H(i)); % Main diagonal
            elseif i==j+1
                A(i, j)=H(i-1);      % Below main diagonal 
            elseif i==j-1
            A(i, j)=H(i);            % Above main diagonal
            end
        end
    end
% coefficient cj

c=A\B'; % solves c=A^(-1)*B

% Compute the coefficinet bj and dj (Formula bj = 1/Hj (a(j+1)-a(j))-Hj/3(2c(j)+c(j+1))) for j=1,...n
% dj=1/3H(j) (c(j+1)-c(j))
for j=1:n
    b(j)=(1/H(j))*(a(j+1)-a(j))-(H(j)/3)*(2*c(j)+c(j+1));
    d(j)=(c(j+1)-c(j))/(3*H(j));
end


% Storing the values in structure and taking the derivative using fnder.

Z.coefs=[d(1:n)' c(1:n) b(1:n)', a(1:n)'];
Z.form='pp';
Z.breaks=t;
Z.pieces=n;
Z.order=4;
Z.dim=1;
dr=fnder(Z); % built-in derivative command.
yprime=ppval(dr, t);
% Cubic Spline and derivative of the cubic spline ends here.

% Error value problem
Ef=@(yprime, y, E) (y+E)*(1-(y+E))-yprime;

    E(1)=0;
    ynew(1)=2;
 
    for i=2:n+1
        E(i) = E(i-1)+h*Ef(yprime(i-1), y(i-1), E(i-1)); %Euler steps
        ynew(i)=y(i)+E(i);
    end
    yz{q}=ynew;
    y=ynew;
end % correction loop ends here
    y2=yz{1,1};
    y3=yz{1,2};
    y4=yz{1,3};
    y5=yz{1,4};
    y6=yz{1,5};
    y7=yz{1,6};

    err1(p)=norm(exact(n)-y1(n));
    err2(p)=norm(exact(n)-y2(n));
    err3(p)=norm(exact(n)-y3(n));
    err4(p)=norm(exact(n)-y4(n));
    err5(p)=norm(exact(n)-y5(n));
    err6(p)=norm(exact(n)-y6(n));
    err7(p)=norm(exact(n)-y7(n));
end
loglog(N, err1, '-ko', 'MarkerSize',12);
hold on
loglog(N, err2, '-sb', 'MarkerSize',12);
loglog(N, err3, '-sr', 'MarkerSize',12);
loglog(N, err4, '-sg', 'MarkerSize',12);
loglog(N, err5, '-sm', 'MarkerSize',12);
loglog(N, err6, '-sy', 'MarkerSize',12);
loglog(N, err7, '-sc', 'MarkerSize',12);
p=polyfit(log(N'),log(err7),1);
slope = p(1)