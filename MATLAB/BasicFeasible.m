%% BASIC FEASIBLE
% max = 3x1 + 4x2 .  for C
% x1 + x2 <= 450
% 2x1 + x2 <= 600
% x1, x2 >= 0

% x1 + x2 +s1 = 450
% 2x1 + x2 +s2 = 600
% x1, x2, s1, s2 >= 0

% No. of constraints : = No. of rows : = 2    (m)
% No. of variables : 4  (n)

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
%% Input Parameter
A=[1 1 1 0; 2 1 0 1 ] 
B=[450; 600]
C=[3 4 0 0]
m=size(A,1) %no. of rows
n=size(A,2) %no. of columns
Y= zeros(n,1)
if(n>m)
    ncm =  nchoosek(n,m)  %nCm . permutations %maximum no. of basic solutions
    pair= nchoosek(1:n,m) %no. of pairs
    sol= []
    for i = 1: ncm   % length(pair) %size(pair,1)
        X= A(:,pair(i,:))\B  %AX=B X= inv(A)B
        if(X>=0 & X~=-inf & X~=inf)
            Y(pair(i,:))= X
            sol= [sol Y]
        end
    end
else
    error=('ncm does not exist');
end
z=C*sol
[zmax, zindex] = max(z)
% To find min -> min(z)
bfs = sol(:,zindex)
fprintf("\nBASIC FEASIBLE SOLUTION IS ");
optimal_value=[bfs' , zmax]
tab=array2table(sol,'variableNames',{'x1', 'x2','s1','s2'})