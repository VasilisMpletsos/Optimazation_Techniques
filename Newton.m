function Newton(x1,x2)
k=0;
e=0.00001;
g=0.01;
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    h=hessianf(x1,x2);
    dk=-inv(h)*df;
    x1=x1+g*dk(1);
    x2=x2+g*dk(2);
    df=gradf(x1,x2);
    k=k+1;
end
x1
x2
k
end
