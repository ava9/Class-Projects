% Aditya Agashe
% CS 1112 - 001 
% Professor: Dr. Daisy Fan
% Problem Set 2: Question 3: hailstones

clear all
clc

close all       %Close all figure windows
figure          %Start a figure window
hold on         %Keep all subsequent plot commands on same axes
fprintf('Please wait while I am computing...\n');
xlabel('Starting Value (n)');
ylabel('Hailstone Sequence Length');
counter = 1;
maxCounter = 0;
storeN = 0;
for n=2:1:10000
    i=n;
    editN=n;
    while (i==n)
        while ((rem(editN,2)==0)&& (editN~=1)) %even
            editN = editN/2;
            counter = counter + 1;
        end
        while ((rem(editN,2)==1) && (editN~=1)) %odd
            editN = ((3*editN)+1);
            counter = counter + 1;
        end
        if (editN==1)
            i=0;
        end
    end
    if (maxCounter<counter)
        maxCounter=counter;
        storeN=n;
    end
    plot(n,counter,'r+');
    counter = 1;
end
title(['Max Sequence Length = ',num2str(maxCounter),' (at n (starting value) = ',num2str(storeN),')']);
%fprintf('counter: %d for the n = %d\n',maxCounter, storeN);    

hold off        %Subsequent plot command is shown on fresh axes