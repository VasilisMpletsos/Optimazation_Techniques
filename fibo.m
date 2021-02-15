function k = fibo(f,n)

a=0;
b=6;

for i=1:1:n-1
    x1=a+(fibonacci(n-i-1)/fibonacci(n-i+1))*(b-a);
    x2=a+(fibonacci(n-i)/fibonacci(n-i+1))*(b-a);
    if f(x1)>f(x2)
        a=x1;
    elseif f(x1)<=f(x2)
        b=x2;
    end
end