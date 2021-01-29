[X,Y] = meshgrid(-10:0.5:10,-10:0.5:10);
R = X.^2 + Y.^2;

Amp = WaveAmpPointSource(X,Y,0,0);

surf(X,Y,Amp)