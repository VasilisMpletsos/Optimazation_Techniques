function dichotomy(f,e,l)

k=1;
a=0;
b=6;

while(b-a>=l)
    x1=(a+b)/2-e;
    x2=(a+b)/2+e;
    if f(x1)<f(x2)
        b=x2;
        k=k+1;
    elseif f(x1)>=f(x2)
        a=x1;
        k=k+1;
    end
end