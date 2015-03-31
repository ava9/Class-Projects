function [xnew, ynew] = chaos(x,y)

y3 = ((sqrt(3)/2));
xVec = [0 1 1/2];
yVec = [0 0 y3];

    a = floor(1 + 3*rand);              %In order to randomly choose points
    d = [xVec(a) yVec(a)];                    %d is now one of three vertices
    midx = ((x + d(1)))/2;   %midpoint of x
    midy = ((y + d(2)))/2;   %midpoint of y
 
 [xnew, ynew] = [midx, midy];