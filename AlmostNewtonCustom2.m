function AlmostNewtonCustom2(x1,x2)
D=[1 0 ; 0 1];
g=0.00001;
e=0.00000001;
k=0;
conn=0;
dk=-D*gradf(x1,x2);
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    
    while conn==0
        if (transpose(gradf(x1,x2))*dk)>=(transpose(gradf(x1+g*dk(1),x2+g*dk(2)))*dk)
            g=g*1.001 ;  
        else
            if abs((f(x1+g*dk(1),x2+g*dk(2))-f(x1,x2))/f(x1,x2))<0.1
                gold=g;
                g=g+(5*g*abs((f(x1+g*dk(1),x2+g*dk(2))-f(x1,x2))/f(x1,x2)));
                if (transpose(gradf(x1,x2))*dk)>=(transpose(gradf(x1+g*dk(1),x2+g*dk(2)))*dk)
                    g=gold;
                end
            end
            conn=1;
        end
    end
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
    conn=0;
end
k
x1
x2
end

