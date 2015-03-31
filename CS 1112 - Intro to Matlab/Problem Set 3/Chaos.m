Function sierpinskiTri(n)
% Draw the Sierpinski Triangle by running a chaos game for n steps.
% Each step generates one point. 
close all
figure 
axis equal 
hold on

function [xnew, ynew] = chaos(x,y)
% (xnew,ynew) is the next point in the chaos game given current point (x,y).
% xnew, ynew, x, y, are each a scalar.
trianglex = [0 1 1/2];
triangley = [0 0 y3];

a = floor(1 + 3*rand);              %In order to randomly choose points
d = [trianglex(a) triangley(a)];                    %d is now one of three vertices



hold off