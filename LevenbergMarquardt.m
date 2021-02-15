function  LevenbergMarquardt(x1,x2)
tic;
e=0.00001;
g=0.01;
k=0;
mk=0.001;
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    eigenvalues = eig(hessianf(x1,x2)+mk*[1 0 ; 0 1]);
    while eigenvalues(1)<=0 || eigenvalues(2)<=0
        mk=mk+0.001;
        eigenvalues = eig(hessianf(x1,x2)+mk*[1 0 ; 0 1]);
    end
    dk=-inv(hessianf(x1,x2)+mk*[1 0 ; 0 1]) * gradf(x1,x2);
    bmin=(transpose(dk)*gradf(x1+g*dk(1),x2+g*dk(2))) * inv(transpose(dk)*gradf(x1,x2));
    amax=(f(x1,x2)-(f(x1+g*dk(1),x2+g*dk(2)))) * inv(g*(-transpose(dk))*gradf(x1,x2));
    if amax<=0
        disp('A problems');
    elseif bmin>=1
        disp('B problems');
    end
    x1=x1+g*dk(1);
    x2=x2+g*dk(2);
    mk=0.001;
    df=gradf(x1,x2);
    k=k+1;
end
x1
x2
k
toc;
end