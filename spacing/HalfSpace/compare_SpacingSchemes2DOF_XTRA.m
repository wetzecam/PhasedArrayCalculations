% Using 1kHz as reference Frequency,
%  ALL SPATIAL UNITS IN [ m ] METERS.
MaxL = 3;
f_center = 10^3;
c = 344;
k = 2*pi*f_center/c;

N=31;

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


%% Half Circular Array
yCirc = (linspace(1,N,N+1) - (N+1)/2);
yCirc = yCirc - sum(yCirc)/size(yCirc,2);
yCirc = yCirc.*pi./(max(yCirc)-min(yCirc));
xCirc = -cos(yCirc).*MaxL;
yCirc = sin(yCirc).*MaxL;

%% |x| Array
yAbs = (linspace(1,N,N+1) - (N+1)/2);
yAbs = yCirc - sum(yAbs)/size(yAbs,2);
yAbs = yAbs.*MaxL./(max(yAbs) - min(yAbs));
xAbs = (abs(yAbs) - max(yAbs));


%% Plotting
close all
subplot(2,2,1)
InterferePlot2(xLin, yLin, k);
title('Linear')
subplot(2,2,2)
InterferePlot2(xQuad, yQuad, k);
title('Quadratic')
subplot(2,2,3)
title('Circular')
InterferePlot2(xCirc, yCirc, k);
subplot(2,2,4)
title('Abs(x)')
InterferePlot2(xAbs,yAbs,k);
