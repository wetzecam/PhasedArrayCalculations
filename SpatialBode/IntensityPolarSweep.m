function [Amplitude] = IntensityPolarSweep(d , phi , Theta, lambda)
    
    %Theta = (pi/180.0).*Theta;
    Robs = 100.0;

    Nsrc = size(d,1);

    X = Robs.*cosd(Theta);
    Y = Robs.*sind(Theta);
    
    Phase = zeros(size(lambda,1), size(lambda,2), Nsrc);
    
    NetCos = zeros(size(lambda));
    
    for i = 1:Nsrc
        Phase(:,:,i) = (360./lambda).*DistanceCalc(X,Y,d(i,1),d(i,2)) - repmat(phi(i,:),[size(Theta,1), 1]);
    end
    
    %repmat(phi(i,:),[size(Theta,1), 1])
    
    for i = 1:(Nsrc-1)
        for j = (i+1):Nsrc

            DeltaPhase = Phase(:,:,i) - Phase(:,:,j);
            NetCos = NetCos + (cosd(DeltaPhase));
            fprintf('[%i %i]', i,j);
        end
        fprintf('\n');
    end
    
    
    Amplitude = sqrt(Nsrc/2 + NetCos);
end