clear all
close all
for n=3:8
t=linspace(0,1,n);
nfval=@(t) sin(pi*t);
f=nfval(t); a=1/4;b=1/2;
[apprx]=Lpoly(t, f, a, b);

intf=@(t) -cos(pi*t)/pi;
true=intf(b)-intf(a);
err=norm(true-apprx)
end


