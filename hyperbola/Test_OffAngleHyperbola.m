addpath('plotting')
addpath('classes')
addpath('math')
% 
%  Dimensionless.

lambda = 1;
k = 2*pi/lambda;
XMAX = 4;

%% Source Position Vectors / Troransform Calc

D1 = SpaceVector(-0.5+1,0.5);
D2 = SpaceVector(+0.5+1,-0.5);
L = D1.Displacement(D2);

Dcenter = D1.Average(D2);

Dref = D1.Difference(Dcenter);

Theta = Dref.InnerAngle(SpaceVector(0,1));

%% Quadratic Spacing - y  ;  Zero - x 
d=L/2;

Phase = [0,0];
DeltaPhase = Phase(1)-Phase(2);

yQuad = [ D1.y , D2.y ];
xQuad = [ D1.x , D2.x ];


xHyper = linspace(-2*XMAX,2*XMAX,2048);

[Nc , Nd] = GenPosNegIndex(k, 2*d, DeltaPhase);


for i = 1:size(Nc,2)
    yHyperCon(:,i) = -sign(Nc(i)).*GenHyperbola(Nc(i) , d , k , xHyper);
    xHyperCon(:,i) = xHyper;
    
    xTMP = cos(Theta).*xHyperCon(:,i) - sin(Theta).*yHyperCon(:,i);
    yTMP = sin(Theta).*xHyperCon(:,i) + cos(Theta).*yHyperCon(:,i);
    
    yHyperCon(:,i) = yTMP + Dcenter.y;
    xHyperCon(:,i) = xTMP + Dcenter.x;
end

for i = 1:size(Nd,2)
    yHyperDes(:,i) = -sign(Nd(i)).*GenHyperbola(Nd(i) , d , k , xHyper);
    xHyperDes(:,i) = xHyper;
    
    xTMP = cos(Theta).*xHyperDes(:,i) - sin(Theta).*yHyperDes(:,i);
    yTMP = sin(Theta).*xHyperDes(:,i) + cos(Theta).*yHyperDes(:,i);
    
    yHyperDes(:,i) = yTMP + Dcenter.y;
    xHyperDes(:,i) = xTMP + Dcenter.x;
end




%% Plotting
close all

PhasedAvgInterferePlot(xQuad, yQuad, Phase, k, XMAX);
title('2d = \lambda')

for i = 1:size(Nd,2)
    plot(xHyperDes(:,i),yHyperDes(:,i), 'LineWidth', 2.0, 'Color', 'm');
end
for i = 1:size(Nc,2)
    plot(xHyperCon(:,i),yHyperCon(:,i), 'LineWidth', 2.0, 'Color', 'g');
end

xlim([-XMAX,XMAX]);
ylim([-XMAX,XMAX]);

view(0,270)
xlabel('X-axis (dimensionless)','FontSize',12,'FontWeight','bold')
ylabel('Y-axis (dimensionless)','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12)

%plot3(xHyper,yHyper23,zHyper);