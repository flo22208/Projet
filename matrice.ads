-- Définition d'une structure matriciel
-- Matrice.
generic
	type Nb_ligne is private;
	type Nb_colonne is private;

package Matrice is

	type T_Matrice is limited private;

	-- Initialiser une Matrice composé de la même valeur
	procedure Initialise(Mat : out T_matrice, Valeur : float) with
    Post => Mat(i,j) = Valeur;


	--Multiplication d'une matrice par un scalaire
  procedure Multiplication_Vect_Mat(Vect : float, Mat : in/out T_mat) with 
    Post => Mat(i,j) = Mat(i,j)'Old * Vect;

  --Somme deux matrices 
  procedure Somme_Mat(Resultat : out T_Mat, mat_d : in T_mat, mat_g : out T_mat) with 
    Post => Resultat(i,j) = mat_g(i,j) + mat_d(i,j);

private

  type T_Matrice array(1..nb_ligne,1..nb_colonne) of float;
    
end matrice;
