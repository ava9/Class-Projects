function DrawFlagModified(a,b,L1,W1,L2,stars)
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
if stars == 1
    for r = 1:6
            if rem(r,2) ~= 0
                yc = (6*s)+r;
                for xc = 1:9
                    DrawStar(a + 0.9*xc,b + yc,.3,'w')
                end
            else
                yc = (6*s)+r;
                for xc = 1:8
                    DrawStar(a + 0.9*xc+0.5, b + yc,.3,'w')
                end
            end
    end
elseif stars == 2
        for r = 1:8
            if rem(r,2) ~= 0
                yc = (6*s)+0.75*r;
                for xc = 1:7
                    DrawStar(a + 1.2*xc,b + yc,.3,'w')
                end
            else
                yc = (6*s)+0.75*r;
                for xc = 1:6
                    DrawStar(a + 1.2*xc+.5,b + yc,.3,'w')
                end
            end
        end
else
    for r = 1:6
        yc = (6*s)+r;
        for xc = 1:9
            DrawStar(a +0.9*xc,b + yc,.3,'w')
        end
    end
end
