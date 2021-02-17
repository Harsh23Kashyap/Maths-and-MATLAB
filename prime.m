function r = prime(n);
n=input("Enter number: ");
result =0;
if(n==1)
    result=1;
elseif(n==2)
    result=0;
else
    for i=2:n-1
        if mod(n,i)==0
            result=1;
            break;
        end
    end
end
if result ==0
    fprintf("%d is a prime number ",n)
else
    fprintf("%d is not a prime number ",n)

end