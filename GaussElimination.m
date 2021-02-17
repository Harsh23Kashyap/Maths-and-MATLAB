%MATLAB CODE For Gauss elimination
clc;
clear;
n = input('Enter the number of equations : ');
for (i=1:n)
    for(j=1:n+1)
        fprintf('Enter the value of a(%d,%d):',i,j);
        a(i,j)=input('');
    end
end
for (i = 1 : n-1 )
    for(j = i+1 : n)
        m = a(j,i)/a(i,i);
        for(k=1:n+1)
            a(j,k) = a(j,k)- m*a(i,k);
        end
    end
end
x(n)= a(n,n+1)/a(n,n) ;
for(i=n-1 :-1:1)
    sum=0;
    for(j=i+1:n)
        sum = sum +a(i,j)*x(j);
        x(i) = (a(i,n+1)-sum)/a(i,i) ;
    end
end
for(i=1:n)
    fprintf('The required sol is x(%d) = %f\n',i,x(i))
end
display(A);
     
