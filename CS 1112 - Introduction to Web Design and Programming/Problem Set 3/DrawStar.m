function DrawStar(xc,yc,r,c)
% Adds a 5-pointed star to the current window.
% Assumes hold is on.
% The star has radius r, center (xc,yc) and color c where c is either
% an rgb vector or one of the built-in colors 'r', 'g', 'y', 'b',
% 'w', 'k', 'c', or 'm'.

% The radius of the inner 5 vertices..
r2 = r/(2*(1+sin(pi/10)));
% Set up the vertices...
tau = pi/5;
for k=1:11
    theta = (2*k-1)*pi/10;
    if 2*floor(k/2)~=k
        % Outer vertex...
        x(k) = xc + r*cos(theta);
        y(k) = yc + r*sin(theta);
    else
        % Inner vertex...
        x(k) = xc + r2*cos(theta);
        y(k) = yc + r2*sin(theta);
    end
end
fill(x,y,c)