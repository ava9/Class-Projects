% Aditya Agashe
% CS 1112 - 001 
% Professor: Dr. Daisy Fan
% Problem Set 2: Question 2: pySum

clear all
clc

a = input('Enter the value of the first leg of a right triangle (leg a) for which you want to find the Pythagorean sum\n');
b = input('Enter the value of the second leg of a right triangle (leg b) for which you want to find the Pythagorean sum\n');
n = 0; %iteration counter
xcur = a; %x(n)
xtemp= 0;
xold = 0; %x(n-1)
ycur = b; %y(n)
ytemp = 0;
xnew = xcur*(1+(2*((ycur*ycur)/((4*xcur*xcur)+(ycur*ycur))))); %x(n+1)
ynew = (ycur*ycur*ycur)/((4*xcur*xcur)+(ycur*ycur)); %y(n+1)
%fprintf('xnew is: %f xcur is: %f  xold is: %f n is: %f\n',xnew, xcur, xold, n);
while (((xcur-xold)>=(10^-8)) && (ycur>=10^-8))
    %Use temp variables to assign xnew [x(n+1)] value to xcur [x(n)]
    %Use temp variables to assign ynew [y(n+1)] value to ycur [y(n)]
    xtemp = xnew; 
    ytemp = ynew;
    %Assign xcur [x(n)] value to xold [x(n-1)]
    xold = xcur;
    xcur = xtemp;
    ycur = ytemp;
    %Calculate xnew [x(n+1)] and ynew [y(n+1)] values
    xnew = xcur*(1+(2*((ycur*ycur)/((4*xcur*xcur)+(ycur*ycur)))));
    ynew = (ycur*ycur*ycur)/((4*xcur*xcur)+(ycur*ycur));
    n = n+1;
    %fprintf('xnew is: %f xcur is: %f  xold is: %f n is: %f\n',xnew, xcur, xold, n);
end
fprintf('The Pythagorean sum is: %f and the number of iterations is: %d\n',xnew, n);
