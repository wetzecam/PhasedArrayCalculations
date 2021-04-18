addpath('plotting')
addpath('classes')
% Using 1kHz as reference Frequency,
%  ALL SPATIAL UNITS IN [ m ] METERS.
MaxL = 0.344;
f_center = 10^3;
c = 344;
k = 2*pi*f_center/c;

N=2;

lambda = 0.5;
k = 2*pi/lambda;

XMAX = 5.0;
%% Quadratic Spacing - y  ;  Zero - x 
%d = 3.0*(c/f_center)/2;
%d = lambda / 2;
d=0.5;
yQuad = [-3*d,-d , d, 3*d];

xQuad = zeros(size(yQuad));

n = 2;

A = (n^2)/16;
B = d^2 - A;

C = (d*n/2)^2 - (n^4)/64;
D = (n^2)/4;
E = 4*d^2 - (n^2)/4;

xHyper = linspace(-XMAX,XMAX,1024);
yHyper = (n/4).*sqrt(abs(1 + (xHyper.^2)./(d^2-(n.^2/16))));
yHyper = sqrt((C + D.*(xHyper.^2))./E);
zHyper = 5.*ones(size(xHyper));

yHyper  = GenHyperbola(1 , d , k , xHyper);
yHyper2 = GenHyperbola(3 , d , k , xHyper);
yHyper3 = GenHyperbola(5 , d , k , xHyper);

yHyper_Neg = -yHyper;
%% Plotting
close all

ContourAvgInterferePlot(xQuad, yQuad, k, XMAX);
title('2d = Lambda')
%plot3(xHyper,yHyper,zHyper);
%plot3(xHyper,yHyper2,zHyper);
%plot3(xHyper,yHyper3,zHyper);

