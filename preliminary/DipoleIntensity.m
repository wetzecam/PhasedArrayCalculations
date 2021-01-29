function [Amplitude] = DipoleIntensity(rx, ry, sx, sy)
distance = DistanceCalc(rx,ry,sx,sy);


COSTHETA = abs(rx-sx)./distance;


Amplitude = COSTHETA.*COSTHETA./(distance/10);
Amplitude(isnan(Amplitude)) = 0;

end