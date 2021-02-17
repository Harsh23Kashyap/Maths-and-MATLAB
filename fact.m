cn= input("Enter number: ");
fact =1;
i=1;
while (i<=n)
    fact = fact*i;
    i=i+1;
end
fprintf("The factorial of %.d is %d ",n,fact);