%% initialisation de A
% On considère la surface 20*40 proposée dans le sujet
% On numérote les noeuds du quadrillage de gauche à droite et de haut en
% bas

A=-4*eye(800,800); % on initialise la matrice avec des coefficients -4 sur la diagonale
for i = 1:800
    if (i<800)
        % Prise en compte du voisin de droite
        A(i,i+1)=1;
    end
    if (i>1) 
        %Prise en compte du voisin de gauche
        A(i,i-1)=1;
    end
    if((i>40)&&(i<=760))
        %Prise en compte du voisin d'en haut
        A(i,i-40)=1;
        %Prise en compte du voisin d'en bas
        A(i,i+40)=1;
    end
    if ((mod((i-1),40)==0)||(mod(i,40)==0)||(i>760)||(i<40)||((i>=380)&&(i<=385))||((i>=420)&&(i<=425))||((i>=460)&&(i<=465)))
        A(i,:)=0;
        A(i,i)=1;
    end % on a traité ici les bords fixés du tambour
    if ((i>=20)&&(i<40))
        A(i,i)=-3;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+40)=1;
    end % on a traité ici les bords non fixés hauts du tambour
    if ((i>=780)&&(i<800))
        A(i,i)=-3;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i-40)=1;
    end % on a traité ici les bords non fixés bas du tambour
end


A
%% Calculs
%on initialise les valeurs nécessaires
taille=size(A,1); %nombre de noeuds du quadrillage
lambdasmin=zeros(1,25); %tableau des valeurs propres max
lambdasmax=zeros(1,70); %tableau des valeurs propres min
Xmax=zeros(taille,25); %tableau des vecteurs propres des valeurs propres max
Xmin=zeros(taille,70); %tableau des vecteurs propres des valeurs propres min
Amax=A;
for h=1:25 %on calcule les 25 plus grandes valeurs propres
    h
    [lambda,X]=puissance_iteree_colonne(Amax); %on trouve la valeur propre la plus élevée en valeur absolue
    lambda;
    lambdasmax(h)=lambda;
    Xmax(:,h)=X;
    [Amax]=deflationWeilandt(Amax,lambda,X); %on passe à la valeur propre suivante
    
end

Ainv=inv(A); %matrice A inversée pour trouver les valeurs propres minimales

for h=1:70 %on calcule les 70 plus petites valeurs propres
    h+25
    [lambda,X]=puissance_iteree_colonne(Ainv);
    lambda;
    lambdasmin(h)=1/lambda;
    Xmin(:,h)=X;
    [Ainv]=deflationWeilandt(Ainv,lambda,X);
    
end

% Valeur propre la plus proche de 0.53
valeur_propre_proche = lambdasmin(1);
for h=1:70
    if ( abs((0.53 - abs(lambdasmin(h)))) < abs((0.53 - abs(valeur_propre_proche))) )
        valeur_propre_proche = lambdasmin(h);
        Xv = Xmin(:,h);
    end
end
    
Xaff=zeros(40,20);
 %% tracés
for k=1:25 %tracés pour les valeurs propres max
    figure(1);
    for i=1:40
        for j=1:20
            Xaff(i,j)=Xmax(i+(j-1)*40,k);
        end
    end
    surf(Xaff)
    pause(0.5)
end

for k=1:70 %tracés pour les valeurs propres min
    figure(2);
    for i=1:40
        for j=1:20
            Xaff(i,j)=Xmin(i+(j-1)*40,k);
        end
    end
    surf(Xaff)
    pause(0.5)
end

for i=1:40 %tracé pour la valeur propre proche de 0.53
    figure(3);
    for j=1:20
        Xaff(i,j)=Xv(i+(j-1)*40);
    end
end
surf(Xaff)



