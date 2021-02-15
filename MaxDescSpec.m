function MaxDescSpec(x1,x2)
k=0;
e=0.01;
g=0.1;
while sqrt(x1^2+x2^2)>=e
    x1 = x1-g*x1;
    x2 = x2-g*x2;
    k=k+1;
end
x1
x2
k
end
