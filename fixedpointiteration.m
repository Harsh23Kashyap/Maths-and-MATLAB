%f=@(x)  2*x-log10(x)-7;
%g=@(x)  (7+log10(x))/2;
%h=@(x)  1/(2*x);
f=@(x)  (5/(x*x))-x+2;
g=@(x)  (5/(x*x))+2;
h=@(x)  -10/(x*x*x);
%f=@(x)  x*exp(x)-1;
%g=@(x)  1/(exp(x));
%h=@(x)  -1/(exp(x));
a=input("Enter initial approximation : ");  %a=x0
tol=input("Enter the tolerance value : ");
i=1;
err(1)=1;
while (abs(h(a))>=1)
    a=input("Enter initial approximation again : ");
end
while(err(i)>tol)
    if (abs(h(a))<1)
        b=abs(g(a)); %b=x1
        err(i+1)= abs(b-a);
        a=b;
        i=i+1;
    else
        a=input("Enter initial approximation again : ");
    end
end
fprintf("The value of root is %.3f \n",a);
j=1:i;
plot(j,err);
xlabel("No. of iterations");
ylabel("Error ");
title("Error vs No. of iterations");
        
        
    