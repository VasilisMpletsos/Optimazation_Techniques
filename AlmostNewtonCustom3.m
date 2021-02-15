function AlmostNewtonCustom3(x1,x2)
D=[1 0 ; 0 1];
g=0.01;
e=0.00000001;
k=0;
dk=-D*gradf(x1,x2);
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    pk=[g*dk(1) ; g*dk(2)];
    qk=gradf(x1+g*dk(1),x2+g*dk(2))-gradf(x1,x2);
    x1=x1+g*dk(1);
    x2=x2+g*dk(2);
    tk=transpose(qk)*D*qk;
    uk=(pk/(transpose(pk)*qk))-((D*qk)/tk);
    D=D+((pk*transpose(pk))/(transpose(pk)*qk))-((D*qk*transpose(qk)*D)/(transpose(qk)*D*qk))+tk*uk*transpose(uk);
    eigen=eig(D);
    if eigen(1)<0 || eigen(2)<0
        disp('Error!!');
    end
    dk=-D*gradf(x1,x2);
    df=gradf(x1,x2);
    k=k+1;
end
k
x1
x2
end

