function [] = Dual_InterferePlot(SpkrX, SpkrY, k, L)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(SpkrY,2)
    SpkrArray(i) = Speaker(SpaceVector(SpkrX(i),SpkrY(i)));
end

[X,Y] = meshgrid(-10:0.05:10, -10:0.05:10);
Space = SpaceVector(X,Y);

Amp = zeros(size(X));

for i = 1:size(SpkrArray,2)
    SpkrArray(i).d.y = SpkrArray(i).d.y + L;
    Amp = Amp + cos(k.*Space.Displacement(SpkrArray(i).d));
end

for i = 1:size(SpkrArray,2)
    SpkrArray(i).d.y = SpkrArray(i).d.y - 2*L;
    Amp = Amp + cos(k.*Space.Displacement(SpkrArray(i).d));
end

s = surface(X,Y,Amp);
s.EdgeColor = 'none';
colorbar;
hold on
%SpkrX = zeros(size(SpkrY));
scatter(SpkrX,SpkrY+L,'filled','r');
scatter(SpkrX,SpkrY-L,'filled','r');
xlabel('X')
ylabel('Y')

end
