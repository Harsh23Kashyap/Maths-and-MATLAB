%% Graphical METHOD
% No need to convert it into Standard Form
clc
clear all
format rat                              % for rational in fractions
%% Equations
% x1 + 2x2 <= 10  
% x1 + x2 <= 6
% x1 - 2x2 <= 1

% max = 2x1 + 3x2 .  for C              % Objective Function
% min = 2x1 +3x2
%% phase 1: Input Parameter
A=[1 2; 1 1; 1 -2];                     % takes in the coeffieceint of x1 and x2 from above equation
B=[10; 6;1];                            % takes the result part of the above equation
C=[2 3];                                % takes the max part of the condition

%% phase 2: Plotting the graph
P=max(B);                               % finds the max value in the determinant B .  % need to find the range .   % the values will not be greater than this
y1=0:1:max(B);                          % y1 contains range of points from 0 to maximum of B (i.e P) and has a stepsize of y1. Suppose P = 5 so y1 =  0              1              2              3              4              5 
x11=(B(1)-A(1,1).*y1)./A(1,2);          % will evaluate the expression for B(1) - A(1,1) .*y1( no. of solution of x11 is the no. of values in y  and various result will differ just because of value of y1 which is constanlty changing)/A(1,2)
x21=(B(2)-A(2,1).*y1)./A(2,2);          % ||
x31=(B(3)-A(3,1).*y1)./A(3,2);          % ||
% the above x11 , x22 and x31 are x2 accoding to the first, second and third line.
% y1 above is actually various values of x1. Let's take 2x1 + 3x2 = 5. Then x2 = (5 -  2*x1)/3 -> which is (B(1) - A(1,1).*y1). A(1,2)
x11=max(0,x11);                         % for all the values of x11 it will find the max between 0 and x11 (so that to get result in first quadrant) x11 = 5 7 -2 result will be x11 = 5 7 0
x21=max(0,x21);                         % ||
x31=max(0,x31);                         % ||
plot(y1,x11,'r',y1,x21,'b',y1,x31,'g')  % y1 ( plotting from X axis) and x11 (x11 plotting from y axis)line which will be red , y1 and x21 line which will be blue, y1 and x31 line which will be blue
title('x1 vs x2');                      % will plot the graph x1 vs x2
xlabel('value of x1')                   % name given to X coordinate
ylabel('value of x2')                   % name given to y coordinate
legend('x1 + 2x2 = 10','x1 + x2 = 6','x1 - 2x2 = 1');
%% phase 3: Find corner point with axes 
cx1=find(y1==0)                         % points with x1 axis    % will find corner points indexes    % the point where y1 = 0 in y1 will be put in cx1
c1=find(x11==0)                         % points with x2 axis    % ||
Line1=[y1(:,[c1 cx1]); x11(:,[c1 cx1])]'       
% Line1 part by part
% y1(:,[c1 cx1]) -> [c1 cx1] will store values of zero. 
% y1(:,[c1 cx1]) will store two rows c1 and cx1 th row of y1 as first column
% x11(:,[c1 cx1]) -> will store two rows c1 and cx1 th row of x11 as second column
% Now, this will have two rows and two columns. Then ' will make it trannsposed and stored in Line1

% It is used to find all corner point from equation 1 ,2 and 3 respectively where either x1 or x2 is 0
c2=find(x21==0);                            % points with x2 axis
Line2=[y1(:,[c2 cx1]); x21(:,[c2 cx1])]' 

c3=find(x31==0);                            % points with x2   axis
Line3=[y1(:,[c3 cx1]); x31(:,[c3 cx1])]' 
corpt=unique([Line1;Line2;Line3],'rows')    % unique removes repeated points without affecting the order or way of display /storage

%% phase 4: Intersecting points
 pt=[0;0];                                  % taking this corner point if not already added.
for i=1:size(A,1)                           % size(A) gives size of rows and columns % size(A,1) - size of row % size(A,2) - size of column
    A1=A(i,:);                              % A(1,:) will print the first row % A(:,1) will print first column
    B1=B(i,:);                              
    for j=i+1:size(A,1)
        A2=A(j,:);
        B2=B(j,:);
        A4=[A1; A2];
        B4=[B1; B2];
        X=A4\B4;                            % X=inv(A4)*B4
        pt=[pt X];
        pt= max(0,pt)                       % first quadrant points
    end
end
  ptt=pt'                                   % find transpose of pt
  
%% Phase5: All points
allpt=[ptt;corpt]                           % intersection and corner point both are in allpt
points=unique(allpt,'rows')                 % keeping only unique points intact

%% Phase 6: Feasible Region                 %Regions where every points condition is satisfied.
% x1 >= 0 and x2 >= 0 
PT=output(points)                           % will find feasible regions 
P=unique(PT,'rows')                         % keeping only unique points intact

%% Phase 7: Finding Maximum
Z= C*P'                                     % Finding the objective fn value for all corresponding points
Z=Z';                                       % Transpose
[obj ind]= max(Z)                           % find max of Z and then store the value in obj and its index in ind
% [obj ind]= min(Z)
objpt=P(ind,: )                             % objpt will store the x1 and x2 values of the corresponding max index
Objvalue=[objpt obj]                        % will store objpt and obj  
result = array2table(Objvalue,'variableNames',{'x1', 'x2','solution value'})