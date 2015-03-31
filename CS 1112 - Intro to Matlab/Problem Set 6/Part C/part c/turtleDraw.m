function turtleDraw(inst, colr, x, y, h, len, angle, scale)
% Draw a diagram given the instruction string inst using Turtle Graphics.
% colr is a color name (e.g., ’g’ is green) or a color vector (e.g., [1 0 .5]).
% x and y represent the starting coordinate of the turtle.
% h is the initial heading of the turtle, in radians.
% len is the step length.
% angle is a 2-vector: angle(1) is how many radians to turn clockwise;
% angle(2) is how many radians to turn counterclockwise.
% scale, between 0 and 1, is a fraction for scaling the step length.
% inst is a string containing only these characters: ’D’, ’+’, ’-’, ’[’, and ’]’.
% D Draw 1 step from current position given the current heading
% + Turn clockwise (change heading but do not draw)
% - Turn counterclockwise (change heading but do not draw)
% [ Record current position and heading and scale step length (do not draw)
% ] Return to most recently recorded position and heading and re-scale
% step length (do not draw)

close all
figure 
hold on
axis equal off
b=1;
num=0;
for i=1:length(inst)
    if(inst(1)=='[')
        num=num+1;
    end
end
cX=zeros(1,num);
cY=zeros(1,num);
cH=zeros(1,num);
cLen=zeros(1,num);
while ((isempty(inst))==0)
    if (inst(1)=='A')||(inst(1)=='B')
        %Draw from current position in current heading one step length.
        plot([x x+((cos(h))*len)], [y y+((sin(h))*len)],'Color',colr) %try 'colr' too
        inst=inst(2:length(inst));
        x=x+((cos(h))*len);
        y=y+((sin(h))*len);
    elseif inst(1)=='+'
        %Turn clockwise—change heading without drawing.
        h=h-angle(1);
        inst=inst(2:length(inst));
    elseif inst(1)=='-'
        %Turn counterclockwise—change heading without drawing.
        h=h+angle(2);
        inst=inst(2:length(inst));
    elseif inst(1)=='['
        %Record current location & heading. Scale (reduce) the step length.
        cX(b)=x; %current X
        cY(b)=y; %current Y
        cH(b)=h; %current Heading
        cLen(b)=len; %current Length
        len=len*scale; %scale length
        inst=inst(2:length(inst));
        b=b+1;
       % while (isempty(inst)==0)&&(inst(1)~=']')
    elseif inst(1)==']'
        x=cX(b-1);
        y=cY(b-1);
        h=cH(b-1);
        len=cLen(b-1);
        inst=inst(2:length(inst));
    end
end
end