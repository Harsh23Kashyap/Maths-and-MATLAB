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
%% Input Parameters
A= [1 5 3 4 6; 0 1 4 5 6];                                                  % coefficients of x1 and x2
B= [14; 7];                                                                 % coefficeint of B
%% Clubbing
fprintf("In tabular form \n");
tabl=array2table([A B],'VariableNames',{'x1','x2','x3','x4','x5', 'B'})
%% Input Parameter
C=[1 2 1 3 6];                                                               % max obj fn
m=size(A,1);                                                                 % no. of rows
n=size(A,2);                                                                 % no. of columns
if(n>m)                                                                      % no. of variables greater than no. of constraints then basic feasible solution is possible
    ncm =  nchoosek(n,m);                                                    % nCm . permutations % maximum no. of basic solutions
    group= nchoosek(1:n,m);                                                  % no. of pairs     %(1:n)-> elements of m combinations          % this gives us the combination of basic variables
    sol= []                                                                  % to store the solution for all combination of variables
    for i = 1: ncm                                                           % length(pair) %size(pair,1) 
        Y= zeros(n,1);                                                       % zeros(n,1) create an array of nX1 with all elements zero. At first we believe all x1, x2 , x3, x4 and x5 are zero and this stores that.                                    

        X= A(:,group(i,:))\B ;                                               % AX=B X= inv(A)*B       %pair(i,:) will actually choose two basic variables at a time and A(:,pair(i,:)) will equate the equation keeping non basic variable as zero
        if(X>=0 & X~=-inf & X~=inf)                                          % conditions will make sure a condition for basic feasible solution X>=0 and X not equal to +- infinity
            Y(group(i,:))= X     ;                                           % at first we take x1 and x2 as non basic so Y will have values at 1 and 2 position. similary for each combination , Y will have values at that particular point.   
            sol= [sol Y]    ;                                                % keep on adding column for each solution
        end
    end
else                                                                         % otherwise not possible
    error=('ncm does not exist');   
end
z=C*sol                                                                     % objective fn     % will combine with all possible solution with objective fn
[zmin, zindex] = min(z)                                                     % finding min

bfs = sol(:,zindex)                                                         % will return x1, x2 , x3, x4 and x5 corresponding to min Z
fprintf("\nBASIC FEASIBLE SOLUTION IS ");
optimal_value=[bfs' , zmin]                                                 % will store all the points and value of objective fn
final=array2table(optimal_value,'variableNames',{'x1', 'x2','x3','x4','x5','solution'})