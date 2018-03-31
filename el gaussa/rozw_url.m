%% rozwiazywanie ukladu rownan, gdzie macierz jest macierza tojkatna gorna
%% A - macierz wspolczynnikow
%% B - macierz wynikow

function [ X ] = rozw_url(A, B)

n = length(A);
X = zeros(n,1);
X(n,:) = B(n,:) / A(n,n); % pierwszy x

for i = (n-1):(-1):1
    X(i,:) = ( B(i,:) - sum( A(i,(i+1):end) * X((i+1):end, :) ) ) / A(i, i);
end