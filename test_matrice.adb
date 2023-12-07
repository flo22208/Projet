with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
With Matrice;


with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

        

procedure test_matrice is
    
    package Matrice_2_2 is 
    new matrice(Nb_colonne=>2,Nb_ligne=>2);
    use Matrice_2_2;
    MAt1 : Matrice_2_2.T_Mat;
    MAt2 : Matrice_2_2.T_Mat;
    Result_Mat : Matrice_2_2.T_Mat;
    
    package Matrice_2_1 is 
    new matrice(Nb_colonne=>1,Nb_ligne=>2);
        use Matrice_2_2;
    
    procedure multiplication_mat_2_2_1(Result : in out Matrice_2_1.T_Mat; mat_g : in Matrice_2_2.T_Mat; mat_d : Matrice_2_1.T_Mat) is 
        Element : float; 
    begin 
        for i in 1..2 loop
            for j in 1..1 loop
                Element :=0.0;
                for k in 1..2 loop
                    Element := Element + valeur(mat_g,i,k)*Matrice_2_1.Valeur(mat_d,k,j);
                end loop;
                Matrice_2_1.Modifier_Mat(result,i,j,Element);
            end loop;
        end loop;
    end multiplication_mat_2_2_1;
    
    mat3 : Matrice_2_1.T_Mat;
    result_mat3 : Matrice_2_1.T_mat;
begin
    --initialise
    Put_Line("intialiser");
    Initialiser(Mat1,0.0);
    Put_Line(""); 
    Initialiser(Mat2,1.0);
    Put_Line(""); 
    Initialiser(Result_Mat,0.0);
    Put_Line(""); 
    Matrice_2_1.Initialiser(mat3,1.0);
    Matrice_2_1.Initialiser(result_mat3,0.0);    
    --Afficher matrice et changer 
    Put_Line("modifier");
    Afficher_Mat(Mat1);
    Put_Line(""); 
    Modifier_Mat(Mat1,1,2,3.0);
    Put_Line(""); 
    Afficher_Mat(Mat1);
    Put_Line(""); 
    
    --multiplicaiton par un scalaire
    Put_Line("multiplication scalaire");
    Afficher_Mat(Mat2);
    Put_Line(""); 
    Multiplication_Vect_Mat(5.0,MAt2);
    Put_Line(""); 
    Afficher_Mat(Mat2);
    Put_Line(""); 
    
    --Somme de deux matrice 
    Put_Line("somme");
    Afficher_Mat(Result_Mat);
    Put_Line(""); 
    Afficher_Mat(Mat1);
    Put_Line(""); 
    Afficher_Mat(MAt2);
    Put_Line(""); 
    Somme_Mat(Result_mat, mat1,mat2);
    Put_Line(""); 
    Afficher_Mat(Result_Mat);
    Put_Line(""); 
    
    
    --multiplication de deux matrices
    Put_Line("multiplication");
    Put_Line(""); 
    Afficher_Mat(Mat2);
    Put_Line(""); 
    Matrice_2_1.Afficher_Mat(MAt3);
    Put_Line(""); 
    multiplication_mat_2_2_1(Result_mat3,MAt2,mat3);
    Matrice_2_1.Afficher_Mat(Result_mat3);
    
    
        
   
end test_matrice;
