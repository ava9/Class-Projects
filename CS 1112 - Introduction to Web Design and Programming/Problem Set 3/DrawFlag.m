function DrawFlag(a,b,L1,W1,L2,r1,r2)
% Adds a 13-star, 13-stripe colonial flag to the current window.
% Assumes hold is on. The flag is L1-by-W1 with lower left corner
% at (a,b). The length of the blue area is L2.  The ring of stars has
% radius r1 and its center is the center of the blue area. The radius of
% the individual stars is r2.

% Stripe width...
s = W1/13;
% Draw the stripes...
for k=1:13
    % Draw the k-th stripe
    bk = b + (k-1)*s;
    if rem(k,2)==1 &&  k<=6
        DrawRect(a,bk,L1,s,'r')
    elseif rem(k,2)==0 && k<=6
        DrawRect(a,bk,L1,s,'w')
    elseif rem(k,2)==1 && k>6
        DrawRect(a+L2,bk,L1-L2,s,'r')
    else
        DrawRect(a+L2,bk,L1-L2,s,'w')
    end
end
% Draw the blue area...
DrawRect(a,b+6*s,L2,7*s,'b')
% Draw the stars...
xc = a + L2/2; yc = b + 9.5*s; theta = 2*pi/13; phi = pi/2;
for k=0:12
    % Draw the k-th star...
    angle = k*theta+phi;
    DrawStar(xc+r1*cos(angle),yc+r1*sin(angle),r2,'w')
end