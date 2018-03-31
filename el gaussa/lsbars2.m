function [] = lsbars2( lsfun1, lsfun2, n, k, seed, reserr )
rng(seed);
% funkcja lsbars2 testuje (porównuje) dwie metody rozwi¹zywania uk³adów
% równañ liniowych
% lsfun1, lsfun2 - funkcje rozwi¹zuj¹ce uk³ad równañ liniowych
% n - rozmiar macierzy uk³adu
% k - liczba testów
% seed - ziarno generatora liczb losowych
% reserr - okreœla sposób liczenia b³edu
    wynik1 = zeros(1, 15);
    wynik2 = zeros(1, 15);
    rng(seed);
    for i=1:k;
        A = 1./rand(n).^2;
        y = ones(n, 1);
        b = A*y;
        fun1wynik = lsfun1(A, b);
        fun2wynik = lsfun2(A, b);
        if(reserr == 0)
            e1 = norm(fun1wynik-y, 2);
            e2 = norm(fun2wynik-y, 2);
        else
            e1 = norm(A*fun1wynik-b, 2);
            e2 = norm(A*fun2wynik-b, 2);  
        end
        r1 = -round(log10(e1));
        r2 = -round(log10(e2));
        
        wynik1(min(max(1, r1), 15)) = wynik1(min(max(1, r1), 15)) +1;
        wynik2(min(max(1, r2), 15)) = wynik2(min(max(1, r2), 15)) +1;      
    end 
    h=bar(-15:-1, flipud([wynik1;wynik2]'), 'grouped');
    legend(h,func2str(lsfun1),func2str(lsfun2));
    tit=[num2str(k), ' macierzy ', num2str(n) , 'x', num2str(n),', ziarno = ',num2str(seed),', reserr = ',num2str(reserr)];
    title(tit);
    colormap([1,0,0;0,1,0]);
end