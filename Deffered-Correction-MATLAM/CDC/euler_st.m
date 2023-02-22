function f=euler_st(t, y)
        y1=t*y(2)+y(1);
        y2=-t*y(1)+y(2);
        f= [y1 y2];
end