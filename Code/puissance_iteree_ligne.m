function [u] = puissance_iteree_ligne(A)
% A : la matrice dont on cherche les valeurs propres
% u : son vecteur propre (LIGNE) associé à la valeur propre de plus grand module


X = zeros(1, size(A, 1));

% Y est ici X à l'étape n+1 dans la boucle, c'est à dire X*A
Y = ones(1,size(A,1));
i = 1; %compteur empêchant de tourner en boucle trop longtemps


% Tant que X n'est pas colinéaire à X*A, c'est à dire tant que X(n)!=X(n+1)
% parce qu'ici X est normé à chaque étape
while(((norm(Y-X) > 0.00001 &&  norm(Y+X) > 0.00001))&&(i<100000))
    X = Y;
    Y = X * A;
    Y = Y / norm(Y);
    i = i + 1;
end

u = X;

end