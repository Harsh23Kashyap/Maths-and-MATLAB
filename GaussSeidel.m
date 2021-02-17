n= input('Enter the number of equations : ');
error= zeros(n);
for i=1 : n
    for j=1 :n
        fprintf("Enter the value a(%d,%d) : ",i,j);
        a(i,j) = input('');
    end
end
for i=1 : n
    fprintf("Enter the value b(%d) : ",i);
    b(i)= input('');
end
for i=1 : n
    fprintf("Enter the initial approximations x(%d) : ",i);
    x(i)= input('');
end
tol= input('Enter the Tolerance of the of the root : ');
error= 1;
while (norm(error, inf) > tol)
    for i=1 : n
        xold(i)= x(i);
        sum(i)= 0;
        for j=1 : n
            if( j~=i)
                sum(i) = sum(i) + a(i,j) * x(j);
            end
        end
        x(i) =(b(i) - sum(i))/a(i,i);
        error(i) = abs(xold(i) - x(i));
    end
end
for i=1: n
    fprintf('The required sol is x(%d) = %f\n',i,x(i));
end