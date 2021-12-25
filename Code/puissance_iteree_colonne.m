function [lambda, v] = puissance_iteree_colonne(A)
% Entrée
% A : la matrice dont on cherche les valeurs propres
% Sorties
% v : vecteur propre (colonne) associé à la valeur propre de plus grand
% module
% lambda : sa valeur propre de plus grand module

% Xn+1 = A*Xn
% Ici on prendra Xn+1 = Y et Xn = X
% On initialise les matrices
X = zeros(size(A, 1), 1);
Y = ones(size(A,1),1);

i = 1; %compteur empêchant de tourner en boucle trop longtemps

% Tant que X n'est pas colinéaire à A*X, c'est à dire tant que X(n)!=X(n+1)
% parce qu'ici X est normé à chaque étape
while(((norm(Y-X) > 0.00001 &&  norm(Y+X) > 0.00001))&&(i<100000))
    X = Y;
    Y = A*X;
    Y = Y/norm(Y);
    i = i+1;
end

% En sortie de boucle, le vecteur X est proportionnel à A*X
% La valeur propre associée est le coef de proportionnalité entre les 2

% Calcul du coeff de proportionnalité (et donc de la valeur propre) : 
X = Y;
Y = A*X;
% k : indice de la plus coordonnée de X de plus grande valeur absolue 
%(donc non 0 sauf si X ne contient que des 0)
[~,k] = max(abs(X)); 
lambda = Y(k) / X(k);
v = Y;

end