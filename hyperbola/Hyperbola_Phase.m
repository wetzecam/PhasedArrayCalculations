addpath('plotting')
addpath('classes')
addpath('math')
% 
%  Dimensionless.

lambda = 1;
k = 2*pi/lambda;

XMAX = 2;
%% Quadratic Spacing - y  ;  Zero - x 

d=0.5*lambda;
yQuad = [ -d,d ];
Phase = [0,pi/2];

DeltaPhase = Phase(1)-Phase(2);

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
yHyper12  = GenHyperbola(-1+DeltaPhase/pi , d , k , xHyper);
Neg_yHyper12 = -GenHyperbola(1+DeltaPhase/pi , d , k , xHyper);

yHyper2  = GenHyperbola(0+DeltaPhase/pi , d , k , xHyper);

yHyper_Neg = -GenHyperbola(2+DeltaPhase/pi , d , k , xHyper);
%% Plotting
close all

PhasedAvgInterferePlot(xQuad, yQuad, Phase, k, XMAX);
title('2d = \lambda')

plot(xHyper,yHyper12, 'LineWidth', 2.0, 'Color', 'm');
plot(xHyper,Neg_yHyper12, 'LineWidth', 2.0, 'Color', 'm');

plot(xHyper,yHyper2, 'LineWidth', 2.0, 'Color', 'g');
plot(xHyper,yHyper_Neg, 'LineWidth', 2.0, 'Color', 'g');

%plot(xHyper,yHyper13, 'LineWidth', 2.0, 'Color', 'm');
%plot(xHyper,yHyper13_2, 'LineWidth', 2.0, 'Color', 'm');
%plot(xHyper,Neg_yHyper13, 'LineWidth', 2.0, 'Color', 'm');
%plot(xHyper,Neg_yHyper13_2, 'LineWidth', 2.0, 'Color', 'm');

%plot(xHyper,yHyper23, 'LineWidth', 2.0, 'Color', 'm');
%plot(xHyper,Neg_yHyper23, 'LineWidth', 2.0, 'Color', 'm');

xlim([-XMAX,XMAX]);
ylim([-XMAX,XMAX]);

view(0,270)
xlabel('X-axis (dimensionless)','FontSize',12,'FontWeight','bold')
ylabel('Y-axis (dimensionless)','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12)

%plot3(xHyper,yHyper23,zHyper);

