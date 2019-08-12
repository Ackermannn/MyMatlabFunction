close all; clear all; clc

x=[0 3 5 7 9 11 12 13 14 15 ]; 
y=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6];

x1=0:0.1:15;
y1=interp1(x,y,x1,'spline');

plot(x,y,'r*');
hold on;

plot(x1,y1,'b');
hold off;

legend('轮廓数据','插值函数');
