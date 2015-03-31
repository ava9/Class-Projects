function sierpinskiTri(n)
% Draw the Sierpinski Triangle by running a chaos game for n steps.
% Each step generates one point. 


%also, generate a random point 
xp1 = ceil(10*rand); yp1 = ceil(10*rand);   %Random point P1
for k = 1:n
    chaos(xp1,yp1)
end
function [xnew, ynew] = chaos(x,y)
% (xnew,ynew) is the next point in the chaos game given current point (x,y).
% xnew, ynew, x, y, are each a scalar.
close all
figure 
axis([0 1 0 1])
hold on
y3 = ((sqrt(3)/2));
trianglex = [0 1 1/2];
triangley = [0 0 y3];

plot(trianglex,triangley,'o')


randompoint = [xp1 yp1];                    %Matrix for P1


a = floor(1 + 3*rand);              %In order to randomly choose points
d = [trianglex(a) triangley(a)];            %d is now one of three vertices

xnew = (randompoint(1) + d(1))/2;   %midpoint of x
ynew = (randompoint(2) + d(2))/2;   %midpoint of y

plot(xnew,ynew,'*b')
x = xnew;
y = ynew;

end
hold off
end
