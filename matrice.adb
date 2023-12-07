with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

package body matrice is 

    Procedure Initialiser(Mat : out T_mat; Valeur : float ) is 
    begin 
      for i in 1..Nb_ligne loop
        for j in 1..Nb_colonne loop
          Mat(i,j) := Valeur;
        end loop;
      end loop;
    end Initialiser;


    procedure Multiplication_Vect_Mat(Vect : float; Mat : in out T_mat) is
    begin  
      for i in 1..Nb_ligne loop
        for j in 1..Nb_colonne loop
          Mat(i,j) := Mat(i,j)*Vect;
        end loop;
      end loop;
    end Multiplication_Vect_Mat;

    procedure Somme_Mat(Resultat : out T_mat; mat_d : in T_mat; mat_g: in T_mat) is 
    begin
      for i in 1..Nb_ligne loop
        for j in 1..Nb_colonne loop
          Resultat(i,j) := mat_d(i,j)+mat_g(i,j);
        end loop;
      end loop;
    end Somme_Mat;
    
    procedure Afficher_Mat(Mat : T_mat) is 
    begin 
        for i in 1..Nb_ligne loop
            for j in 1..Nb_colonne loop
                Put(mat(i,j));
                Put(",");
            end loop;
            Put_Line(""); 
        end loop;
    end Afficher_Mat;
    
    procedure Modifier_Mat(Mat : in out T_mat; i : Integer; j : Integer; valeur : Float) is
    begin 
        Mat(i,j) := valeur;
    end Modifier_Mat;
        
    
    function valeur(mat: T_mat; i : Integer; j : Integer) return float is
    begin 
         return mat(i,j);
    end valeur;
end matrice;
