function MaxDesc(x1,x2)
k=0;
e=0.00000001;
g=0.001; % 0.1 works too up to 0.82 limit
dk=-gradf(x1,x2);
while sqrt(dk(1)^2+dk(2)^2)>=e
    x1 = x1+g*dk(1);
    x2 = x2+g*dk(2);
    dk=-gradf(x1,x2);
    k=k+1;
end
x1
x2
k
end
