% used when constrants are in form of >= or b side is negative. 
% If >= reverse it by multiplying it with -1. and put the new values in
% table after multiplying equation with -1. 
% Keep the objective fn as it is.
% When evaluating a maximum condition MAX z= . Write it as it is And then
% type 1 at the end
% When evaluating a minimum condition Min z= . Write it as (-z) (objective
% function multiplied with -1). Type 0 at end.
% 
clc
clear all
format short
cost=[-2 -1 0]
a=[-2 1 1; -1 1 -1]
variables= size(a,2)
cost=[cost zeros(1,size(a,1)+1)]
b=[-3;-2]
s= eye(size(a,1));   
A=[a s b]
P= array2table(A,'VariableNames',{'x_1','x_2','x_3','s1','s2','sol'})
bv= [variables+1:size(A,2)-1]
zjcj=cost(bv)*A-cost
Run=true
while (Run)
    sol=A(:,end)
    if any(sol<0)
        fprintf('infeasible sol')
        [leaving_value pivot_row]=min(sol)
        Row=A(pivot_row,1:end-1)
        ZC=zjcj(1:end-1)
        for i=1:size(A,2)-1
            if (Row(i)<0)
                ratio(i)=abs(ZC(i)./Row(i))
            else
                ratio(i)=inf
            end
        end
        [entering_value  pivot_column]=min(ratio)
        pivot_element=A(pivot_row,pivot_column)
        A(pivot_row,:)=A(pivot_row,:)./pivot_element
        bv(pivot_row)=pivot_column
        for i=1:size(A,1)
            if (i~= pivot_row)
                A(i,:)=A(i,:)-A(i,pivot_column).*A(pivot_row,:)
            end
        end
        zjcj=cost(bv)*A-cost
    else
        Run=false
        fprintf('Feasible solution achieved\n')
    end
end
choice=input('Enter 0 for min and 1 for max \n')
if (choice==0)
    obj_value=-zjcj(end)
else
    obj_value=zjcj(end)
end
fprintf('Variable values x1 = %.2f x2 = %.2f\n',sol(1), sol(2));