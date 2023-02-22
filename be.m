function [t, u]=be(tstart, tend, u0, nstep)
 dt=(tend-tstart)/nstep;
 t=linspace(tstart, tend, nstep+1);
 A =1 ./(1-dt*t.^2);
 p=0:nstep;
 u=A.^p*u0;
end