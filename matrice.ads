-- Définition d'une structure matriciel
-- Matrice.
generic
	Nb_ligne: Integer;
	Nb_colonne:Integer;

package Matrice is

	type T_Mat is private;

-- Initialiser une Matrice composé de la même valeur
  procedure Initialiser(Mat : out T_mat; Valeur : float);


--Multiplication d'une matrice par un scalaire
  procedure Multiplication_Vect_Mat(Vect : float; Mat : in out T_mat); 

--Somme deux matrices 
  procedure Somme_Mat(Resultat : out T_Mat; mat_d : in T_mat; mat_g : in T_mat); 

--Afficher la matrice
    procedure Afficher_Mat(Mat : T_mat);
    
--Modifier une valeur de la matrice
    procedure Modifier_Mat(Mat : in out T_mat; i : Integer;j : Integer; valeur : Float);

--retourne la case i,j
    function Valeur(Mat : in T_mat;i : Integer; j : Integer) return float;
    
private

  type T_mat is array(1..Nb_ligne,1..Nb_colonne) of float;
    
end matrice;
