% skrypt rysuje funkcje i jej funkcje interpolowana

function [ out ] = wykwi(f, a, b, n, rw)
ARG = a:0.01:b; %% przedzial argumentow

if (rw == 0)
    WEZLY_X = a:((b-a)/n):b; %% wezly interpolacyjne %% rownoodlegle
    WEZLY_Y = f(WEZLY_X); %% wartosci funkcji w wezlach
    WSP = tabir(WEZLY_X, WEZLY_Y); %% wspolczynniki wielomianu Newtona
    flf = uhorn(WSP, WEZLY_X, ARG); %% wartosci wielomianu interpolacyjnego
    
    plot(ARG, f(ARG), 'r', ARG, flf, 'b', WEZLY_X, WEZLY_Y, 'g+');
    c = 2 * min(f(ARG)) - max(f(ARG));
    d = 2 * max(f(ARG)) - min(f(ARG));
    axis([ a b c d ]);
end

if (rw == 1)
   WEZLY_CZ_X(1, n + 1) = zeros;
   for i = 1:(n + 1)
       WEZLY_CZ_X(:, i) = cos(( ( 2 * i - 1 ) * pi ) / (2 * n)); %% zera Czebyszewa
   end
   WSP = tabir(WEZLY_CZ_X, f(WEZLY_CZ_X)); %% wspolczynniki wielomianu Newtona
   flf = uhorn(WSP, WEZLY_CZ_X, ARG); %% wartosci wielomianu interpolacyjnego
   
    plot(ARG, f(ARG), 'r', ARG, flf, 'b', WEZLY_CZ_X, f(WEZLY_CZ_X), 'g+');
    c = 2 * min(f(ARG)) - max(f(ARG));
    d = 2 * max(f(ARG)) - min(f(ARG));
    axis([ a b c d ]);
end