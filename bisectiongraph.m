%f=@(x)  x^3-5*x+1
f=@(x)  x^3-25;
%f=@(x)  x^(2.71828*x)-cos(x)
a= input("Enter first limit : ");
b= input("Enter second limit : ");
tol= input("Enter tolerance value : ");
i=1;
error(1)=1;
if (f(a)*f(b)>0)
    fprintf("Limits doesn't satistfy the condition \n");
else
    while (error(i)>tol)
        c = (a+b)/2;
        if(f(c)==0)
            fprintf("The smallest positive value of root is %.3f ",c);
            break;
        end
        if(f(a)*f(c)<0)
            b=c;
        elseif(f(a)*f(c)>0) 
            a=c;
        end
        error(i+1) = abs(f(c)); 
        i=i+1;
    end
    fprintf("The smallest positive value of root is %.3f\n ",c);
end
j= 1:i;
plot(j,error);
xlabel("No. of iterations");
ylabel("Error");
title("Error vs No. of iterations");
legend("Varying Rate");