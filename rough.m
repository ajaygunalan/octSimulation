% constants
c = 3.00e+08;
% gaussian source
lc = 800e-09;
l = linspace(lc-(lc/3), lc+(lc/3), 1024);
fwhm = 50e-09;
sigma = fwhm./sqrt(8*log(2));
wc = (2*pi*c)/lc;
w = linspace(wc-(wc/3), wc+(wc/3), 1024);
fwhm_w = (2*pi*c*fwhm)./(lc.^2);
sigma2 = fwhm_w./sqrt(8*log(2));
y = gaussmf(w, [sigma2, wc]);
figure (), plot (w, y), axis tight, title ('Light Source Spectrum')
xlabel ('Optical Frequency (rad.s-1)'), ylabel ('Amplitude (a.u.)')
% sample
n = [1.00 1.30 1.50 1.00];
z = [5.00e-06 15.00e-06 30.00e-06 0.00e-06];
s1 = 0;
h = 0;
for i = 1:3
 rj = (n(i+1)-n(i))/(n(i+1)+n(i));
 s1 = s1 + n(i)*z(i);
 h = h + rj*exp(1i*2.*(w./c)*s1);
end
% time domain
x = linspace (0, 100e-6, 1024);
T1 = zeros(size(x));
for j = 1:length(x)
 for jj = 1:length(w)
 ph = cos(2*x(j)*w(jj)/c);
 T1(j) = T1(j) + real(0.5*(y(jj)*h(jj)*ph));
 end
end
132
figure (), plot(x./1e-6, T1), axis tight, title ('TD-OCT Interferogram')
xlabel ('Mirror displacement (um)'), ylabel ('Amplitude (a.u.)')
