%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////

clear all;clc;close all;
load('bilinear.mat')
xi = -106.6685;
yi = 35.0978;
[a,b,c] = bilinear_coef(x,y,z);

zi = bilinear_eval(x,y,z,a,b,c,xi,yi);
zi_Check = interp2(x,y,z,xi,yi);

figure(1)
pcolor(x,y,z)
colorbar

f = @(x) 1./(1+25*x.^2);
n = [5, 11, 21];
x = linspace(-1,1,1000);
y = f(x);
[b,c,d] = spline_coef(x,y);


x1 = linspace(-1,1,n(1));
x2 = linspace(-1,1,n(2));
x3 = linspace(-1,1,n(3));


S1 = spline_eval(x,y,b,c,d,x1);
S2 = spline_eval(x,y,b,c,d,x2);
S3 = spline_eval(x,y,b,c,d,x3);

CHECK1 = spline(x,y,x1);
CHECK2 = spline(x,y,x2);
CHECK3 = spline(x,y,x3);

G = figure(2);
plot(x,y); hold on
plot(x1,S1);plot(x2,S2);plot(x3,S3)
legend('Real','n = 5','n = 11', 'n = 21') 
xlabel('X');ylabel('f(x)')
hold off

E1 = abs(S1 - f(x1));
E2 = abs(S2 - f(x2));
E3 = abs(S3 - f(x3));

figure(3)
hold on
plot(E1,S1,'ob');
plot(E2,S2,'xr');plot(E3,S3,'dg')
legend('n = 5','n = 11', 'n = 21') 
xlabel('S(x)');ylabel('Error(x)')
hold off



