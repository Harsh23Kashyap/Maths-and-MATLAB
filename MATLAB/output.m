function output=output(x)
format rat                      
%% write 1st Constraint % all constraints are of <= sign
x1=x(:,1)                       % storing the points of x1 (first column of x)
x2=x(:,2)                       % storing the points of x2 ( second column of x)
cons1=round(x1+(2.*x2)-10)      % evaluate expression for all x1 and x2
s1=find(cons1>0)                % now after points are evaluated find indexes for which the evaluated expression value cons1 is greater than zero
% cons1=round(x1+(2.*x2)-10)    % x1 + 2x2 >= 10
% s1=find(cons1<0)              % sign changes
x(s1,:) = []                    % now the indexes which is found in s1 will be removed from x. This will remove the indexes found.

%% write 2nd Constraint % all constraints are of <= sign
x1=x(:,1);
x2=x(:,2);
cons2=round((x1+x2)-6)
s2=find(cons2>0)
x(s2,:)=[]

%% write 3rd Constraint % all constraints are of <= sign
x1=x(:,1)
x2=x(:,2)
cons3=round((x1-(2.*x2))-1)
s3=find(cons3>0)
x(s3,:)=[]

%% storing it in ouput
output=x

end