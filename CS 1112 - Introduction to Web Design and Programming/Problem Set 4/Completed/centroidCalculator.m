function [x, y, r] = centroidCalculator(im, ux, uy)
% Return the centroid of a set of points selected by the user and the mean
% distance from the centroid.
% im is a 3-D uint8 array representing an image.
% Scalars ux and uy are the coordinates of one point marking the blemish
% (the first point that the user had clicked to start selecting a blemish).
% This function accepts user clicks until the user clicks the same point as
% the starting point (within a reasonable tolerance) or until the user
% clicks outside of the image. Mark each clicked point inside the image
% with an asterisk and connect each point to the previous point with
% a line.
% Scalars x and y are the coordinates of the centroid of all the clicked
% points INSIDE the image. Round x and y to integers.
% Scalar r is the mean distance between a clicked point and the centroid,
% excluding any point outside the image. Round r to an integer.
% Thus, the circle centered at (x,y) with the radius r approximates the
% area of the blemish.
% This function assumes that a figure window showing the image is already
% open. (This is handled by function multipleBlemishes.)

[a1, b1, c1] = size(im);
rows = a1; col = b1; %assigns rows and columns
[points] = [];
distanceVector=[]; 
oldX=0;
oldY=0;
xVec=[];
yVec=[];
%initialize vectors used later
count=1; %index for distanceVector
a = [ux,uy]; %coordinates of each point
term = 0; %count to terminate while loop
while (((a(1)>=0)&&(a(1)<=col))&&((a(2)>=0)&&(a(2)<=rows))&&(term==0))
    %while user input is in bounds and term is "false" (term=0)
    if (((sqrt((ux-a(1))^2)+((uy-a(2))^2))<10)&&(count~=1))
        %if the dist from the first point to the current point is<10 
        %(10=tolerance), and it is not the first iteration, then terminate
        term=1;
    elseif(((a(1)<0)||(a(1)>col))||((a(2)>rows)||(a(2)<0)))
        %if user click is out of bounds, terminate
        term=1;
    else
        %else plot the points and calculate new x,y, distance
        [points] = [points a];
        plot(a(1),a(2),'-*')
        plot(xVec, yVec,'-*')
        XsumTillNow = sum(points(1:2:length(points)));
        YsumTillNow = sum(points(2:2:length(points)));
        x = 2*XsumTillNow/length(points);
        y = 2*YsumTillNow/length(points);
        distanceVector(count)=sqrt(((a(1)-x)^2)+((a(2)-y)^2));
        count=count+1;
        oldX=a(1);
        oldY=a(2);
        a = round(ginput(1));
        xVec=[oldX, a(1)]; %create x&y plotting vectors
        yVec=[oldY, a(2)];
    end
    
end

r=0;
for z=1:length(distanceVector) %add all distanceVector values
    r = r + distanceVector(z);
end
r = r/length(distanceVector); %divide by length to find average distance
end