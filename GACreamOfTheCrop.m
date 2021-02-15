function GACreamOfTheCrop()
population=randi([0 1],12,24,100);
testvalues=[-0.5728 -0.1187 0 -0.7081 0 0.1068 -0.7651 0 0 -0.6368 0.6882 -0.7081 0 0.7081 -0.6882 0.6368 0 0 0.7651 -0.1068 0 0.7081 0 0.1187 0.5728];
generation=1;
while generation<=10000
    
    generation=generation+1
    
    %Ypologismos twn metablhtwn twn 12 gaussianwn tou ka8e atomou
    G=zeros(12,4,100);
    for i=1:1:100
        for g=1:1:12
            x0=[population(g,1,i) population(g,2,i) population(g,3,i) population(g,4,i) population(g,5,i) population(g,6,i)];
            G(g,1,i)=0.09375*bi2de(x0)-3;
            y0=[population(g,7,i) population(g,8,i) population(g,9,i) population(g,10,i) population(g,11,i) population(g,12,i)];
            G(g,2,i)=0.09375*bi2de(y0)-3;
            sx=[population(g,13,i) population(g,14,i) population(g,15,i) population(g,16,i) population(g,17,i) population(g,18,i)];
            G(g,3,i)=0.03125*bi2de(sx)+0.03125;
            sy=[population(g,19,i) population(g,20,i) population(g,21,i) population(g,22,i) population(g,23,i) population(g,24,i)];
            G(g,4,i)=0.03125*bi2de(sy)+0.03125;
        end
    end
    
    %Ypologismos ths ygeias tou ka8e atomou
    offset=zeros([100 1]);
    X=[-2 -1 0 1 2];
    Y=[-2 -1 0 1 2];
    functionValue=0;
    for i=1:1:100
        for y=1:1:5
            for x=1:1:5
                for g=1:1:6
                    functionValue=functionValue + exp(-( ((X(x)-G(g,1,i))^2)/(2*(G(g,3,i)^2)) + ((Y(y)-G(g,2,i))^2)/(2*(G(g,4,i)^2)) ));
                end
                for g=7:1:12
                    functionValue=functionValue - exp(-( ((X(x)-G(g,1,i))^2)/(2*(G(g,3,i)^2)) + ((Y(y)-G(g,2,i))^2)/(2*(G(g,4,i)^2)) ));
                end
                offset(i)=offset(i)+abs(testvalues(x+5*(y-1))-functionValue);
                functionValue=0;
            end
        end
    end
    
    fitnessIndex=zeros([100 1]);
    for i=1:1:100
        fitnessIndex(i)=1 - (offset(i)/max(offset));
    end
    
    %Epilogh 50 atomwn pou 8a epibiwsoun
    theChosenOnes=zeros([50 1]);
    for i=1:1:50
        [~,I]=max(fitnessIndex);
        theChosenOnes(i)=I;
        fitnessIndex(i)=0;
    end
    
    populationTemp=population;
    for i=1:1:50
        population(:,:,i)=populationTemp(:,:,theChosenOnes(i));
    end
    
    %Crossovers
    for i=1:1:25
        parentA=randi([1 50]);
        parentB=randi([1 50]);
        for g=1:1:12
            cut=randi([1 23]);
            population(g,1:cut,50+i)=population(g,1:cut,parentA);
            population(g,cut:end,50+i)=population(g,cut:end,parentB);
            population(g,1:cut,75+i)=population(g,1:cut,parentB);
            population(g,cut:end,75+i)=population(g,cut:end,parentA);
        end
    end
    
    %Mutations (1% chance)
    for i=1:1:100
        for g=1:1:12
            for c=1:1:24
                yayOrNay=randi([1 100]);
                if yayOrNay==100
                    if population(g,c,i)==1
                        population(g,c,i)=0;
                    else
                        population(g,c,i)=1;
                    end
                end
            end
        end
    end
    
end

    %Ypologismos twn metablhtwn twn 12 gaussianwn tou ka8e atomou
    G=zeros(12,4,100);
    for i=1:1:100
        for g=1:1:12
            x0=[population(g,1,i) population(g,2,i) population(g,3,i) population(g,4,i) population(g,5,i) population(g,6,i)];
            G(g,1,i)=0.09375*bi2de(x0)-3;
            y0=[population(g,7,i) population(g,8,i) population(g,9,i) population(g,10,i) population(g,11,i) population(g,12,i)];
            G(g,2,i)=0.09375*bi2de(y0)-3;
            sx=[population(g,13,i) population(g,14,i) population(g,15,i) population(g,16,i) population(g,17,i) population(g,18,i)];
            G(g,3,i)=0.0625*bi2de(sx)+0.0625;
            sy=[population(g,19,i) population(g,20,i) population(g,21,i) population(g,22,i) population(g,23,i) population(g,24,i)];
            G(g,4,i)=0.0625*bi2de(sy)+0.0625;
        end
    end
    
    %Ypologismos ths ygeias tou ka8e atomou
    offset=zeros([100 1]);
    X=[-2 -1 0 1 2];
    Y=[-2 -1 0 1 2];
    functionValue=0;
    for i=1:1:100
        for y=1:1:5
            for x=1:1:5
                for g=1:1:6
                    functionValue=functionValue + exp(-( ((X(x)-G(g,1,i))^2)/(2*(G(g,3,i)^2)) + ((Y(y)-G(g,2,i))^2)/(2*(G(g,4,i)^2)) ));
                end
                for g=7:1:12
                    functionValue=functionValue - exp(-( ((X(x)-G(g,1,i))^2)/(2*(G(g,3,i)^2)) + ((Y(y)-G(g,2,i))^2)/(2*(G(g,4,i)^2)) ));
                end
                offset(i)=offset(i)+abs(testvalues(x+5*(y-1))-functionValue);
                functionValue=0;
            end
        end
    end
    
    [~,champion]=min(offset);
    offset(champion)
    G(1:12,1:4,champion)
    
    X=linspace(-2,2,201);
    Y=linspace(2,-2,201);
    for i=1:1:201
    for j=1:1:201
    F(i,j)= exp(-( ((X(j)-G(1,1,champion))^2)/(2*(G(1,3,champion)^2)) + ((Y(i)-G(1,2,champion))^2)/(2*(G(1,4,champion)^2)) )) + exp(-( ((X(j)-G(2,1,champion))^2)/(2*(G(2,3,champion)^2)) + ((Y(i)-G(2,2,champion))^2)/(2*(G(2,4,champion)^2)) )) + exp(-( ((X(j)-G(3,1,champion))^2)/(2*(G(3,3,champion)^2)) + ((Y(i)-G(3,2,champion))^2)/(2*(G(3,4,champion)^2)) )) + exp(-( ((X(j)-G(4,1,champion))^2)/(2*(G(4,3,champion)^2)) + ((Y(i)-G(4,2,champion))^2)/(2*(G(4,4,champion)^2)) )) + exp(-( ((X(j)-G(5,1,champion))^2)/(2*(G(5,3,champion)^2)) + ((Y(i)-G(5,2,champion))^2)/(2*(G(5,4,champion)^2)) )) + exp(-( ((X(j)-G(6,1,champion))^2)/(2*(G(6,3,champion)^2)) + ((Y(i)-G(6,2,champion))^2)/(2*(G(6,4,champion)^2)) )) - exp(-( ((X(j)-G(7,1,champion))^2)/(2*(G(7,3,champion)^2)) + ((Y(i)-G(7,2,champion))^2)/(2*(G(7,4,champion)^2)) )) - exp(-( ((X(j)-G(8,1,champion))^2)/(2*(G(8,3,champion)^2)) + ((Y(i)-G(8,2,champion))^2)/(2*(G(8,4,champion)^2)) )) - exp(-( ((X(j)-G(9,1,champion))^2)/(2*(G(9,3,champion)^2)) + ((Y(i)-G(9,2,champion))^2)/(2*(G(9,4,champion)^2)) )) - exp(-( ((X(j)-G(10,1,champion))^2)/(2*(G(10,3,champion)^2)) + ((Y(i)-G(10,2,champion))^2)/(2*(G(10,4,champion)^2)) )) - exp(-( ((X(j)-G(11,1,champion))^2)/(2*(G(11,3,champion)^2)) + ((Y(i)-G(11,2,champion))^2)/(2*(G(11,4,champion)^2)) )) - exp(-( ((X(j)-G(12,1,champion))^2)/(2*(G(12,3,champion)^2)) + ((Y(i)-G(12,2,champion))^2)/(2*(G(12,4,champion)^2)) ));
    end
    end
    surf(X,Y,F)
    xlabel('X')
    ylabel('Y')
end