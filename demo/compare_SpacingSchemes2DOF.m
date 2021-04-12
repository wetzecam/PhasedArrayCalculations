% Using 1kHz as reference Frequency,
%  ALL SPATIAL UNITS IN [ m ] METERS.
addpath('classes');
MaxL = 3;
f_center = 10^3;
c = 344;
k = 2*pi*f_center/c;

N=32;

%%  Linear Spacing
yLin = linspace(1,N,N+1);
% center about Zero
yLin = yLin - sum(yLin)/size(yLin,2);
yLin = yLin.*MaxL./(max(yLin) - min(yLin));

xLin = zeros(size(yLin));

%% Quadratic Spacing
yQuad = (linspace(1,N,N+1) - (N+1)/2);
yQuad = (yQuad.^2).*sign(yQuad);
yQuad = yQuad - sum(yQuad)/size(yQuad,2);
yQuad = yQuad.*MaxL./(max(yQuad) - min(yQuad));

xQuad = zeros(size(yQuad));

%% Plotting
close all
subplot(2,1,1)
InterferePlot2(xLin, yLin, k);
subplot(2,1,2)
InterferePlot2(xQuad, yQuad, k);
