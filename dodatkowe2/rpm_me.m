function x = rpm_me(A,b)
% Modu³ archiwalny
y = linsolve( eye(length(A)) + A, b );
x = linsolve( eye(length(A)) + A, y );
end



