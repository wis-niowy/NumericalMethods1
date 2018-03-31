%% skypt liczacy u.r.l. metoda GECP
%% A - macierz z wspolczynnikami
%% B - macierz z wynikami

function [ X ] = GECP(A, B)

n = length(A);
I = 1:n;

for i = 1:(n-1)
   [val, ind] = max(abs(A(i:end,i))); %% ind to macierz z indeksami maksymalnych elementow z kazdej kolumny A
                                      %% val to macierz z tymi maksymalnymi elementami
                                      %% jezeli znajdziemy maksymalny elemnet z val to pod tym samym indeksem w ind
                                      %% znajdziemy indeks tego elementu w swojej kolumnie (czyli numer wiersza)
                                      %% w ten sposob znajdziemy miejsce maksymalnego elementu w macierzy
                                      %% numer wiersza to wartosc pod indeksem, a numer kolumny to wlasnie ten indeks
   [val2, nr_kolumny_el] = max(val);
   nr_wiersza_el = ind(nr_kolumny_el);
   nr_wiersza_el = nr_wiersza_el + i - 1;
   nr_kolumny_el = nr_kolumny_el + i - 1;
   A([i nr_wiersza_el], :) = A([nr_wiersza_el i], :); %% zamiana wierszy
   B([i nr_wiersza_el], :) = B([nr_wiersza_el i], :);
   A(:, [i nr_kolumny_el]) = A(:, [nr_kolumny_el i]); %% zamiana kolumn
   I(:, [i nr_kolumny_el]) = I(:, [nr_kolumny_el i]); %% zamiana indeksow niewiadomych
   
   
   

%    R = repmat(L, n, 1)'; 
%    P = repmat(A(i,:), n-i, 1);
%    A((i+1):end,:) = A((i+1):end,:) - R .*  P;
%    B(:,(i+1):end) =  B(:,(i+1):end) - L * B(:,i);
    L = ( A((i+1):end, i) / A(i, i) );
    A((i+1):end,:) = A((i+1):end,:) - L * A(i,:);
    B((i+1):end, :) =  B((i+1):end, :) - L .* B(i, :);
end

X = rozw_url(A, B);
X(I) = X;