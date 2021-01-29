[X,Y] = meshgrid(-20:0.2:20,-20:0.2:20);
R = X.^2 + Y.^2;

Amp = WaveAmpDipoleSource(X,Y, 0.0,0.0);

Amp = Amp.*Amp;

surf(X,Y,Amp)
xlabel('X')