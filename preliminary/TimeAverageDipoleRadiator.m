[X,Y] = meshgrid(-10:0.2:10,-10:0.2:10);
R = X.^2 + Y.^2;
Amp = zeros(size(R));

for t = linspace(0,2*pi, 100)
    Amp = Amp + (WaveAmpDipoleSourceTimeDependant(X,Y, 0.0,0.0, t)).^2;
end

Amp = sqrt(Amp/(2*pi));

surf(X,Y,Amp)
xlabel('X')