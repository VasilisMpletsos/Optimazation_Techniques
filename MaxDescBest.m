function MaxDescBest(x1,x2)
k=0;
e=0.00001;
dk=-gradf(x1,x2);
while sqrt(dk(1)^2+dk(2)^2)>=e
    
    %%%%%%%%%%
    % Internal Optimization
    length=sqrt(dk(1)^2 + dk(2)^2);
    G=linspace(0,5/length,1000000);
    bestx1=x1;
    bestx2=x2;
    besti=1;
    for i=1:1:1000000
        if f(x1+G(i)*dk(1),x2+G(i)*dk(2))<f(bestx1,bestx2)
            besti=i;
            bestx1=x1+G(i)*dk(1);
            bestx2=x2+G(i)*dk(2);
        end
    end
    g=G(besti);
    % Optimized
    %%%%%%%%%%
    
    x1 = x1+g*dk(1);
    x2 = x2+g*dk(2);
    dk=-gradf(x1,x2);
    k=k+1
end
x1
x2
k
end
   