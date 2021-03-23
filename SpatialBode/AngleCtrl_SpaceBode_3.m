close all;


[theta,Lambda] = meshgrid(0.0:0.25:180.0 , -3:0.01:1);

Lambda = 10.^Lambda;
figure

srcPos = [ -0.625  , 0.0;
           -0.375  , 0.0;
           -0.125 , 0.0;
            0.125 , 0.0;
            0.375  , 0.0;
            0.625 , 0.0
            ];
        
Phase = [  1.25;
           0.75;
           0.25;
          -0.25;
          -0.75;
          -1.25
           ];
       
Phase = 180.0.*Phase;

Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
%Amp = Amp./max(Amp);
subplot(2,2,1);
s = surface(log10(Lambda),theta,Amp);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar

%%

%Phase = repmat(Phase, [1 , size(Lambda,2)]);
Phase = Phase./2;
Amp2 = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
%Amp2 = Amp2./max(Amp2);
subplot(2,2,2);
s = surface(log10(Lambda),theta,Amp2);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar

%%
%Phase = [  0.75;
%           0.375;
%           0.1875;
%           0.1875;
%           0.375;
%           0.75;
%           ];
       
Phase = Phase./2;

%Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp3 = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
%Amp3 = Amp3./max(Amp3);
subplot(2,2,3);
s = surface(log10(Lambda),theta,Amp3);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar

%%
%Phase = [  4.0;
%           2.0;
%           0.0;
%           0.0;
%           2.0;
%           4.0;
%           ];
       
Phase = Phase./2;

%Phase = repmat(Phase, [1 , size(Lambda,2)]);

Amp4 = IntensityPolarSweep( srcPos , Phase , theta, Lambda);
%Normalize
%Amp4 = Amp4./max(Amp4);
subplot(2,2,4);
s = surface(log10(Lambda),theta,Amp4);
xlabel('Lambda');
ylabel('Theta')
s.EdgeColor = 'none';
colorbar