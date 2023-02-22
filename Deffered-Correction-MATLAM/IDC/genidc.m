function [t, yp, y1,y2,y3,y4]=genidc(f, a, b, h, y0, E0, n)


    [t, y]=forwardE(f, a, b, y0, n); % Provisional Solution
    yp=y; % Storing Provisional solution
    errfun=@(y, E, t) f(y+E, t) - f(y, t);   % f(y+e)-f(y)
    ynew(1)=y0;
    E(1)=E0;
    
    for i=1:2
        nfval=f(y, t);
        if i>1
           E(i)=E(i-1)-(y(i)-y(i-1)) + h*errfun(y(i-1), E(i-1), t(i-1)) +...
           Lpoly(t(1:i+1),nfval(1:i+1),t(i-1),t(i));
           ynew(i)=y(i)+E(i);
        end
        
        for j=i+1:n+1
            E(j)=E(j-1)-(y(j)-y(j-1))+h*errfun(y(j-1),E(j-1),t(j-1))+...
            Lpoly(t(j-i:j),nfval(j-i:j),t(j-1),t(j));
            ynew(j)=y(j)+E(j);
        end
        ystore{i}=ynew;
        y=ynew;
     end
     y1=ystore{1,1};
     y2=ystore{1,2};
     
     % 3rd correction
     for i=2:3
         nfval=f(y, t);
         E(i)=E(i-1)-(y(i)-y(i-1)) + h*errfun(y(i-1), E(i-1),t(i-1)) +...
         Lpoly(t(1:4),nfval(1:4),t(i-1),t(i));
         ynew(i)=y(i)+E(i);
     end
     for j=4:n+1
         E(j)=E(j-1)-(y(j)-y(j-1))+h*errfun(y(j-1),E(j-1),t(j-1))+...
         Lpoly(t(j-3:j),nfval(j-3:j),t(j-1),t(j));
         ynew(j)=y(j)+E(j);
     end
     y3=ynew;
     y=ynew;
     % 4th correction
     for i=2:4
         nfval=f(y, t);
         E(i)=E(i-1)-(y(i)-y(i-1)) + h*errfun(y(i-1), E(i-1),t(i-1)) +...
         Lpoly(t(1:5),nfval(1:5),t(i-1),t(i));
         ynew(i)=y(i)+E(i);
     end
     for j=5:n+1
         E(j)=E(j-1)-(y(j)-y(j-1))+h*errfun(y(j-1),E(j-1),t(j-1))+...
         Lpoly(t(j-4:j),nfval(j-4:j),t(j-1),t(j));
         ynew(j)=y(j)+E(j);
     end
     y4=ynew;
end