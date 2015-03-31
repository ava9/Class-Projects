clc; 
clear all
close all
figure 
hold on
axis equal off

set(0,'RecursionLimit', 1000000)
colr=[.3 .4 .2]; x=0; y=0; h=pi; len=1; angle=[pi/2 pi/2]; scale=1;
s= LSystem('D', 'D+D-D-D+D', 3);

turtleDraw(s, colr, x, y, h, len, angle, scale)