function [X] = rpm_moje(A, B)
n = length(A);

for i = 1:(n-1)
   [val, ind] = max(abs(A(i:end,i))); %% szukanie numeru wiersza o najwyzszej co do mosulu wartosci w i-tej kolumnie
   ind = ind + i - 1;
   A([i ind], :) = A([ind i], :); %% zamiana wierszy
   B([i ind], :) = B([ind i], :);

    L = ( A((i+1):end, i) / A(i, i) );
    A((i+1):end,:) = A((i+1):end,:) - L * A(i,:);
    B((i+1):end, :) =  B((i+1):end, :) - L .* B(i, :);
end

n = length(A);
X = zeros(n,1);
X(n,:) = B(n,:) / A(n,n); % pierwszy x

for i = (n-1):(-1):1
    X(i,:) = ( B(i,:) - sum( A(i,(i+1):end) * X((i+1):end, :) ) ) / A(i, i);
end