%% Phase 1 Writing Variables
clc;
clear all;
cost=[2 -3 1];
a=[1 1 1; 4 -3 1; 2 1 -1];
variables=size(a,2);%3  %%no of variables
cost=[cost 0 0 0 0];
sol= [10; 10; 10]; %%value of b
s= eye(size(a,1));        
A=[a s sol];
P= array2table(A,'VariableNames',{'x1','x2','x3','s1','s2','s3','B'})
basicVar= variables+1:size(A,2)-1;
%% PHASE 2 DETERMINING COST
zj_cj=cost(basicVar)*A-cost;
%% PHASE 3 WORKING ON TABLE
while(any(zj_cj>0))
    [enteringvalue pivotcolumn] = max(zj_cj);
    column=A(:,pivotcolumn);
    for (i=1:size(A,1))
        if(column(i)>0)
            ratio(i)=sol(i)./column(i);
        else
            ratio(i)=inf;
        end
    end
    [leavingvalue pivotrow] = min(ratio);
    pivotelement=A(pivotrow,pivotcolumn);
    A(pivotrow,:)=A(pivotrow,:)/pivotelement;
    for (i=1:size(A,1))
        if (i~=pivotrow)
            A(i,:)=A(i,:)-A(i,pivotcolumn)*A(pivotrow,:);
        end
    end
    zj_cj=zj_cj-zj_cj(pivotcolumn)*A(pivotrow,:);
end
    
%% PHASE 4 DISPLAYING ANSWER
    fprintf('\nOptimal table is :-');
    L= array2table(A,'VariableNames',{'x_1','x_2','x_3','s1','s2','s3','sol'})
    optimal_value=zj_cj(:,size(A,2));
    fprintf('Variable Values\n');
    for (i=1:variables)
        if (zj_cj(i)~=0)
            fprintf('x%d=%.2f \t',i,0);
        else
            check=find(A(i)>0);
            fprintf('x%d=%.2f\t',i,A(check,end));
        end
    end
    fprintf("\n\nThe minimum cost is :  %.2f\n", optimal_value);