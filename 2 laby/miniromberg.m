function [ out ] = miniromberg(f, a, b, n)

m = 4*n;
WEZLY = a:((b-a)/m):b; %% 4n + 1 wezlow
WEZLY_Y = f(WEZLY); %% wartosci w wezlach

T4n = ((b-a)/m)/2 * (f(a) + f(b) + 2 * sum ( WEZLY_Y(2:(end-1)) ) ); %%  wzor na zlozona kwadrature trapezow dla 4n
T2n = ((b-a)/(2*n))/2 * (f(a) + f(b) + 2 * sum ( WEZLY_Y(2:2:(end-1)) ) ); %% ... dla 2n
Tn = ((b-a)/n)/2 * (f(a) + f(b) + 2 * sum ( WEZLY_Y(2:4:(end-1)) ) ); %% ... dla n

out = (1/45) * (64 * T4n - 20 * T2n + Tn);