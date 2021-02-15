function ConjugateGradientCustom(x1,x2)
e=0.00000002;
g=0.1;
k=0;
dk=-gradf(x1,x2);
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    dfold=df;
    dkold=dk;
    if abs((f(x1+g*dk(1),x2+g*dk(2))-f(x1,x2))/f(x1,x2))<0.001
        g=g*2;
    end
    x1=x1+g*dk(1);
    x2=x2+g*dk(2);
    dk=-gradf(x1,x2)+( ( transpose( gradf(x1,x2) )* ( gradf(x1,x2)-dfold ) )/( transpose(dfold) * dfold ) )*dkold;
    if rem(100,k)==0
        dk=-gradf(x1,x2);
    end
    df=gradf(x1,x2);
    k=k+1;
    g=0.1;
end
x1
x2
k
end

