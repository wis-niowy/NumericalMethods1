function [ out ] = trapezy(f, a, b, n)

WEZLY = a:((b-a)/n):b;
ile_wezlow = length(WEZLY);

out = ((b-a)/n)/2 * (f(a) + f(b) + 2 * sum ( f ( WEZLY(2:(ile_wezlow - 1)) ) ) );