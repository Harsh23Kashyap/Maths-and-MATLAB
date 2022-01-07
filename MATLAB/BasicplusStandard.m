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
% The solution obtained by making non basic varible zero is basic solution.
% If a basic solution has determinant 0 then no solution exists.
% Total no. of basic solutions - nCm

% Basic Solution can be of two types. 
% Non degenerate solution- If none of the basic solution is zero.
% Degenerate solution - If atleast one of the basic solution is zero.

% Basic Feasible solution has feasible points and feasible point satisfies all the conditions.
format short   
%% Standard  Form
% x1 + x2 + s1 = 450
% 2x1 + x2 + s2 = 600
% x1, x2 >= 0

% matrixA should be [ 1 1 1 0; 2 1 0 1]

% last three columns of matrixA are basically idenity matrix with sign changing on basis of signs.
%% Input Parameters
A= [1 1; 2 1];                                                              % coefficients of x1 and x2
B= [450; 600];                                                              % value part
I= [0 0];                                                                   % Places with <= equations is taken zero and >= is taken 1
%% Making s1, s2 and s3
S= eye(size(A,1));                                                          % Identity matrix of order of size of row of A [1 0 ; 0 1]
index = find(I>0);                                                          % finding the indexes with >= sign
S(index,:)= -S(index,:);                                                    % make the rows negative where :>= -> [1 0; 0 1]
%% Clubbing
A=[A S]
tabl=array2table(A,'VariableNames',{'x1','x2','s1','s2'})
%A=[A S B]
%obj1=array2table(A)
%obj=array2table(C,'VariableNames',{'x1','x2','x3'})
%tabl=array2table(A,'VariableNames',{'x1','x2','x3','s1','s2','s3','b'})

%% Input Parameter
C=[3 4 0 0];                                                                 % max obj fn
m=size(A,1);                                                                 % no. of rows
n=size(A,2);                                                                % no. of columns
Y= zeros(n,1);                                                              % zeros(n,1) create an array of nX1 with all elements zero. At first we believe all x1, x2 , s1 ,s2 are zero and this stores that.                                    
if(n>m)                                                                     % no. of variables greater than no. of constraints then basic feasible solution is possible
    ncm =  nchoosek(n,m);                                                    % nCm . permutations % maximum no. of basic solutions
    pair= nchoosek(1:n,m);                                                   % no. of pairs     %(1:n)-> elements of m combinations          % this gives us the combination of basic variables
    sol= []             ;                                                   % to store the solution for all combination of variables
    for i = 1: ncm                                                          % length(pair) %size(pair,1)
        X= A(:,pair(i,:))\B ;                                                % AX=B X= inv(A)*B       %pair(i,:) will actually choose two basic variables at a time and A(:,pair(i,:)) will equate the equation keeping non basic variable as zero
        if(X>=0 & X~=-inf & X~=inf)                                         % conditions will make sure a condition for basic feasible solution X>=0 and X not equal to +- infinity
            Y(pair(i,:))= X   ;                                              % at first we take x1 and x2 as non basic so Y will have values at 1 and 2 position. similary for each combination , Y will have values at that particular point.   
            sol= [sol Y]   ;                                                 % keep on adding column for each solution
        end
    end
else                                                                        % otherwise not possible
    error=('ncm does not exist');   
end
z=C*sol       ;                                                              % objective fn     % will combine with all possible solution with objective fn
[zmax, zindex] = max(z) ;                                                    % finding max
% To find min -> min(z)
bfs = sol(:,zindex)     ;                                                    % will return x1, x2 , s1 and s2 corresponding to max Z
fprintf("\nBASIC FEASIBLE SOLUTION IS ");
optimal_value=[bfs' , zmax]        ;                                         % will store all the points and value of objective fn
tab=array2table(sol,'variableNames',{'x1', 'x2','s1','s2'})
final=array2table(optimal_value,'variableNames',{'x1', 'x2','s1','s2','solution'})