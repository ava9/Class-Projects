clc; 
clear all
close all
figure 
hold on
axis equal off

set(0,'RecursionLimit', 1000000)
colr=[.3 .4 .2]; x=0; y=0; h=0; len=1; angle=[25*pi/180 25*pi/180]; scale=1;
b= LSystem('A', 'B-[[A]+A]+BA[+B]-A','BB', 2);
turtleDraw(b, colr, x, y, h, len, angle, scale)