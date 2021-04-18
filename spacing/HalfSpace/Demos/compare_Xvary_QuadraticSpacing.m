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

%% Quadratic Spacing - y  ;  Abs - x  ;
yQuad1 = (linspace(1,N,N+1) - (N+1)/2);
yQuad1 = (yQuad1.^2).*sign(yQuad1);
yQuad1 = yQuad1 - sum(yQuad1)/size(yQuad1,2);
yQuad1 = yQuad1.*MaxL./(max(yQuad1) - min(yQuad1));

xQuad1 = abs(yQuad1);
xQuad1 = xQuad1 - max(xQuad1);

%% Quadratic Spacing - y  ;  Parabolic - x  ;
yQuad5 = (linspace(1,N,N+1) - (N+1)/2);
yQuad5 = (yQuad5.^2).*sign(yQuad5);
yQuad5 = yQuad5 - sum(yQuad5)/size(yQuad5,2);
yQuad5 = yQuad5.*MaxL./(max(yQuad5) - min(yQuad5));

xQuad5 = (yQuad5).^2;
xQuad5 = xQuad5 - max(xQuad5)

%% Quadratic Spacing - y  ;  Zero - x  ;   L = 10m
yQuad10 = (linspace(1,N,N+1) - (N+1)/2);
yQuad10 = (yQuad10.^2).*sign(yQuad10);
yQuad10 = yQuad10 - sum(yQuad10)/size(yQuad10,2);
yQuad10 = yQuad10.*MaxL./(max(yQuad10) - min(yQuad10));

xQuad10 = -sqrt((MaxL/2).^2 - yQuad10.^2);

%% Plotting
figure
subplot(2,2,1)
InterferePlot2(xQuad1, yQuad1, k);
title('Abs(Y)')
subplot(2,2,2)
InterferePlot2(xQuad, yQuad, k);
title('Zero')
subplot(2,2,3)
InterferePlot2(xQuad5, yQuad5, k);
title('Parabolic(Y)')
subplot(2,2,4)
InterferePlot2(xQuad10,yQuad10,k);
title('Circular')