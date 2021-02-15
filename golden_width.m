function [A,B]=golden_width(f,l)

a=0;
b=6;
g=0.618;
x1=a+(1-g)*(b-a);
x2=a+g*(b-a);
k=1;

K(k)=k;
A(k)=a;
B(k)=b;
    
while(b-a>=l)
    if f(x1)>=f(x2)
        a=x1;
        x2=a+g*(b-a);
        x1=x2;
        k=k+1;
    elseif f(x1)<f(x2)
        b=x2;
        x2=x1;
        x1=a+(1-g)*(b-a);
        k=k+1;
    end
    K(k)=k;
    A(k)=a;
    B(k)=b;
end
plot(K,A)
hold on
plot (K,B)