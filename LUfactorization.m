clc;
clear;
n=input("Enter no. of equations : ");
N=zeros(n,n);
U=zeros(n,n);
m=zeros(n,n);
for (i=1:n)
    for (j=1:n)
        fprintf('Enter the value of a(%d,%d):',i,j);
        A(i,j) = input('');
    end
end
for (i=1:n-1)
    for (j=i+1:n)
       m(j,i)=A(j,i)/A(i,i);
    for (k=1:n)
        A(j,k)=A(j,k)-m(j,i)*A(i,k);
        end
    end
end
U=A;
N=m;
for (i=1:n)
    N(i,i)=1;
end
L=N;
fprintf("The value of L is ");
L
fprintf("The value of U is ");
U
