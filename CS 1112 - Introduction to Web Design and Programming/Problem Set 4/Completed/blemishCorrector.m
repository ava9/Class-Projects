function imNew = blemishCorrector(im, x, y, r)
% Replace the values of the pixels that lie inside the blemish’s circular
% area with the median color returned from function findMedReplacement.
% (This function should call function findMedRepalcement.)
% im is a 3-D uint8 array representing an image.
% Scalars x, y, and r are positive integers. The pixels to be corrected
% are the ones that lie inside the circle centered at (x,y) with a radius
% of r.
% imNew is im but with the appropriate pixel values replaced.
medianColor = findMedReplacement(im, x, y, r); 
%get median color from prev function
[nr, nc, nx] = size(im); %nr=number of rows, nc=number of columns

for i = 1:nr %from 1 to number of rows
    for j = 1:nc %from 1 to number of columns
        dis = sqrt(((i-y)^2)+((j-x)^2)); %distance between (i,j)&(y,x))
        %i corresponds to y because i is the row position
        %j corresponds to x because j is the column position
        if dis <= r %region inside circle
            im(i,j,:) = medianColor; %replace the color
        end
    end
end

imNew = im; %imNew is the altered image

end