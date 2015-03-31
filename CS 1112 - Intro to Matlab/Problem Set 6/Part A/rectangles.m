function [colrZ, colrSorted] = rectangles(Z,xmax,ymax,colorS,colorL)
% Draw the rectangles in struct array Z:
% Figure 1 draws the rectangles in the order Z(1), Z(2), ..., Z(n), where n
% is the length of Z. Draw all rectangles in one color of your choice.
% Figure 2 draws the rectangles starting from the largest (by area) to the
% smallest. The colors of the rectangles are linearly interpolated with
% the largest area corresponding to colorL and the smallest area
% corresponding to colorS.
% colrZ is the n-by-3 matrix where colrZ(k,:) are the rgb values of Z(k).
% colrSorted is the n-by-3 matrix w

close all
figure(1)
hold on
axis([0 xmax 0 ymax])

n=length(Z);

for r=1:n
    ShowRect(Z(r),'b');
end

colrSorted=zeros(n,3);
for r=1:n
    f=(r-1)/(n-1);
    colrSorted(r,:)=f*colorL+(1-f)*colorS;
end

A=zeros(n);
for r=1:n
    A(r)=(Z(r).right-Z(r).left)*(Z(r).top-Z(r).bot);
end
[~,idx]=sort(A);

figure(2)
hold on
axis([0 xmax 0 ymax])

colrZ=zeros(n,3);
for r=n:-1:1
    ShowRect(Z(idx(r)),colrSorted(r,:))
    colrZ(idx(r),:)=colrSorted(r,:);
end

hold off

end