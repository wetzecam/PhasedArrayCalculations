function [Nmin,Nmax] = GetHyperIndex(k, L, dPhi)
%

xMin = (-k*L+dPhi)/pi;
xMax = (k*L+dPhi)/pi;


if xMax > 0
    Nmax = floor(xMax);
else
    Nmax = -floor(abs(xMax));
end

if xMin < 0
    Nmin = -floor(abs(xMin));
else
    Nmin = floor(xMin);
end

end

