close all;

theta = 0:0.01:2*pi;
rho = 100.0;
X = rho.*cos(theta);
Y = rho.*sin(theta);

[theta,Lambda] = meshgrid(0.0:0.05:180.0 , logspace(-1,2, 400));

figure

srcPos = [ -0.625  , 0.0;
           -0.125 , 0.0;
            0.0 , 0.0;
            0.125  , 0.0;
            0.625 , 0.0;
            ];
        
Phase = [  0.0;
           0.0;
           0.0;
           0.0;
           0.0;
           ];
       
Phase = pi.*Phase;

Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
Amp = Amp./max(Amp);
subplot(2,2,1);
s = surface(log10(Lambda),theta,Amp);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar

%%
Phase = [  0.5;
           0.25;
           0.0;
           0.25;
           0.5;
           ];
       
Phase = pi.*Phase;

Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
Amp = Amp./max(Amp);
subplot(2,2,2);
s = surf(log10(Lambda),theta,Amp);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar

%%
Phase = [  0.75;
           0.375;
           0.0;
           0.375;
           0.75;
           ];
       
Phase = pi.*Phase;

Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
Amp = Amp./max(Amp);
subplot(2,2,3);
s = surf(log10(Lambda),theta,Amp);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar

%%
Phase = [  1.0;
           0.5;
           0.0;
           0.5;
           1.0;
           ];
       
Phase = pi.*Phase;

Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
Amp = Amp./max(Amp);
subplot(2,2,4);
s = surf(log10(Lambda),theta,Amp);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar