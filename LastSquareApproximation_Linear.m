%LastSquareApproximation_Linear
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
    xy(i)=x(i)*y(i);
end
x_sum=0;
y_sum=0;
xsqr_sum=0;
xy_sum=0;
for i=1:n
    x_sum=x_sum+x(i);
    y_sum=y_sum+y(i);
    xsqr_sum=xsqr_sum+xsqr(i);
    xy_sum=xy_sum+xy(i);
end
a0= ((xsqr_sum*y_sum)-(xy_sum*x_sum))/((n*xsqr_sum)-(x_sum.^2));
a1= ((n*xy_sum)-(x_sum*y_sum))/((n*xsqr_sum)-(x_sum.^2));
fprintf("P1(x) = %.3f + %.3f x \n",a0,a1);
