function u=endsol(lambda, t0, t1, u0, n);
    [t, u]=backwardE(lambda, [t0 t1], u0, n);
u=u(end);