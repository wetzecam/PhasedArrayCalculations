[X,Y] = meshgrid(-20:0.5:20,-20:0.5:20);
R = X.^2 + Y.^2;

%Source #1  @ < -1.0, 0.0 >
S1_x = -5.0;    S1_y = 0.0;
Amp_source_1 = WaveAmpPointSource(X,Y, S1_x, S1_y);
%Source #2  @ < +1.0, 0.0 >
S2_x =  5.0;    S2_y = 0.0;
Amp_source_2 = WaveAmpPointSource(X,Y, S2_x, S2_y);

Amp = Amp_source_1 + Amp_source_2;

surf(X,Y,Amp)