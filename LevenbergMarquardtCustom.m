function LevenbergMarquardtCustom(x1,x2)
e=0.00000002;
g=0.001;
mk=0.001;
df=gradf(x1,x2);
n=0;
while sqrt(df(1)^2+df(2)^2)>=e 
    eigenvalues = eig(hessianf(x1,x2)+mk*[1 0 ; 0 1]);
    while eigenvalues(1)<=0 || eigenvalues(2)<=0
        mk=mk+0.001;
        eigenvalues = eig(hessianf(x1,x2)+mk*[1 0 ; 0 1]);
    end
    dk=-inv(hessianf(x1,x2)+mk*[1 0 ; 0 1]) * gradf(x1,x2);
    bmin=(transpose(dk)*gradf(x1+g*dk(1),x2+g*dk(2))) * inv(transpose(dk)*gradf(x1,x2));
    amax=(f(x1,x2)-(f(x1+g*dk(1),x2+g*dk(2)))) * inv(g*(-transpose(dk))*gradf(x1,x2));
    while amax<=0 || bmin >=1
       g=g+1;
       bmin=(transpose(dk)*gradf(x1+g*dk(1),x2+g*dk(2))) * inv(transpose(dk)*gradf(x1,x2));
       amax=(f(x1,x2)-(f(x1+g*dk(1),x2+g*dk(2)))) * inv(g*(-transpose(dk))*gradf(x1,x2));
    end
    if abs((f(x1+g*dk(1),x2+g*dk(2))-f(x1,x2))/f(x1,x2))<0.1 && (transpose(dk)*gradf(x1+2*g*dk(1),x2+2*g*dk(2))) * inv(transpose(dk)*gradf(x1,x2)) && (f(x1,x2)-(f(x1+2*g*dk(1),x2+2*g*dk(2)))) * inv(2*g*(-transpose(dk))*gradf(x1,x2))
        g=g*9;
    end
    x1 = x1+g*dk(1);
    x2 = x2+g*dk(2);
    g=0.01;
    mk=0.001;
    df=gradf(x1,x2);
    n=n+1;
end
x1
x2
n
end