M = 21; alpha = (M-1)/2; n = 0:M-1;
hd = (cos(pi*(n-alpha)))./(n-alpha); hd(alpha+1)=0;

w_ham = (hamming(M))'; h = hd .* w_ham; [Hr,w,P,L] = Hr_Type3(h);


b=hd;
a = [1];

[db,mag,pha,grd,w2] = freqz_m(b,a);

w = w./max(w);

% plotting
close all
subplot(2,2,1)
plot(w,db)
title('Decible')

subplot(2,2,2)
plot(w,mag)
title('mag')

subplot(2,2,3)
plot(w,pha)
title('Phase')

subplot(2,2,4)
plot(w,grd)
stem(linspace(0,max(w),size(b,2)),b)
title('step response')