function sierpinskiTri(n)

y3 = ((sqrt(3)/2));
x = [0 1 1/2];
y = [0 0 y3];



close all
figure 
axis equal off
hold on


xp1 = ceil(10*rand); yp1 = ceil(10*rand);   %Random point P1
randompoint = [xp1 yp1];                    %Matrix for P1
q = [randompoint(1) randompoint(2)];
p=chaos(x,y);
plot(p(1), p(2), '.')
q=p;
for k = 2:500
    p=chaos(q(1), q(2));
    plot (p(1), p(2), '.')
    q = p;        %So that next time, instead of random p, THIS P1 is used
end
hold off