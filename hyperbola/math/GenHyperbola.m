function [yHyper] = GenHyperbola(n , d , k , xHyper)

B = ((n*pi)^2) / ( (k^2)) ;

A = ( 4*B*(d^2) - B^2 ) / (16*(d^2) - 4*B);
C = (d^2) - B/4;

yHyper = sqrt (A.*( 1 + (xHyper.^2)./C ) );

end

