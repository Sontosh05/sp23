function[p]= Optimization(A, B, g, delta, n)

    Mpleft=[-B, A; A, -(g*g')/delta^2]; % Left Matrix Pencil
    
    Mpright=[zeros(n, n), -B; -B, zeros(n, n)]; % Right Matrix Pencil

    [large_evec,~]=eigs(Mpleft, Mpright, 1); 

    gr=size(g);

    largest_evec_row=size(large_evec);

    k=(largest_evec_row-gr);

    y1=large_evec(1:k);
    y2=large_evec(k+1:largest_evec_row);

    alpha=-(sign(g'*y2))*delta;
    beta=y1/(sqrt(y1'*B*y1));

    p=alpha .* beta;
end