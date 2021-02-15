function dichotomyDiff(f,df,n)

a=0;
b=6;
x=(a+b)/2;
k=1;

while (df(x)~=0) & (k<=n)
    if df(x)>0
        b=x;
    elseif df(x)<0
        a=x;
    end
    x=(a+b)/2;
    k=k+1;
end