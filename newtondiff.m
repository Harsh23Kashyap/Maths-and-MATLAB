%Find roots of f9x) = x*e^x - 1 =0, g(x) = e^-x
f = @(x)(x*exp(x)-1);
syms g(x);
g =  diff(f,x);
x0 = input("Enter initial approximation : ");
tol = input("Enter tolerance value : ");
i=1;
error(1)=1;
while (error(i)>tol)
    if double(g(x0))==0
        x0 = input("Change value of initial approximation : ");
        i=1;
        error(1)=1;
    else
        x1=x0 - f(x0)/double(g(x0));
        error(i+1)= abs(x1-x0);
        i=i+1;
        x0=x1;
    end
end
fprintf("The value of root is %.3f \n",x1);
j=1:i;
plot(j,error);
xlabel("No. of iterations");
ylabel("Error ");
title("Error vs No. of iterations");
grid on;