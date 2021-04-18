addpath('../plotting')
% Using 1kHz as reference Frequency,
%  ALL SPATIAL UNITS IN [ m ] METERS.
MaxL = 3;
f_center = 10^3;
c = 344;
k = 2*pi*f_center/c;

N=31;

%% Quadratic Spacing - y  ;  Zero - x 
yQuad = (linspace(1,N,N+1) - (N+1)/2);
yQuad = (yQuad.^2).*sign(yQuad);
yQuad = yQuad - sum(yQuad)/size(yQuad,2);
yQuad = yQuad.*MaxL./(max(yQuad) - min(yQuad));

xQuad = zeros(size(yQuad));

%% Linear Spacing - Y , Zero - X
yCirc = (linspace(1,N,N+1) - (N+1)/2);
yCirc = yCirc - sum(yCirc)/size(yCirc,2);
yCirc = yCirc.*MaxL./(max(yCirc) - min(yCirc));

xCirc = zeros(size(yCirc));

%% Linear - Y , Circular - X : a=0.25m

a = 0.25;
b = MaxL/2;
d = sqrt( a^2 + b^2 );
alpha = atan(b/a);
R = d/(2*cos(alpha));
xCirc2 = -sqrt(R.^2 - yCirc.^2) + (R-a);

%% Quadratic - Y , Circular - X : a=0.25m

xCirc3 = -sqrt(R.^2 - yQuad.^2) + (R-a);

%% Plotting
close all
subplot(2,2,2)
AvgInterferePlot3(xQuad, yQuad, k,10.0);
title('Quad - Y ; Zero - X')

subplot(2,2,1)
AvgInterferePlot3(xCirc, yCirc, k,10.0);
title('Lin - Y ; Zero - X')

subplot(2,2,3)
AvgInterferePlot3(xCirc2, yCirc, k,10.0);
title('Lin - Y ; Circ - X')

subplot(2,2,4)
AvgInterferePlot3(xCirc3, yCirc, k,10.0);
title('Quad - Y ; Circ - X')