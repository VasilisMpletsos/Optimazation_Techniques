function MaxDescProj(x1,x2)
k=0;
e=0.01;
g=0.01;
s=0.1;
while sqrt(x1^2+x2^2)>=e
    
    if (x1-s*x1)>=-20 && (x1-s*x1)<=10
        x1bar=x1-s*x1
    elseif (x1-s*x1)<-20
        x1bar=-20
    elseif (x1-s*x1)>10
        x1bar=10
    end
    
    if (x2-s*x2)>=-12 && (x2-s*x2)<=15
       x2bar=x2-s*x2;
    elseif (x2-s*x2)<-12
       x2bar=-12;
    elseif (x2-s*x2)>15
       x2bar=15;
    end
    
    x1 = x1+g*(x1bar-x1);
    x2 = x2+g*(x2bar-x2);
    k=k+1;
end
x1
x2
k
end