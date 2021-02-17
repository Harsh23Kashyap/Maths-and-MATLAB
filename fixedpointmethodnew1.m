%Find roots of f9x) = x*e^x - 1 =0, g(x) = e^-x
f = @(x)(x*exp(x)-1);
syms g(x);
g(x) = exp(-x);
h = diff(g,x);
tolerance = input ('Enter value of tolerance: ');
while 1
    a = input('Enter value of Approximation: ');
    error(1) = 1;
    i = 1;
    if abs(double(h(a))) >= 1
        disp('Wrong Approximation!');
    else
        while error(i) > tolerance
            if abs(double(h(a))) < 1
                x1 = double(g(a));
                i = i+1;
                error(i) = abs(x1-a);
                a = x1;
            else
                break;
            end
        end
        if error(i) < tolerance
            break;
        end
    end
end
fprintf('Root = %d\n',a);
y = 1:i;
plot(y,error);
xlabel('No. of Iteration');
% suppose tu diff(x^2) kr rha h...matlab error dikha dega,uske pehle tu syms x likh kr enter krde,uske baat compiler ko pta lg jayega k yeh variable ki tarah use kr rha h tu,fir same command enter kr...diff(x^2)...ab wo answer de dega 2x