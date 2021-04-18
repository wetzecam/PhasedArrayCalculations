addpath('plotting')
addpath('classes')
% Using 1kHz as reference Frequency,
%  ALL SPATIAL UNITS IN [ m ] METERS.
MaxL = 0.344;
f_center = 10^3;
c = 344;
k = 2*pi*f_center/c;

N=2;

%% Quadratic Spacing - y  ;  Zero - x 
yQuad = (linspace(0,N,N) - (N)/2);
yQuad = (yQuad.^2).*sign(yQuad);
yQuad = yQuad - sum(yQuad)/size(yQuad,2);
yQuad = yQuad.*MaxL./(max(yQuad) - min(yQuad));

xQuad = zeros(size(yQuad));

%% Circular Array Linear - Y , Circular - <XY> :  a = 1m  D = 3m
yCirc = (linspace(0,N,N) - (N)/2);
yCirc = yCirc - sum(yCirc)/size(yCirc,2);
yCirc = yCirc.*MaxL./(max(yCirc) - min(yCirc));

a = 1;
b = MaxL/2;
d = sqrt( a^2 + b^2 );
alpha = atan(b/a);
R = d/(2*cos(alpha));
xCirc = -sqrt(R.^2 - yCirc.^2) + (R-a);

%% Circular Array : Linear - Y , Circular - <XY> : a=0.5m

a = 0.5;
b = MaxL/2;
d = sqrt( a^2 + b^2 );
alpha = atan(b/a);
R = d/(2*cos(alpha));
xCirc2 = -sqrt(R.^2 - yCirc.^2) + (R-a);

%% Circular Array : Linear - Y , Circular - <XY> : a=0.25m

a = 0.25;
b = MaxL/2;
d = sqrt( a^2 + b^2 );
alpha = atan(b/a);
R = d/(2*cos(alpha));
xCirc3 = -sqrt(R.^2 - yCirc.^2) + (R-a);

%% Plotting
close all
subplot(2,1,1)
InterferePlot2(xQuad, yQuad, k);
title('Quadratic Spacing')

subplot(2,1,2)
AvgInterferePlot2(xQuad, yQuad, k);
title('Quadratic Spacing : RMS average')