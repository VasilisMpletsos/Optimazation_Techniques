function [A,B]=dichotomyDiff_width(f,df,n)

a=0;
b=6;
x=(a+b)/2;
k=1;

K(k)=k;
A(k)=a;
B(k)=b;

while (df(x)~=0) & (k<=n)
    if df(x)>0
        b=x;
    elseif df(x)<0
        a=x;
    end
    x=(a+b)/2;
    k=k+1;
    
    K(k)=k;
    A(k)=a;
    B(k)=b;

end

