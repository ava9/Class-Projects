function Z = rectArray(n,xmax,ymax)
% Z is a 1-d array of n rectangle structs, each as defined by function
% MakeRect and each is randomly generated in the area bounded by (0,0),
% (xmax,0), (xmax,ymax), and (0,ymax). The first generated rectangle is
% Z(1), the second generated rectangle is Z(2), and so forth.

Z(n)=MakeRect(0,0,0,0);
if xmax~=0 && ymax~=0
    
    for r=1:n
        xl=xmax*rand; xr=xmax*rand; yb=ymax*rand; yt=ymax*rand;
        
        while (xl==xr || yb==yt)
            xl=xmax*rand; xr=xmax*rand; yb=ymax*rand; yt=ymax*rand;
        end
        
        if xl > xr
            temp=xr;
            xr=xl;
            xl=temp;
        end
        if yb > yt
            temp=yt;
            yt=yb;
            yb=temp;
        end
        Z(r)=MakeRect(xl,xr,yb,yt);
    end
    
else
    disp('You can''t set a max to be 0')
end
end