clear all
close all

a=2; b=4;
f=@(x) 1/x^2;
for i=1:20
    N(i)=5*i;
end

for j=1:20
    n=N(j);
    approx=myquad(f, a, b, n);
    exact=1/4;
    err(j)=abs(exact-approx);
end

figure(1), clf;
loglog(N, err, '-ko', 'MarkerSize',12);
p=polyfit(log(N'),log(err),1);
slope = p(1)


