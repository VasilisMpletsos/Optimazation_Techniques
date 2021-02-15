function MaxDescBestFAIL(x1,x2)

e=0.00001;
dk=-gradf(x1,x2);
while sqrt(dk(1)^2+dk(2)^2)>=e
    U=[dk(1),dk(2)]/norm([dk(1),dk(2)]); %unit vector based on gradf
    
    %%%%%%%%%%
    % Internal Optimization
    length=sqrt(dk(1)^2 + dk(2)^2);
    b=5/length;
    a=0;
    n=20;
    g=(a+b)/2;
    k=0;
    while (k<=n) & (gradf( x1+g*dk(1) , x2+g*dk(2) )~=0)
        if gradf( x1+g*dk(1) , x2+g*dk(2) )*U >0
            a=g;
        elseif gradf( x1+g*dk(1) , x2+g*dk(2) )*U <0
            b=g;
        end
        g=(a+b)/2;
        k=k+1;
    end
    % Optimized
    %%%%%%%%%%
    
    x1 = x1+g*dk(1);
    x2 = x2+g*dk(2);
    dk=-gradf(x1,x2);
end
x1
x2
end
   