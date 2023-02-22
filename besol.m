tstart=0;
tend=1;
nstep=100;
u0=1.0;
[t, u]=be(tstart, tend, u0, nstep)
exact=exp((t .^3)/3)