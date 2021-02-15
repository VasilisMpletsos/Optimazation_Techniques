function AlmostNewton(x1,x2)
D=[1 0 ; 0 1];
k=0;
e=0.00000002;
g=1;
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    dk=-D*gradf(x1,x2);
    p=[g*dk(1);g*dk(2)];
    q=gradf(x1+g*dk(1),x2+g*dk(2))-df;
    x1=x1+g*dk(1);
    x2=x2+g*dk(2);
    t=transpose(q)*D*q;
    u=(p/(transpose(p)*q)) - ((D*q)/t);
    D=D+((p*transpose(p))/(transpose(p)*q))-((D*q*transpose(q)*D)/(transpose(q)*D*q))+t*u*transpose(u);
    eigenvalues=eig(D);
    if eigenvalues(1)<0 || eigenvalues(2)<0
        disp('Error');
    end
    df=gradf(x1,x2);
    k=k+1;
end
x1
x2
k
end

