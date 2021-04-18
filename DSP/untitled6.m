b = [0 , 0.01 , -0.2 , 0.5 , -0.2 , 0.01 , 0];

a = [1];

[db,mag,pha,grd,w] = freqz_m(b,a);

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