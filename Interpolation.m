%Interpolation

n = input('Enter the number of data points : ');
p = input('Enter the point at which we have to interpolate the function : ');
for (i=1:n+1)
    fprintf('Enter the value of x(%d): ',i);
    x(i)=input('');
    fprintf('Enter the value of y(%d): ',i);
    y(i)=input('');
end
for (i=1:n+1)
    l(i)=1;
end
for (i=1:n+1)
    for (j=1:n+1)
        if (i~=j)
            l(i)=l(i)*((p-x(j))/(x(i)-x(j)));
        end
    end
end
sum=0;
for (i=1:n+1)
    sum=sum+l(i)*y(i);
end
fprintf("The interpolating value of function is : %d", sum);
