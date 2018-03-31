function [ out ] = prostokaty(f, a, b, n)

WEZLY = a:((b-a)/n):b;
ile_wezlow = length(WEZLY);

out = (b-a)/n * sum( f( (WEZLY(1:(ile_wezlow - 1)) + WEZLY(2:ile_wezlow)) / 2 ) );