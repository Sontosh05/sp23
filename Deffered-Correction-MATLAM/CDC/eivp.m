function F= eivp(t, y, E, yprime)
        E1=t*(y(2)+E(2))+(y(1)+E(1)); 
        E2=-t*(y(1)+E(1))+(y(2)+E(2)); 
        F=[E1 E2]-yprime;
end