% Maximum using simplex table
%MAX Z = 40x1 + 30x2
%subject to
%x1 + x2 >= 12
%2x1 + x2 <= 16
%and x1,x2 >= 0 

% For maximum, copy all the value as it is. Make sure sign is <= in
% constraints. 
% if we have to find minimum , just make the objective fun negative and
% then at the end multiply it with -1.
% All b should be >0
clc;
clear all;                                                               
a=[1 1; 2 1]
cost=[40 30]
variables=size(a,2)
cost=[cost zeros(1,size(a,1)+1)]
sol= [12;16]              
s= eye(size(a,1));
A=[a s sol]
P= array2table(A,'VariableNames',{'x_1','x_2','s1','s2','sol'})
basic_variables= variables+1:size(A,2)-1
zjcj=cost(basic_variables)*A-cost

while(any(zjcj<0))
    fprintf('not optimal')
    [enteringvalue,pivotcolumn] = min(zjcj)
    column=A(:,pivotcolumn)
    for (i=1:size(A,1))
        if(column(i)>0)
            ratio(i)=sol(i)./column(i)
        else
            ratio(i)=inf
        end
    end
    [leavingvalue,pivotrow] = min(ratio)
    pivotelement=A(pivotrow,pivotcolumn)
    A(pivotrow,:)=A(pivotrow,:)/pivotelement
    for (i=1:size(A,1))
        if (i~=pivotrow)
            A(i,:)=A(i,:)-A(i,pivotcolumn)*A(pivotrow,:)
        end
    end
    zjcj=zjcj-zjcj(pivotcolumn)*A(pivotrow,:)
end

    fprintf('We have reached the end. \nOptimal table is :-')
    L=array2table(A,'VariableNames',{'x_1','x_2','s1','s2','sol'})
    optimal_value=zjcj(:,size(A,2))
    fprintf("The maximum cost is :  %.2f\n", optimal_value);