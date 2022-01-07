clc
clear all
Variables={'x1','x2','x3','s1','s2','A1','A2','sol'};
OVariables={'x_1','x_2','x_3','s_1','s_2','sol'}; % original variables
OrigC=[-3 1 1 0 0 1 1 0];
a=[1 -2 1 1 0 0 0; -4 1 3 0 -1 1 0; -2 0 1 0 0 0 1];
b=[11; 3; 1];
A=[a b]
fprintf('* Phase 1**\n')
cost=[0 0 0 0 0 1 1 0]
Artificial_var=[6 7]
bv=[4 6 7]
zjcj=cost(bv)*A-cost

while (any(zjcj(1:end-1)>0))
    fprintf('The current BFS is not optimal')
    zc=zjcj(1:end-1)
    [enter_value pivot_col]=max(zc)
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
if any(bv==Artificial_var(1) | bv==Artificial_var(2))
    error('Infeasible solution')
else
    fprintf('Optimal table of phase 1 is achieved\n')
end
fprintf('#########Phase 2 start###########\n')
A(:,Artificial_var)=[] 
OrigC(:,Artificial_var)=[]
cost=OrigC
zjcj=cost(bv)*A-cost

while (any(zjcj(1:end-1)>0))
    fprintf('The current BFS is not optimal')
    zc=zjcj(1:end-1)
    [enter_value pivot_col]=max(zc)
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