function multipleBlemishes(imfile)
% Show image named by imfile and correct the blemishes selected by the 
%user. imfile is a string naming a jpeg color image.
% Display the image. Allow the user to select a blemish using mouse clicks
% around the blemish. Then correct the blemish by assigning to the pixels
% that lie in a circular area approximating the blemish area the median
% color calculated from the pixels that surround the blemish. The user can
% select another blemish to correct by clicking in the image again or
% quit the program by clicking outside the image. The image with all the
% selected blemishes fixed is saved in the file ’blemishfixed.jpg’ in the
% current directory. Instructions to the user should appear in the title
% area of the figure window throughout program execution.
% This function calls functions centroidCalculator and blemishCorrector.

close all %Close all figure windows
figure %Start a figure window
hold on %Keep all subsequent plot commands on same axes 
term=0; %terminate counter is set to "false"
a='Click outside the mage to exit, or click inside to remove blemishes.';
b='Click on another blemish to continue, or click outside the image to ';
b=[b,'end the program.']; %strings for title
title(a)
imNew=imread(imfile); %read image
[i, j, k] = size(imNew); %rows=i and columns=j
axis([0 j 0 i]); %set axis
imshow(imNew); %display imNew
rows = i; columns = j;
hold on %Keep all subsequent plot commands on same axes 
while(term==0) %while terminate is false
    [ux, uy] = ginput(1); %user input (click a point)
    if (((ux<0)||(ux>columns))||((uy>rows)||(uy<0))) %out of bounds
        term=1; %terminate
    else %run the protocol to fix the blemish
        [x, y, r] = centroidCalculator(imNew, ux, uy);
        imNew = blemishCorrector(imNew, x, y ,r);
        imshow(imNew);
        title(b) %update the title
    end
end
imwrite(imNew, 'blemishfixed.jpg') %write the image to a file