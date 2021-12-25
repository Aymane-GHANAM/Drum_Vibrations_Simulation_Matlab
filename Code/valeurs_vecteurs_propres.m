% Fonction qui retourne les VP d'une matrice CARRÉE
function [lambdas, Xs] = valeurs_vecteurs_propres(A)
    % A : matrice dont on cherche les VP
    % lambdas : tableau de toutes les valeurs propres de la matrice
    % Xs : matrice des vecteurs propres

    n=size(A, 1);

    % Initialisation des variables de stockage à la bonne taille
    lambdas = zeros(1, n);
    Xs = zeros(n, n);

    % On calcule chaque valeur propre de A (de lambda_1 à lambda_n)
    for h=1:n
        % On récupère le vecteur propre X et sa valeur propre associée 
        % de plus grand module
        [lambda, X] = puissance_iteree_colonne(A);

        % On stocke ces deux variables dans nos matrices de stockage
        lambdas(h) = lambda;
        Xs(:,h) = X;

        % On enlève la valeur propre de plus grand module de A pour qu'à la
        % prochaine itération on calcule la suivante
        [A] = deflationWeilandt(A, lambda, X);
    end
    lambdas
    Xs
end

