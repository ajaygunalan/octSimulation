clc
clear

no_elements = 100;
x = -0.5:1/(no_elements-1):0.5;
y = x;

lambda = 0.633; %wavelength of red laser in micrometer
k = 2*pi/lambda;
theta = pi/3;

[X, Y] = meshgrid(x, y);
E1 = exp(i*0);
E2 = exp(i*k*x*cos(theta));

E = (E1 + E2).*conj(E1+E2);

figure();
imagesc(E);
%colormap gray;
colorbar;