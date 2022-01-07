clc
clear all
format rat
% x1 + 2x2 = 10
% x1 + x2 = 6
% x1 - 2x2 = 1
%Graphical METHOD
%% phase 1: Input Parameter
%A=[2 3; 3 4; 40 6];
% A=[1 2; 1 1; 0 1];
% B=[2000; 1500; 600];
A=[1 2; 1 1; 1 -2];
B=[10; 6;1];
C=[2 3];
%% phase 2: Plotting the graph
P=max(B);
y1=0:1:max(B);
x11=(B(1)-A(1,1).*y1)./A(1,2);   % will find the mqa
x21=(B(2)-A(2,1).*y1)./A(2,2);
x31=(B(3)-A(3,1).*y1)./A(3,2);
x11=max(0,x11);
x21=max(0,x21);
x31=max(0,x31);
plot(y1,x11,'r',y1,x21,'b',y1,x31,'g')
title('x1 vs x2');
xlabel('value of x1')
ylabel('value of x2')
%% phase 3: find corner point with axes 
cx1=find(y1==0) %points with x1 axis
c1=find(x11==0)  %points with x2   axis
Line1=[y1(:,[c1 cx1]); x11(:,[c1 cx1])]'
 
c2=find(x21==0);  %points with x2   axis
Line2=[y1(:,[c2 cx1]); x21(:,[c2 cx1])]' 

c3=find(x31==0);  %points with x2   axis
Line3=[y1(:,[c3 cx1]); x31(:,[c3 cx1])]' 
corpt=unique([Line1;Line2;Line3],'rows')
%% phase 4: Intersecting points
 pt=[0;0];
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:size(A,1)
    A2=A(j,:);
    B2=B(j,:);
    A4=[A1; A2];
    B4=[B1; B2];
    X=A4\B4;
    pt=[pt X];
       
end
end
  ptt=pt'
%% Phase5: all corner points
allpt=[ptt;corpt]
points=unique(allpt,'rows')
%% Phase 6: Feasible Region
PT=output(points)
P=unique(PT,'rows')

%% Phase 7: Finding Maximum
Z= C*P'
Z=Z';
[obj ind]= max(Z)
objpt=P(ind,: )
Objvalue=[objpt obj]