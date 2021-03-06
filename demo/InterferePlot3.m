function [] = InterferePlot2(SpkrX, SpkrY, k)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(SpkrY,2)
    SpkrArray(i) = Speaker(SpaceVector(SpkrX(i),SpkrY(i)));
end

[X,Y] = meshgrid(-10:0.05:10, -10:0.05:10);
Space = SpaceVector(X,Y);

Amp = zeros(size(X));

for i = 1:size(SpkrArray,2)
    Amp = Amp + cos(k.*Space.Displacement(SpkrArray(i).d));
end

s = surface(X,Y,Amp);
s.EdgeColor = 'none';
colorbar;
hold on
%SpkrX = zeros(size(SpkrY));
scatter(SpkrX,SpkrY,'filled','r');

end
