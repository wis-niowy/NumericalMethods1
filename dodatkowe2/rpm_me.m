function x = rpm_me(A,b)
% Modu� archiwalny
y = linsolve( eye(length(A)) + A, b );
x = linsolve( eye(length(A)) + A, y );
end



