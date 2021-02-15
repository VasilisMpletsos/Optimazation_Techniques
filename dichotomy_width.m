function dichotomy_width(f,e,l)

k=1;
a=0;
b=6;

K(k)=k;
A(k)=a;
B(k)=b;

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
    K(k)=k;
    A(k)=a;
    B(k)=b;
end
plot(K,A)
hold on
plot(K,B)
