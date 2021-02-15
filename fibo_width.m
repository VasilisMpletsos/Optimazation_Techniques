function [A,B]=fibo_width(f,n)

a=0;
b=6;

A(1)=a;
B(1)=b;
    
for i=1:1:n-1
    x1=a+(fibonacci(n-i-1)/fibonacci(n-i+1))*(b-a);
    x2=a+(fibonacci(n-i)/fibonacci(n-i+1))*(b-a);
    if f(x1)>f(x2)
        a=x1;
    elseif f(x1)<=f(x2)
        b=x2;
    end
    A(i+1)=a;
    B(i+1)=b;
end

[A,B]=fibo_width(h,18);
[C,D]=fibo_width(h,15);
[E,F]=fibo_width(h,14);
[G,H]=fibo_width(h,13);
[I,J]=fibo_width(h,12);
plot(A,'b:x','LineWidth',3)
hold on
plot(B,'b:x','LineWidth',3)
hold on
plot(C,'r--*','LineWidth',3)
hold on
plot(D,'r--*','LineWidth',3)
hold on
plot(E,'c-o','LineWidth',3)
hold on
plot(F,'c-o','LineWidth',3)
hold on
plot(G,'g:x','LineWidth',3)
hold on
plot(H,'g:x','LineWidth',3)
hold on
plot(I,'y--*','LineWidth',3)
hold on
plot(J,'y--*','LineWidth',3)
title('Look-up range per run')
xlabel('Number of runs')
ylabel('Width location on X')
axis([0 20 0 6])