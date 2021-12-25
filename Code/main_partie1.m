%% Différentes matrices à tester
B=[1,0;2,3];
C=[1 0 0;2 3 0;4 5 6];
A=[1 0 0 0;0 2 0 0;0 0 3 0;0 0 0 4];

%% Comparaison et test pour la matrice A
A
[vecteurs_propres_eig, valeurs_propres_eig] = eig(A)
valeurs_vecteurs_propres(A);

%% Comparaison et test pour la matrice B
B
[vecteurs_propres_eig, valeurs_propres_eig] = eig(B)
valeurs_vecteurs_propres(B);

%% Comparaison et test pour la matrice C
C
[vecteurs_propres_eig, valeurs_propres_eig] = eig(C)
valeurs_vecteurs_propres(C);
