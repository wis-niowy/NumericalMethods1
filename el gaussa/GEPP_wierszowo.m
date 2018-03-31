%% skypt liczacy u.r.l. metoda GEPP
%% A - macierz z wspolczynnikami
%% B - macierz z wynikami

function [ X ] = GEPP_wierszowo(A, B)

n = length(A);
I = 1:n;

for i = 1:(n-1)
   [val, ind] = max(abs(A(i, i:end))); %% szukanie numeru elementu o najwyzszej co do modulu wartosci w i-tym wierszu
   ind = ind + i - 1; %% ustawienie wyzszego indeksu wzgledem calego wiersza
   A(:, [i ind]) = A(:, [ind i]); %% zamiana kolumn
   I(:, [i ind]) = I(:, [ind i]); %% zamiana indeksow niewiadomych
   
   L = ( A((i+1):end, i) / A(i, i) );
%    R = repmat(L, n, 1)'; 
%    P = repmat(A(i,:), n-i, 1);
%    A((i+1):end,:) = A((i+1):end,:) - R .*  P;
%    B(:,(i+1):end) =  B(:,(i+1):end) - L * B(:,i);
    A((i+1):end,:) = A((i+1):end,:) - L * A(i,:);
    B((i+1):end, :) =  B((i+1):end, :) - L .* B(i, :);
end

X = rozw_url(A, B);
X(I) = X;