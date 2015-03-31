function mRGB = findMedReplacement(im, x, y, r)
% Returns mRGB, the median RGB values of the pixels that lie in the ring
% formed between a circle centered at (x,y) with r and a circle centered
% at (x,y) with radius 2*r.
% The image is first converted from RGB to an HSV representation so that
% median calculations can be done on the hue, saturation, and value
% separately. The median values are then converted back to RGB.
% mRGB is a 1x1x3 uint8 array storing RGB values, in the range 0..255, 
%inclusive.

image = rgb2hsv(im); %convert image
[nr, nc, nx] = size(image);
hue=[]; saturation = []; value = []; %initialize vectors
for i = 1:nc %nc because columns relate to x-values
    for j = 1:nr %nr because rows relate to y-values
        dis = sqrt((j - y)^2 + (i - x)^2); %distance between (x,y)&(i,j)
        if ((dis < 2*r) && (dis > r)) %region between circles
            %build up vectors to find median later
            hue = [hue,image(i,j,1)];
            saturation = [saturation,image(i,j,2)];
            value = [value,image(i,j,3)];
        end
    end
end

%formula for calculating median separately

hue = sort(hue); %sort hue so we can find median
m1 = ceil(length(hue)/2);
if rem(length(hue),2) ~=0 %if odd, use middle value as median
    medianHue = hue(m1);
else %if even, average the two middle values
    medianHue = hue(m1)/2 + hue(m1+1)/2;
end

saturation = sort(saturation); %sort saturation so we can find median
m2 = ceil(length(saturation)/2);
if rem(length(saturation),2) ~=0 %if odd, use middle value as median
    medianSaturation = saturation(m2);
else %if even, average the two middle values
    medianSaturation = saturation(m2)/2 + saturation(m2+1)/2;
end

value = sort(value); %sort value so we can find median
m3 = ceil(length(value)/2);
if rem(length(value),2) ~=0 %if odd, use middle value as median
    medianValue = value(m3);
else %if even, average the two middle values
    medianValue = value(m3)/2 + value(m3+1)/2;
end
%build 3-D matrix mHSV with each median vector
mHSV(1,1,1) = medianHue;
mHSV(1,1,2) = medianSaturation;
mHSV(1,1,3) = medianValue;
mRGB = uint8(255*hsv2rgb(mHSV)); 
%(hsv2rgb is (0,1), so *255 to get (0,255))
end
