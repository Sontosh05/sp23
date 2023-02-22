function[apprx] = aLpoly(t, f, a, b)
dt=b-a;
s=(t-a)/dt;
Lp=Lpoly(s, f, 0, 1);

apprx=dt*Lp;

end