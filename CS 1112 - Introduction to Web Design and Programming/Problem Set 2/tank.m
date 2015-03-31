% Aditya Agashe
% CS 1112 - 001 
% Professor: Dr. Daisy Fan
% Problem Set 2: Question 1: tank

clear all
clc

close all       %Close all figure windows
figure          %Start a figure window
hold on         %Keep all subsequent plot commands on same axes
n = input('Determine the volume at how many fill depths, n, where n>2?\n');
r = input('Enter a radius for the spherical caps (note: 2*r must be less than h)\n');
h = input('Enter the height of the tank (note: 2*r must be less than h)\n');
title('Volume vs. Depth');
xlabel('Fill Depth');
ylabel('Volume of Water in Tank');
while (n<=2) %make sure n>2
    n = input('Determine the volume at how many fill depths, n, where n>2?\n');
end 
while ((2*r)>h) %make sure the shape is geometrically accurate
    r = input('Enter a radius for the spherical caps (note: 2*r must be less than h)\n');
    h = input('Enter the height of the tank (note: 2*r must be less than h)\n');
end
V = 0;
for d = 0:(h/n):h
    if (d<r) %Only bottom half sphere
       V = ((pi*d*d)*((2/3)*d));
       plot(d,V,'r+'); %red+
    elseif ((d>r) && (d<(r+(h-(2*r))))) %Bottom half sphere + cylinder
        V = ((pi*r*r*r*(2/3))+((d-r)*pi*r*r));
        plot(d,V,'g+'); %green+
    else %Bottom half sphere + cylinder + top half sphere
        V = ((((pi*r*r*r*(4/3)))+((h-(2*r))*pi*r*r))-((pi*(h-d)*(h-d))*((2/3)*(h-d))));
        plot(d,V,'b+'); %blue+
    end
    
end

hold off        %Subsequent plot command is shown on fresh axes