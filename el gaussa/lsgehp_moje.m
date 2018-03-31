function [ X ] = lsgehp_moje(A, B)

n = length(A);
I = 1:n;

for i = 1:(n-1)
   [val, ind] = max(abs(A(i, i:end))); %% szukanie numeru wiersza o najwyzszej co do mosulu wartosci w i-tym wierszu
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

X = zeros(n,1);
X(n,:) = B(n,:) / A(n,n); % pierwszy x

for i = (n-1):(-1):1
    X(i,:) = ( B(i,:) - sum( A(i,(i+1):end) * X((i+1):end, :) ) ) / A(i, i);
end

X(I) = X;