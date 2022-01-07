%
% Maximize (2x1 + 3x2 + 4 x3) 
% Subject to 
% 3x1 + 2x2 + x3 ≤ 10 
% 2x1 + 3x2 + 3 x3 ≤ 15 
% x1 + x2 - x3 ≥ 4 
% x1, x2, x3 ≥ 0
%

% Here value of b>=0 always . so if any val less than 0 multiply equation
% by -1
% In max A1 A2 val in obj fn is -1. No changes anywhere else
clc
clear all
Variables={'x1','x2','x3','s1','s2','s3','A1','sol'};
OVariables={'x_1','x_2','x_3','s_1','s_2','s_3','sol'}; % original variables
OrigC=[2 3 4 0 0 0 -1 0];
a=[3 2 1 1 0 0 0; 2 3 3 0 1 0 0; 1 1 -1 0 0 -1 1];
b=[10; 15; 4];
A=[a b]
fprintf('** Phase 1**\n')
cost=[0 0 0 0 0 0 -1 0]
Artificial_var=[7]
bv=[4 5 7]
zjcj=cost(bv)*A-cost

while (any(zjcj(1:end-1)<0))
    fprintf('The current BFS is not optimal')
    zc=zjcj(1:end-1)
    [enter_value pivot_col]=min(zc)
    if all(A(:,pivot_col)<=0)
        error= fprintf('LPP is unbounded')
    else 
        sol=A(:,end)
        column=A(:, pivot_col)
        for i=1:size(A,1)
            if column(i)>0
                ratio(i)=sol(i)./column(i)
            else
                ratio(i)=inf
            end
        end
        [leaving_value pivot_row]=min(ratio)
    end
    bv(pivot_row)=pivot_col
    pivot_key=A(pivot_row,pivot_col)
    A(pivot_row,:)=A(pivot_row,:)./pivot_key
    for i=1:size(A,1)
        if i~=pivot_row
            A(i,:)=A(i,:)-A(i,pivot_col).*A(pivot_row,:)
        end 
    end
    zjcj=cost(bv)*A-cost
    ZCj=[zjcj;A]
    table= array2table(ZCj,'VariableNames', Variables)
end
if any(bv==Artificial_var(1))
    error('Infeasible solution')
else
    fprintf('Optimal table of phase 1 is achieved\n')
end
fprintf('#########Phase 2 start###########\n')
A(:,Artificial_var)=[] 
OrigC(:,Artificial_var)=[]
cost=OrigC
zjcj=cost(bv)*A-cost

while (any(zjcj(1:end-1)<0))
    fprintf('The current BFS is not optimal')
    zc=zjcj(1:end-1)
    [enter_value pivot_col]=min(zc)
    if all(A(:,pivot_col)<=0)
        error= fprintf('LPP is unbounded')
    else 
        sol=A(:,end)
        column=A(:, pivot_col)
        for i=1:size(A,1)
            if column(i)>0
                ratio(i)=sol(i)./column(i)
            else
                ratio(i)=inf
            end
        end
        [leaving_value pivot_row]=min(ratio)
    end
    bv(pivot_row)=pivot_col
    pivot_key=A(pivot_row,pivot_col)
    A(pivot_row,:)=A(pivot_row,:)./pivot_key
    for i=1:size(A,1)
        if i~=pivot_row
            A(i,:)=A(i,:)-A(i,pivot_col).*A(pivot_row,:)
        end
    end
    zjcj=cost(bv)*A-cost
    ZCj=[zjcj;A]

    table= array2table(ZCj,'VariableNames', OVariables)
end
fprintf('The current BFS is optmal \n')
fprintf('The resultant value is %.2f\n', zjcj(end));