%--------------------------------------------------------------------%
%------------ Time signal and its selected dft-----------------------%
%--------------------------------------------------------------------%
clc
close all
clear all
%--------------------------------------------------------------------%
N=50000;       % no. of time steps   
nf=500;  % no. of freq points
%------------- forming the time signal E(t) -----------------------------%
wR=2.27e15; % freq of time signal in Hz
delta=10e-15; % width of gaussian pulse
t0=1*10^(-14); % delay
t=linspace(-3.0e-13,5.0e-12,N); % time array
E=exp(-((t-t0).*(t-t0))./(delta*delta)).*cos(wR*t);
fstart=1.5e15; % starting frequency
fend=3.0e15; % ending frequency
f=linspace(fstart,fend,nf); % frequencies array
dt=t(2)-t(1); % time step 
%------------- calculates dft only for selected frequencies-----------%
%--------------------------defined by array f ------------------------%
Ew(1:nf)=0;
for k=1:nf
    sum1=0;
    for i=1:N
        sum1=sum1+E(i)*exp(1j*f(k)*t(i));
    end
    Ew(k)=sum1*dt;
end
%---------------------------------------------------------------------%
%----------- visualization--------------------------------------------%
%---------------------------------------------------------------------%
figure(1)
subplot(211)
plot(t,E,'linewidth',2)
axis([-3e-14 3e-14 -1 1])
h=gca; 
get(h,'FontSize') 
set(h,'FontSize',14)
xlabel('t','fontSize',14);
ylabel('E(t)','fontSize',14);
fh = figure(1);
set(fh, 'color', 'white'); 
subplot(212)
plot(f,abs(Ew),'r','linewidth',2)
h=gca; 
get(h,'FontSize') 
set(h,'FontSize',14)
xlabel('f(Hz)','fontSize',14);
ylabel('E(f)','fontSize',14);
fh = figure(1);
set(fh, 'color', 'white'); 
%---------------------------------------------------------------------%