%% skrypt obliczajacy pierwiastki willmianow 2-ego stopnia

function [out] = pierwiastki(a, b, c)
q = - 1/2 * (b + sqrt(b .^ 2 - 4 .* a .* c));
x(1, 1) = q ./ a;
x(1, 2) = c ./ q;
out = x;