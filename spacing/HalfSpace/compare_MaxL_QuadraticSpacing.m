addpath('../plotting')
% Using 1kHz as reference Frequency,
%  ALL SPATIAL UNITS IN [ m ] METERS.
MaxL = 3;
f_center = 10^3;
c = 344;
k = 2*pi*f_center/c;

N=31;

%% Quadratic Spacing - y  ;  Zero - x  ;   L = 3m
yQuad = (linspace(1,N,N+1) - (N+1)/2);
yQuad = (yQuad.^2).*sign(yQuad);
yQuad = yQuad - sum(yQuad)/size(yQuad,2);
yQuad = yQuad.*MaxL./(max(yQuad) - min(yQuad));

xQuad = zeros(size(yQuad));

%% Quadratic Spacing - y  ;  Zero - x  ;   L = 1m
MaxL = 1;
yQuad1 = (linspace(1,N,N+1) - (N+1)/2);
yQuad1 = (yQuad1.^2).*sign(yQuad1);
yQuad1 = yQuad1 - sum(yQuad1)/size(yQuad1,2);
yQuad1 = yQuad1.*MaxL./(max(yQuad1) - min(yQuad1));

xQuad1 = zeros(size(yQuad1));

%% Quadratic Spacing - y  ;  Zero - x  ;   L = 5m
MaxL = 5;
yQuad5 = (linspace(1,N,N+1) - (N+1)/2);
yQuad5 = (yQuad5.^2).*sign(yQuad5);
yQuad5 = yQuad5 - sum(yQuad5)/size(yQuad5,2);
yQuad5 = yQuad5.*MaxL./(max(yQuad5) - min(yQuad5));

xQuad5 = zeros(size(yQuad5));

%% Quadratic Spacing - y  ;  Zero - x  ;   L = 10m
MaxL = 10;
yQuad10 = (linspace(1,N,N+1) - (N+1)/2);
yQuad10 = (yQuad10.^2).*sign(yQuad10);
yQuad10 = yQuad10 - sum(yQuad10)/size(yQuad10,2);
yQuad10 = yQuad10.*MaxL./(max(yQuad10) - min(yQuad10));

xQuad10 = zeros(size(yQuad10));

%% Plotting
close all
subplot(2,2,1)
InterferePlot2(xQuad1, yQuad1, k);
title('L = 1m')
subplot(2,2,2)
InterferePlot2(xQuad, yQuad, k);
title('L = 3m')
subplot(2,2,3)
InterferePlot2(xQuad5, yQuad5, k);
title('L = 5m')
subplot(2,2,4)
InterferePlot2(xQuad10,yQuad10,k);
title('L = 10m')