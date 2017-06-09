function zi = bilinear_eval(x, y, z, a, b, c, xi, yi )
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
for i = 1:length(xi)
[XR, XC] =  find(x >= xi(i),1,'first');
[YR, YC] =  find(y >= yi(i),1,'first');
X = x(XR,XC);
Y = y(YR,YC);
zi(i) = z(XR,YR) +  a(XR,YR)*(X - xi(i)) + b(XR,YR)*(Y - yi(i)) + c(XR,YR)*((X - xi(i)) * (Y - yi(i)));
end    
end


