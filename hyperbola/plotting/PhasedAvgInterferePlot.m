function [] = PhasedAvgInterferePlot(SpkrX, SpkrY, Phase, k, XMAX)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(SpkrY,2)
    SpkrArray(i) = Speaker(SpaceVector(SpkrX(i),SpkrY(i)));
end

[X,Y] = meshgrid(-XMAX:(XMAX/1024):XMAX, -XMAX:(XMAX/1024):XMAX);
Space = SpaceVector(X,Y);

PhaseField = zeros(size(X,1),size(X,2),size(SpkrArray,2));

Amp = zeros(size(X));

for i = 1:size(SpkrArray,2)
    PhaseField(:,:,i) = k.*Space.Displacement(SpkrArray(i).d);
end

for i = 1:(size(SpkrArray,2)-1)
    for j = (i+1):(size(SpkrArray,2))
        Amp = Amp + cos(PhaseField(:,:,i)-PhaseField(:,:,j) + Phase(i)-Phase(j));
    end
end

Amp = Amp + size(SpkrArray,2)/2;
Amp = Amp;

f=figure('Position',[10,10,900,850]);
s = surface(X,Y,Amp,'FaceAlpha',0.9);
s.EdgeColor = 'none';
colorbar;
hold on
%SpkrX = zeros(size(SpkrY));
scatter(SpkrX,SpkrY,'filled','r');
xlabel('X')
ylabel('Y')

end
