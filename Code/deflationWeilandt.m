% Méthode qui 'enlève' la valeur propre de plus grand module lambda de A 
% et retourne A2
function [A2] = deflationWeilandt(A, lambda, X)
    % A : matrice d'entrée à n VP
    % lambda : la valeur propre de A connue qu'on souhaite 'retirer'
    % X : le vecteur propre colonne associé à lambda
    % A2 : la matrice de sortie à (n-1) VP

    % On cherche le vecteur propre ligne de plus grand module de A
    u = puissance_iteree_ligne(A);

    v = X;
    % On applique la formule de Weilandt pour calculer la nouvelle matrice
    A2=A-lambda*((v*u)/(u*v));
end