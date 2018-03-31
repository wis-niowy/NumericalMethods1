%% skypt liczacy u.r.l. metoda GE
%% A - macierz z wspolczynnikami
%% B - macierz z wynikami

function [ X ] = GE(A ,B)

n = length(A);

for i = 1:(n-1)
%    L = ( A((i+1):end, i) / A(i, i) )';
%    R = repmat(L, n, 1)'; 
%    P = repmat(A(i,:), n-i, 1);
%    A((i+1):end,:) = A((i+1):end,:) - R .*  P;
%    B(:,(i+1):end) =  B(:,(i+1):end) - L * B(:,i);
    L = ( A((i+1):end, i) / A(i, i) );
    A((i+1):end,:) = A((i+1):end,:) - L * A(i,:);
    B((i+1):end, :) =  B((i+1):end, :) - L .* B(i, :);
end
X = A;
%% X = rozw_url(A, B);