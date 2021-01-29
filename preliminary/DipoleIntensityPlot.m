[X,Y] = meshgrid(-20:0.5:20,-20:0.5:20);
R = X.^2 + Y.^2;

Amp = DipoleIntensity(X,Y, 0.0,0.0);

surf(X,Y,Amp)
xlabel('X')
zlim([-0.25 2])