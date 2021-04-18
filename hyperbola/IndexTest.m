addpath('plotting')
addpath('classes')
addpath('math')
% 
%  Dimensionless.

lambda = 1;
k = 2*pi/lambda;

XMAX = 4;
%% Quadratic Spacing - y  ;  Zero - x 

d=lambda+0.0001;
yQuad = [ -d,d ];
Phase = [0,pi];

DeltaPhase = Phase(1)-Phase(2);

xQuad = zeros(size(yQuad));


xHyper = linspace(-XMAX,XMAX,1024);

[Nc , Nd] = GenPosNegIndex(k, 2*d, DeltaPhase);

for i = 1:size(Nc,2)
    yHyperCon(:,i) = -sign(Nc(i)).*GenHyperbola(Nc(i) , d , k , xHyper);
end

for i = 1:size(Nd,2)
    yHyperDes(:,i) = -sign(Nd(i)).*GenHyperbola(Nd(i) , d , k , xHyper);
end

%% Plotting
close all

PhasedAvgInterferePlot(xQuad, yQuad, Phase, k, XMAX);
title('2d = \lambda')

for i = 1:size(Nd,2)
    plot(xHyper,yHyperDes(:,i), 'LineWidth', 2.0, 'Color', 'm');
end
for i = 1:size(Nc,2)
    plot(xHyper,yHyperCon(:,i), 'LineWidth', 2.0, 'Color', 'g');
end

xlim([-XMAX,XMAX]);
ylim([-XMAX,XMAX]);

view(0,270)
xlabel('X-axis (dimensionless)','FontSize',12,'FontWeight','bold')
ylabel('Y-axis (dimensionless)','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12)

%plot3(xHyper,yHyper23,zHyper);
