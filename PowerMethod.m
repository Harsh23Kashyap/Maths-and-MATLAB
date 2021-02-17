clc;
clear;
n= input('Enter the number of equations : ');
for i=1 : n
    for j=1 :n
        fprintf("Enter the value a(%d,%d) : ",i,j);
        a(i,j) = input('');
    end
end
for i=1 : n
    fprintf("Enter the %d th eigen value : ",i);
        x(i) = input('');
end
tol= input('Enter the tolerance value : ');
emax=tol+1;
while(emax>tol)
    for i=1 : n
        z(i)=0;
        for j=1:n
            z(i)=z(i)+a(i,j)*x(j);
        end
    end
    zmax= abs(z(1));
    for i=2:n
        if (abs(z(i))>zmax)
            zmax=abs(z(i));
        end
    end
    for i=1:n
        z(i)=z(i)/zmax;
    end
    for i=1:n
        e(i)=0;
        e(i)=abs(z(i)-x(i));
    end
    emax=e(1);
    for i=2:n
        if(e(i)>emax)
            emax=e(i);
        end
    end
    for i=1:n
        x(i)=z(i);
    end
end
fprintf("The eigen vector is : ");
x
fprintf("The eigen value is : %d\n",zmax);


    
