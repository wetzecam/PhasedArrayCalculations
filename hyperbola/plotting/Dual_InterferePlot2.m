function [] = Dual_InterferePlot(SpkrX, SpkrY, k, L, W)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

SpkrY2 = SpkrY + L;
SpkrX2 = W - SpkrX;

SpkrX = SpkrX - W;
SpkrY = SpkrY - L;

for i = 1:size(SpkrY,2)
    SpkrArray(i)  = Speaker(SpaceVector(SpkrX(i),SpkrY(i)));
    SpkrArray2(i) = Speaker(SpaceVector(SpkrX2(i),SpkrY2(i)));
end

[X,Y] = meshgrid(-10:0.05:10, -10:0.05:10);
Space = SpaceVector(X,Y);

Amp = zeros(size(X));

for i = 1:size(SpkrArray,2)
    Amp = Amp + cos(k.*Space.Displacement(SpkrArray(i).d));
    Amp = Amp + cos(k.*Space.Displacement(SpkrArray2(i).d));
end

s = surface(X,Y,Amp);
s.EdgeColor = 'none';
colorbar;
hold on
%SpkrX = zeros(size(SpkrY));
scatter(SpkrX,SpkrY,'filled','r');
scatter(SpkrX2,SpkrY2,'filled','r');
xlabel('X')
ylabel('Y')

end
