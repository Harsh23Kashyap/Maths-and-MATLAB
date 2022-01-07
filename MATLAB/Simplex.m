% MAX Z = x1 - 3x2 + 2x2
% Constraints
% 3x1 - x2 + 2x3 <= 7
% -2x1 + 4x2 <= 12
% -4x1 + 3x2 + 8x3 <= 10
% x1, x2, x3>= 0

% 3x1 - x2 + 2x3 + s1= 7
% -2x1 + 4x2 + s2 = 12
% -4x1 + 3x2 + 8x3 +s3 = 10
% x1, x2, x3, s1, s2 , s3>= 0

a=[3 -1 2; -2 4 0; -4 3 8];             % Matrix A
b=[7; 2; 10];                           % The value side
s=eye(size(a,1));                       % creating a matrix for s1, s2 and s3
cost=[1 -3 2 0 0 0] ;                    % The Cj part  

A=[a s b];                               % Merging to make a matrix
A1=[a s];

P=array2table(A,'variableNames',{'x1', 'x2','x3', 's1','s2', 's3','b'})
no_of_var= size(a,2)
basic_var= no_of_var+1: size(A,2)-1;
zjcj = cost(1,basic_var)*A1-cost
while(any(zjcj<0)  )   
    Z=[zjcj;A1]
    ZC=zjcj(1:size(A1,2));
    [minvalue, pivotcolumn] = min(ZC)
    column=A1(:,pivotcolumn);
    sol=b;
    for i=1:size(A,1)
        if (column(i)>0)
            ratio(i)=sol(i)./column(i);
        else 
            ratio(i)=inf;
        end
    end
    [minratio, pivotrow]=min(ratio)
    pivot_element=A1(pivotrow,pivotcolumn);
    A1(pivotrow,:)=A1(pivotrow,:)/pivot_element;
    for i=1:size(A1,1)
        if(i~=1)
            A1(i,:)=A1(i,:)-A1(i,pivotcolumn)*A1(pivotrow,:);
        end
    end
    zjcj=zjcj(1,:)-zjcj(pivotcolumn)*A1(pivotrow,:)
%
end
fprintf("Optimal table");
[zjcj:A1]
final=cost*zjcj'