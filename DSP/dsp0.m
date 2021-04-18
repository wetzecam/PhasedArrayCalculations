close all
s = tf('s');

a = -1;
H = 1 + a*s^(-1) + a*s^(-2);
bode(H)
hold on
bode(H+a*s^(-3))