%% BASIC FEASIBLE
% min z =  x1 + 2x2 + x3 +3x4 +6x5 .  for C
% x1 + 5x2 + 3x3 + 4x4 + 6x5 = 14
% x2 + 4x3 + 5x4 + 6x5 = 7
% x1, x2 , x3, x4, x5 >= 0

% No. of constraints : = No. of rows : = 2    (m)
% No. of variables : 5  (n)

% No need to convert it into Standard Form
% (n-m) non-basic variable.
% A non basic varibale is the one which we make zero and evaluate the condition on other condition. Non zero variable are basic variables
% The solution obtained by making non basic varible is basic solution.
% If a basic solution has determinant 0 then no solution exists.
% Total no. of basic solution - nCm

% Basic Solution can be of two types. 
% Non degenerate solution- If none of the basic solution is zero.
% Degenerate solution - If atleast one of the basic solution is zero.

% Basic Feasible solution has feasible points and feasible point satisfies all the condition
format rat
A= [1 5 3 4 6; 0 1 4 5 6];                                                  % coefficients of x1 and x2
B= [14; 7]; % coefficeint of B
C=[1 2 1 3 6]  % max obj fn
%% Clubbing
fprintf("In tabular form \n");
tabl=array2table([A B],'VariableNames',{'x1','x2','x3','x4','x5', 'B'})
%%
n=size(A,2);% no. of rows
m=size(A,1) % no. of columns
if(n>m)
    ncm=nchoosek(n,m);
    pair=nchoosek(1:n,m);
    sol=[]
    for i=1:ncm;
        y=zeros(n,1);    % zeros(n,1) create an array of nX1 with all elements zero. At first we believe all x1, x2 , x3, x4 and x5 are zero and this stores that.                 
        X=A(:,pair(i,:))\B ;
        if (X>=0&X~=inf&X~=inf)
            y(pair(i,:))=X;
            sol=[sol y];
        end
    end
else 
    error=('ncm does not exist');
end
Z=C*sol;
[zmax,zindex]=min(Z);
bfs=sol(:,zindex);
optimal_value=[bfs' , zmax];
tab=array2table(sol,'variableNames',{'x1', 'x2','x3','x4','x5','sol'})
fprintf("Solution of the problem min is");
final=array2table(optimal_value,'variableNames',{'x1', 'x2','x3','x4','x5','solution'})