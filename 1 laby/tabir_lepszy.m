function out = tabir( x, y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = length(x) - 1 ;
out = y;

for i = 1:n
    out(i+1:n+1) = ( out(i+1:n+1)- out(i:n) ) ./ ( x(i+1:n+1)-x(1:n+1-i));
end

end