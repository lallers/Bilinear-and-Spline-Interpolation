% test bilinear_coef function
clear all; clc
x = [0,1];
y = [0,1];
z = [0,1;2,4];
pass = 0;
if exist('bilinear_coef','file')
    [a,b,c] = bilinear_coef(x,y,z);
    if abs(a-1) < eps, pass = pass+1; end
    if abs(b-2) < eps, pass = pass+1; end
    if abs(c-1) < eps, pass = pass+1; end
end
if pass == 3
    fprintf('bilinear_coef function: passed\n');
else
    fprintf('bilinear_coef function: failed\n');
end

% % test bilinear_eval function
a = 1;
b = 2;
c = 1;
xi = [0,0.5];
yi = [0,0.5];
pass = 0;
if exist('bilinear_eval','file')
    zi = bilinear_eval(x,y,z,a,b,c,xi,yi);
    if abs(zi(1)) < eps, pass = pass+1; end
    if abs(zi(2)-1.75) < eps, pass = pass+1; end
end
if pass == 2
    fprintf('bilinear_eval function: passed\n');
else
    fprintf('bilinear_eval function: failed\n');
end

% test spline_coef function
x = [0,1,2];
y = [0,2,1];
pass = 0;
if exist('spline_coef','file')
    [b,c,d] = spline_coef(x,y);
    if abs(b(1)-2.75) < eps, pass = pass+1;
    end
    if abs(b(2)-0.5) < eps, pass = pass+1;
    end
    if abs(c(1)) < eps, pass = pass+1;
    end
    if abs(c(2)+2.25) < eps, pass = pass+1;
    end
    if abs(d(1)+0.75) < eps, pass = pass+1;
    end
    if abs(d(2)-0.75) < eps, pass = pass+1;
    end
end
if pass == 6
    fprintf('spline_coef function: passed\n');
else
    fprintf('spline_coef function: failed\n');
end

% test spline_eval function
b = [2.75,0.5];
c = [0,-2.25];
d = [-0.75,0.75];
xi = [0.5,1.5];
pass = 0;
if exist('spline_eval','file')
    yi = spline_eval(x,y,b,c,d,xi);
    if abs(yi(1)-1.28125) < eps, pass = pass+1; end
    if abs(yi(2)-1.78125) < eps, pass = pass+1; end
end
if pass == 2
    fprintf('spline_eval function: passed\n');
else
    fprintf('spline_eval function: failed\n');
end