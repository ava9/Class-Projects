% Aditya Agashe
% CS 1112 - 001 
% Professor: Dr. Daisy Fan
% Problem Set 1: Question 2: calcShadow
% Position a light source and a box in a room and determine the extent of
% the shadow cast by the box.

% Set up the window
close all         % Close all previous figure windows
figure            % Start a new figure window
hold on           % Keep the same set of axes (multiple plots on same axes)
axis equal        % unit lengths on x- and y-axis are equal
axis([0 10 0 10]) % x-axis limits [0,10], y-axis limits [0,10]

% Top left corner of box, point T
xt=5;  yt=7;
plot(xt, yt, 'bo')           % Format Blue circle
plot([xt xt], [1 yt], 'k:')  % Format blacK dotted line
text(xt, yt, '  T')

%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%

% Light source, point L
xL=rand*5;  yL=(rand*3)+7;
plot(xL, yL, 'r*')           % format Red asterisk
text(xL, yL, '  L')

% Draw a cyan solid line from point T to (10,8))
plot([xt 10],[yt 8], 'c-')

% User-clicked point
title('Click on the dotted line below')
[xu, yu]= ginput(1);
plot(5, yu, 'm+')          % Format Magenta cross
text(5, yu, '  U')
messageToShow= sprintf('You clicked at (%.1f,%.1f)', xu, yu);
title(messageToShow)

%Draw in rectangle
plot([5 5], [7 yu ], 'k') %T to U
plot ([5 10], [yu yu], 'k') %U to bottom right point
plot ([10 10], [yu 7], 'k') %bottom right point to upper right point
plot ([10 5], [7 7], 'k') %upper right point to T

slope = ((yL-yu)/(xL-5)); %Slope of line from L to U

testy = (5*slope)+yu; %value of y-coordinate of intersection point in if statement
testx = 5-(yu/slope); %value of x-coordinate of intersection point in else statement
if (testy>=0)
    plot([xL 10], [yL testy], 'r:') %red dotted line to edge
    plot([10 10],[yu testy],'b-','LineWidth',3) %plot blue shadow edge 
else
    plot([xL testx], [yL 0], 'r:') %red dotted line to edge
    plot([10 10],[yu 0],'b-','LineWidth',3) %plot blue shadow y edge
    plot([10 testx],[0 0],'b-','LineWidth',3) %plot blue shadow x edge
end
    
messageToShow= sprintf('The Light Source is at (%.1f,%.1f)', xL, yL); %display light source coordinates
title(messageToShow) %update title




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not change the code below %%%

hold off