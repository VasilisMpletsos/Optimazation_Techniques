function MaxDescCustom(x1,x2)

e=0.00001;
g=0.01;
dk=-gradf(x1,x2);
while sqrt(dk(1)^2+dk(2)^2)>=e
    x1 = x1+g*dk(1);
    x2 = x2+g*dk(2);
    g=g*abs( ( 0.000001 / (f(x1-g*dk(1),x2-g*dk(2)) - f(x1,x2))/ f(x1-g*dk(1),x2-g*dk(2)) ) );
    dk=-gradf(x1,x2);
end
x1
x2
end