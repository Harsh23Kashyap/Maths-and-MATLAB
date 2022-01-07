format short
%% Equations
% 2x1 + 3x2 + 4x3 <= 1
% 1x1 + 5x2 + 2x3 <= 8
% 2x1 + 4x2 + 3x3 >= 4
   
%% Standard  Form
% 2x1 + 3x2 + 4x3 + s1 = 1
% 1x1 + 5x2 + 2x3 + s2 = 8
% 2x1 + 4x2 + 3x3 - s3 = 4      (-s3 since we have used >= sign)

% matrixA should be [ 2 3 4 1 0 0; 1 5 2 0 1 0; 2 4 3 0 0 -1]

% last three columns of matrixA are basically idenity matrix with sign changing on basis of signs.
%% Input Parameters
C=[ 1, 3, 7];
A= [2 3 4; 1 5 2; 2 4 3];
B= [1 ; 8;  4];
I= [0 0 1];                    % Places with <= equations is taken zero and >= is taken 1
%% Making s1, s2 and s3
S= eye(size(A,1));             % Identity matrix of order of size of row of A [1 0 0; 0 1 0; 0 0 1]
index = find(I>0);             % finding the indexes with >= sign
S(index,:)= -S(index,:);       % make the rows negative where :>= -> [1 0 0; 0 1 0; 0 0 -1]
%% Clubbing
%mat1=[A s]
mat=[A S B]
obj1=array2table(mat)
%  obj=array2table(C,'VariableNames',{'x1','x2','x3'})
tabl=array2table(mat,'VariableNames',{'x1','x2','x3','s1','s2','s3','b'})
