function out = lsgehp( A, b ) 
% funkcja lsgehp rozwi�zuje uk�ad r�wna� liniowych Ax=b metod� eliminacji
% Gaussa z cz�ciowym wyborem element�w g��wnych
% A - macierz wsp�czynnik�w
% b - wektor wyraz�w wolnych
% out - rozwi�zanie uk�adu r�wna� 
    n = length(b); 
    v = ones(n,1); 
    v = cumsum(v); 
    out = ones(n,1); 
    disp(v); 
    x = b; 
    X = A; 
    X(:, n+1) = b; 
    for i=1:n;
        [p, q] = max(abs(X(i,1:n))); 
        t = X(:,q);
        X(:,q) = X(:,i); 
        X(:,i) = t;
        z= v(q); 
        v(q)=v(i);
        v(i)=z; 
        X(i+1:n, i:n+1) = X(i+1:n, i:n+1) - (X(i+1:n, i)/X(i,i))*X(i, i:n+1); 
    end
    x(n) = X(n, n+1)/X(n,n); 
    for i=n-1:-1:1;
        x(i) = (X(i, n+1)-sum( X(i, i+1:n) * x(i+1:n))) / X(i,i); 
    end
    for i=1:n;
        out(v(i)) = x(i);
    end
end