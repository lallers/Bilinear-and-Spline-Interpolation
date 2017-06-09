function yi = spline_eval( x,y,b,c,d,xi )
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
n = length(xi);
for i = 1:n
[XR,XC] = find(x >= xi(i),1,'first');
X = x(XR,XC);
yi(i) = y(XR,XC) + b(i)*(X - xi(i)) + c(i)*(X - xi(i))^2 + d(i)*(X - xi(i))^3;
end
end