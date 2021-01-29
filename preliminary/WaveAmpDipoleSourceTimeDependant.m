function [Amplitude] = WaveAmpDipoleSourceTimeDependant(rx, ry, sx, sy, t)
distance = DistanceCalc(rx,ry,sx,sy);


COSTHETA = abs(rx-sx)./distance;


Amplitude = COSTHETA.*sin(distance - t);%./distance;
Amplitude(isnan(Amplitude)) = 0;

end