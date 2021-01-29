function [Amplitude] = WaveAmpDipoleSource(rx, ry, sx, sy)
distance = DistanceCalc(rx,ry,sx,sy);


COSTHETA = abs(rx-sx)./distance;


Amplitude = COSTHETA.*sin(distance);
Amplitude(isnan(Amplitude)) = 0;

end