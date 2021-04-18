function [] = AvgInterferePlot2(SpkrX, SpkrY, k)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(SpkrY,2)
    SpkrArray(i) = Speaker(SpaceVector(SpkrX(i),SpkrY(i)));
end

[X,Y] = meshgrid(0:0.05:10, -5:0.05:5);
Space = SpaceVector(X,Y);

PhaseField = zeros(size(X,1),size(X,2),size(SpkrArray,2));

Amp = zeros(size(X));

for i = 1:size(SpkrArray,2)
    PhaseField(:,:,i) = k.*Space.Displacement(SpkrArray(i).d);
end

for i = 1:(size(SpkrArray,2)-1)
    for j = (i+1):(size(SpkrArray,2))
        Amp = Amp + cos(PhaseField(:,:,i)-PhaseField(:,:,j));
    end
end

Amp = Amp + size(SpkrArray,2)/2;
Amp = sqrt(Amp);

s = surface(X,Y,Amp);
s.EdgeColor = 'none';
colorbar;
hold on
%SpkrX = zeros(size(SpkrY));
scatter(SpkrX,SpkrY,'filled','r');
xlabel('X')
ylabel('Y')

end
