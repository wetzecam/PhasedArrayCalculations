addpath('plotting')
addpath('classes')
% 
%  Dimensionless.

lambda = 0.5;
k = 2*pi/lambda;

XMAX = 2.0;
%% Quadratic Spacing - y  ;  Zero - x 

d=lambda;
yQuad = [ -2*d, -d , 0 , d , 2*d];

xQuad = zeros(size(yQuad));

n = 2;

A = (n^2)/16;
B = d^2 - A;

C = (d*n/2)^2 - (n^4)/64;
D = (n^2)/4;
E = 4*d^2 - (n^2)/4;

xHyper = linspace(-XMAX,XMAX,1024);

zHyper = 5.*ones(size(xHyper));

%  1 <--> 2 Exchange Curve
yHyper12  = GenHyperbola(1 , d/2 , k , xHyper);
Neg_yHyper12 = -yHyper12;
yHyper12 = yHyper12 + d/2;
Neg_yHyper12 = Neg_yHyper12 + d/2;

%  2 <--> 3 Exchange Curve
yHyper23  = GenHyperbola(1 , d/2 , k , xHyper);
Neg_yHyper23 = -yHyper23;
yHyper23 = yHyper23 - d/2;
Neg_yHyper23 = Neg_yHyper23 - d/2;

% 1 <--> 3 Exchange Curve
yHyper13  = GenHyperbola(1 , d   , k , xHyper);
yHyper13_2  = GenHyperbola(3 , d   , k , xHyper);
Neg_yHyper13 = -yHyper13;
Neg_yHyper13_2 = -yHyper13_2;

yHyper_Neg = -yHyper;
%% Plotting
close all

AvgInterferePlot3(xQuad, yQuad, k, XMAX);
title('2d = Lambda')

plot(xHyper,yHyper12, 'LineWidth', 2.0, 'Color', 'm');
plot(xHyper,Neg_yHyper12, 'LineWidth', 2.0, 'Color', 'm');

plot(xHyper,yHyper13, 'LineWidth', 2.0, 'Color', 'y');
plot(xHyper,yHyper13_2, 'LineWidth', 2.0, 'Color', 'y');
plot(xHyper,Neg_yHyper13, 'LineWidth', 2.0, 'Color', 'y');
plot(xHyper,Neg_yHyper13_2, 'LineWidth', 2.0, 'Color', 'y');

plot(xHyper,yHyper23, 'LineWidth', 2.0, 'Color', 'c');
plot(xHyper,Neg_yHyper23, 'LineWidth', 2.0, 'Color', 'c');


xlim([-XMAX,XMAX]);
ylim([-XMAX,XMAX]);
%plot3(xHyper,yHyper23,zHyper);

