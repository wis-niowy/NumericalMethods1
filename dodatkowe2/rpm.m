%% skrypt wyznaczajacy x z: (I + A^2 + 2A)x = b metoda PA = LU
function [ x ] = rpm(A, B)

n = length(A);
%%A = eye(n) + A^2 + 2*A;
P = eye(size(A));
L = eye(size(A));

%% eliminacja Gaussa GEPP
for i = 1:(n-1)
    T = eye(size(A)); %% macierz parmutacji przy wyzanczaniu elementu glownego w kazdej kolumnie
    Lk = T; %% macierz Lk dla k-tej kolumny
   [~, ind] = max(abs(A(i:end,i))); %% szukanie numeru wiersza o najwyzszej co do mosulu wartosci w i-tej kolumnie
   ind = ind + i - 1;
   A([i ind], :) = A([ind i], :); %% zamiana wierszy
   T([i ind], :) = T([ind i], :);
   
    l = ( A((i+1):end, i) / A(i, i) );
    A((i+1):end,:) = A((i+1):end,:) - l * A(i,:);
    Lk(i+1:end, i) = -l;
    L = L * T^(-1) * Lk^(-1); %% wynik koncowy to bedzie L z falka
    P = P * T^(-1); %% na koniec otrzymane P to w rzeczywistosci bedzie P^(-1)
end
P = P^(-1);
L = P * L;


%% rozwiazanie ukladu rownan z macierza trojkatna DOLNA Ly = Pb
B = P * B;
y = zeros(n,1);
y(1,:) = B(1,:) / L(1,1); % pierwszy x

for i = 2:n
    y(i,:) = ( B(i,:) - ( L(i,1:(i-1)) * y(1:(i-1), :) ) ) / L(i, i);
end

%% rozwiazanie ukladu rownan z macierza trojkatna GORNA Ux = y
U = A;
x(n,:) = y(n,:) / U(n,n); % pierwszy x

for i = (n-1):(-1):1
    x(i,:) = ( y(i,:) - ( U(i,(i+1):end) * x((i+1):end, :) ) ) / U(i, i);
end



