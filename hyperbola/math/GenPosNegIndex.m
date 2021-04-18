function [Nconstruct,Ndestruct] = GenPosNegIndex(k, L, dPhi)

if abs(dPhi) >= 2*pi
    dPhi = rem(dPhi,2*pi);
end

[Nmin,Nmax] = GetHyperIndexRange(k,L,0);
Nindex = [floor(Nmin)-1:1:ceil(Nmax)+1];

Nconstruct = Nindex(mod(Nindex,2)==0);
Ndestruct  = Nindex(mod(Nindex,2)==1);

Nconstruct = Nconstruct + dPhi/pi;
Ndestruct  = Ndestruct + dPhi/pi;

Nconstruct(Nconstruct > ceil(Nmax) | Nconstruct < floor(Nmin)) = [];
Ndestruct(Ndestruct > ceil(Nmax) | Ndestruct < floor(Nmin)) = [];
end

