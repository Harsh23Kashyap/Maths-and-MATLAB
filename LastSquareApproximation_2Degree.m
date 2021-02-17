%LastSquareApproximation_2Degree
clc;
clear;
n = input('Enter the number of data points : ');
for i=1:n
    fprintf("Value of x(%d) :",i);
    x(i)=input('');
    fprintf("Value of y(%d) :",i);
    y(i)=input('');
end
for i=1:n
    xsqr(i)=x(i)*x(i);
    xcube(i)=x(i)*x(i)*x(i); %x(i).^3
    xfour(i)=x(i).^4;
    xy(i)=x(i)*y(i);
    x2y(i)=xsqr(i)*y(i);
end
x_sum=0;
xsqr_sum=0;
xcube_sum=0;
xfour_sum=0;
y_sum=0;
xy_sum=0;
x2y_sum=0;
for i=1:n
    x_sum=x_sum+x(i);
    y_sum=y_sum+y(i);
    xsqr_sum=xsqr_sum+xsqr(i);
    xcube_sum=xcube_sum+xcube(i);
    xfour_sum=xfour_sum+xfour(i);
    xy_sum=xy_sum+xy(i);
    x2y_sum=x2y_sum+x2y(i);
end
A = [n x_sum xsqr_sum; x_sum xsqr_sum xcube_sum; xsqr_sum xcube_sum xfour_sum];
B = [y_sum; xy_sum; x2y_sum];
X = inv(A)*B;
a0 = X(1);
a1 = X(2);
a2 = X(3);
fprintf("P2(x) = %.3f + %.3f x + %.3f x^2 \n",a0,a1,a2);
