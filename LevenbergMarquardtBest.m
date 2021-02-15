function LevenbergMarquardtBest(x1,x2)
e=0.00000002;
g=0.001; %0.01 (-3,3)
mk=0.000001;
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
        g=g+1
        bmin=(transpose(dk)*gradf(x1+g*dk(1),x2+g*dk(2))) * inv(transpose(dk)*gradf(x1,x2));
        amax=(f(x1,x2)-(f(x1+g*dk(1),x2+g*dk(2)))) * inv(g*(-transpose(dk))*gradf(x1,x2));
    end
    length=sqrt(df(1)^2 + df(2)^2);
    G=linspace(g,5/(1000*length),1000);
    bestx1=x1;
    bestx2=x2;
    for i=1:1:1000
        bmin=(transpose(dk)*gradf(x1+G(i)*dk(1),x2+G(i)*dk(2))) * inv(transpose(dk)*gradf(x1,x2));
        amax=(f(x1,x2)-(f(x1+G(i)*dk(1),x2+G(i)*dk(2)))) * inv(G(i)*(-transpose(dk))*gradf(x1,x2));
        if f(x1+G(i)*dk(1),x2+G(i)*dk(2))<f(bestx1,bestx2) && amax>=0 && bmin<=1
            besti=i;
            bestx1=x1+G(i)*dk(1);
            bestx2=x2+G(i)*dk(2);
        end
    end
    x1=bestx1
    x2=bestx2;
    g=0.0001;
    mk=0.000001;
    df=gradf(x1,x2);
    n=n+1;
end
x1
x2
n
end