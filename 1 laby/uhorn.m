% skrypt oblicza wartosc wielomianu algorytmem Hormera
% dla zadanych wektorow ze wspolczynnikami wielmoianu w postaci Newtona
% oraz wezlami i argumentami

function [ out ] = uhorn(wek_b, wek_x, wek_t)
ile_wsp = length(wek_b);

%%%%% algorytm Hornera
w = wek_b(:,ile_wsp);
for i = 1:(ile_wsp - 1)
   w = w .* (wek_t - wek_x(:, ile_wsp - i)) + wek_b(:, ile_wsp - i);
end
out = w;