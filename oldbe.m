function [t, u]=oldbe(g, a, b, u0, nstep)
 dt=(b-a)/nstep;
 t=linspace(a, b, nstep+1);
 u(1)=u0;
 for i=1:nstep
     ue=u(i)+dt*g(t(i), u(i));
     u(i+1)=u(i)+dt*g(t(i+1), ue);
 end
end