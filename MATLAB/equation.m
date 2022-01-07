clc

%x1+2x2=10
%x1+x2=6
%x1-2x2=1


A= [1 2; 1 1; 1 -2];
B= [10;6;1];
x1 = 0:0.1:max (B);
x12=(B(1) -A(1, 1) *x1)/A(1,2);
x22= (B(2) -A (2, 1) *x1) /A (2, 2);
x32= (B(3) -A (3, 1) *x1) /A (3, 2);

x12=max(0,x12);
x22=max(0,x22);
x32=max(0,x32);
plot(x1,x12,'r',x1,x22,'b',x1,x32,'g');
hold;
title("x1 vs x2");
xlabel("Value of x1");
ylabel("Value of x2");
legend('x1+2x2=10','x1+x2=6','x1-2x2=1');