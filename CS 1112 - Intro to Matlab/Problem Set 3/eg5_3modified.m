% Script Eg5_3
% Illustrates DrawFlag

% Initializations
location = [0 25 0 25;0 0 16 16];

close all
figure
axis equal 
hold on
SW = 1;               % Stripe width
FW = 13*SW;           % Flag width
GR = (1+sqrt(5))/2;   % Golden ratio
FL = GR*FW;           % Flag length
RR = 2.5*SW;          % Ring radius
SR = 0.5*SW;          % Star radius

a = randperm(4);    %switch function from Part B
BL = .45*FL; DrawFlagModified(location(1,a(1)), location(2,a(1)),FL,FW,BL,1)
BL = .45*FL; DrawFlagModified(location(1,a(2)), location(2,a(2)),FL,FW,BL,2)
BL = .45*FL; DrawFlagModified(location(1,a(3)), location(2,a(3)),FL,FW,BL,3)
hold off
