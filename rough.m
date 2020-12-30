%plot(0:10);
%view(3);
clc;
clear;
x = -1:0.5:1;
y = 1:0.5:1;
[X, Y] = meshgrid(x, y);
Z = zeros(length(x), length(y));
Z = (X.^2) + (Y.^2);
mesh(Z)
surf(X, Y, Z)
