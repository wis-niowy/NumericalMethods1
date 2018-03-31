% funkcja wyznaczajaca wspolczynniki wielomiau newtona
% dla danych wezlow i wartosci w tych wezlach
% metoda ilorazow roznicowych

function [ out ] = tabir(wektor_x, wektor_y)
ilosc_wezlow = length(wektor_x);
WSP = wektor_y; % wektor ze wspolrzednymi
TEMP = wektor_y; % pomocniczy wektor
for j = 1:(ilosc_wezlow - 1)
    k = 1; % iterator po wektorze x
    for i = j:(ilosc_wezlow - 1)
        TEMP(:, i + 1) = (WSP(:, i) - WSP(:, i + 1)) / (wektor_x(:, k) - wektor_x(:, k + j)); % iloraz roznicowy
        k = k + 1;
    end
    WSP = TEMP;
end
out = WSP;