function [a, b, c] = bilinear_coef( x , y , z )
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
[m,n] = size(z);
a = zeros(m-1,n-1); b = zeros(m-1,n-1); c = zeros(m-1,n-1);
for i = 1:m-1
    for j = 1:n-1
        a(i,j) = (z(i,j+1) - z(i,j))/(x(j+1) - x(j)) ;
        b(i,j) = (z(i+1,j) - z(i,j))/(y(j+1) - y(j));
        c(i,j) = (z(i,j) + z(i+1,j+1) - z(i,j+1) - ...
                  z(i+1,j))/((x(j+1)-x(j))*((y(i+1) -... 
                   y(i))));
    end
end
end

