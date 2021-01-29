function [Amplitude] = WaveAmpPointSource(rx, ry, sx, sy)
distance = DistanceCalc(rx,ry,sx,sy);


Amplitude = sin(distance)./distance;
Amplitude(isnan(Amplitude)) = 0;

end

