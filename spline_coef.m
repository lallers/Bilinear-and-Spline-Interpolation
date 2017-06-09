function [b ,c , d] = spline_coef( x , y )
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
n = length(x);
h = zeros(n-1,1);
for j = 1:n-1
 h(j) = x(j+1) - x(j); %Subintervals
end

A = zeros(n);
A(1,1)= 1; %Natural Spline Boundary Conditions
A(n,n) = 1; %Natural Spline Boundary Conditions
for i = 2:n-1
 A(i,i-1) = h(i-1);
 A(i,i) = 2*(h(i-1)+h(i));
 A(i,i+1) = h(i);
end
 
b = zeros(n,1);
for i = 2:n-1
 b(i) = (3/h(i))*(y(i+1)-y(i)) - (3/h(i-1))*(y(i)-y(i-1));
end

c = A\b;
b = zeros(n-1,1);
for i = 1:n-1
 b(i) = (1/h(i))*(y(i+1)-y(i)) - (1/3*h(i))*(2*c(i)+c(i+1));
end
d = zeros(n-1,1);
for i = 1:n-1
 d(i) = (1/(3*h(i))) * (c(i+1)-c(i));
end
end