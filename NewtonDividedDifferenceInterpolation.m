%Newton's Divided Difference.
clc;
clear
n = input('Enter the number of data points : ');
p = input('Enter the point at which we have to interpolate the function : ');
for (i=1:n+1)
    fprintf('Enter the value of x(%d) : ',i);
    x(i)=input('');
end
for (i=1:n+1)
    fprintf('Enter the value of f(x(%d)) or f(%.2f) : ',i,x(i));
    f(i)=input('');
end
for (i=1:n+1)
    D(1,i)=f(i);
end
for (i=2:n+1)
    for (j=i:n+1)
        D(i,j)=((D(i-1,j)-D(i-1,j-1))/(x(j)-x(j-i+1)));
    end
end
for (i=1:n+1)
    pro(i)=1;
    for (j=1:i)
        pro(i)=pro(i)*(p-x(j));
    end
end
sum=D(1,1);
for (i=1:n)
    sum=sum+pro(i)*D(i+1,i+1);
end
fprintf("The interpolation value of function is %f \n: ",sum);
