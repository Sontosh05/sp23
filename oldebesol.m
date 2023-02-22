a=0;
b=1;
nstep=100;
u0=1;
g=@(t, u) t.^2 * u;

[t, u]=oldbe(g, a, b, u0, nstep)
