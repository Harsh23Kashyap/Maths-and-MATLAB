clc
%GRAPHICAL METHOD 
%x1+2x2=10
%x1+x2=6
%x1-2x2=1


%x1=0
%x2=0


A= [1 2; 1 1; 1 -2];
B= [10;6;1];
for i=1:1:length(A)
    for j=i+1:1:length(B)
        A1=A(i,:);
        B1=B(i,:);
        A2=A(j,:);
        B2=B(j,:);
        P=[A1 ; A2];
        Q=[B1 ; B2];
        X=P\Q;
        X=min(0,X);
        fprintf("(%.2f,%.2f), ",X(1),X(2));    
    end
    fprintf("\n");
end
fprintf("\n");

x1 = 0:0.1:min (B);
x12=(B(1) -A(1, 1) *x1)/A(1,2);
x22= (B(2) -A (2, 1) *x1) /A (2, 2);
x32= (B(3) -A (3, 1) *x1) /A (3, 2);

x12=min(0,x12);
x22=min(0,x22);
x32=min(0,x32);
plot(x1,x12,'r',x1,x22,'b' ,x1,x32,'g');
hold;
title("x1 vs x2");
xlabel("Value of x1");
ylabel("Value of x2");

legend('x1+2x2=10','x1+x2=6','x1-2x2=1');
