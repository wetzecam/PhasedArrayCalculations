[X,Y] = meshgrid(-100:2:100,-100:2:100);
R = X.^2 + Y.^2;
Amp = zeros(size(R));

Sx = [-10 : 5 : 10];
Sy = zeros(1,21);
for i = 1:length(Sx)
   Amp = Amp + sin(DistanceCalc(X,Y, Sx(i), Sy(i)));
end

Amp = Amp.*Amp;

surf(X,Y,Amp)