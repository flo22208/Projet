package body matrice is 

    Procedure Initialiser(Mat : out, Valeur : float ) is 
    begin 
      for i in 1..Nb_ligne loop
        for j in 1..Nb_colonne loop
          Mat(i,j) = Valeur;
        end loop;
      end loop;
    end Initialiser;


    procedure Multiplication_Vect_Mat(Vect : float, Mat : in/out T_mat) is
    begin  
      for i in 1..Nb_ligne loop
        for j in 1..Nb_colonne loop
          Mat(i,j) = Mat(i,j)*Vect;
        end loop;
      end loop;
    end Multiplication_Vect_Mat;

    procedure Somme_Mat(Resultat : out T_mat, mat_d : in T_mat, mat_g: in T_mat) is 
    begin
      for i in 1..Nb_ligne loop
        for j in 1..Nb_colonne loop
          Mat(i,j) = mat_d(i,j)+mat_g(i,j);
        end loop;
      end loop;
    end Somme_Mat;

end matrice;
