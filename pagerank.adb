with Ada.IO_Exceptions;
with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Float_Text_IO;		use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;
with Ada.Command_line;		use Ada.Command_line;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with matrice;

procedure PageRank is
    
    package T_Mat is new T_Matrice(Nb=>Nb_Noeud;Nb_Ligne=>Nb_Noeud);
    
    No_Argument_Error: Exception;
    
    File : Ada.Text_IO.File_Type; -- descripteur de fichier texte (Ada.Text_IO)
    Entier1: Integer;
    Entier2: Float;
    Nom_Fichier1: Unbounded_String;
    Nom_Fichier2: Unbounded_String;
    
    Graphe:T_Matrice;
    Nb_Noeud: Integer;
    Longueur_Graphe:Integer;
    
    Prefixe: Unbounded_String;
    
    
    
    procedure PR_Mat_Pleine(alpha: in Integer; epsilon: in Integer; G : out T_mat) is
        
        S:T_Matrice;
        H:T_Matrice;
        P:T_Matrice;
        Nb_Ref:T_Matrice;
        e:T_Matrice;
        
    begin
        --Déterminer la matrice G
    
        --Déterminer H
        Initialise(H,0); -- package mat a importer taille( nb_noeud, nb_noeud )
        Initialise(P,0); -- package mat a importer taille( nb_noeud, 1 )
        Initialise(Nb_Ref,0); -- package matrice a importer de taille ( ? )
        
        for i in 2..Longueur_Graphe loop
            Nb_Ref(Graphe(i,1),1):=Nb_Ref(Graphe(i,1),1)+1;
            H(Graphe(i,1),Graphe(i,2)):=1;
        end loop;
        
        -- Pondérer la matrice H
        for i in 1..Nb_Ligne loop 
            for j in 1..Nb_Colonne loop 
                H(i,j):=1/Nb_Ref(i,1);
            end loop;
        end loop;
        
        
        -- Déterminer S
        S:=H;
        for i in 1..Nb_Noeud loop 
            for j in 1..Nb_Noeud loop   
                if S(i,j)=0 then
                    S(i,j):=1/Nb_Noeud;
                end if;
            end loop;
        end loop; 
        
        --Déterminer G 
        Initialise(e_fois_e_t,1); -- taille (nb_noeud, nb_noeud);
        
      --  Produit_Matriciel(e,e_t); -- pas besoin, on a juste a initialiser une matrice de taille ( nb_noeud, nb_noeud ) de 1 
                                  -- pas besoin de produit matriciel dans la création de G   
        
        G  :=  somme_mat(multiplication_vect_mat(alpha,S),multiplication_vect_mat((1-alpha)/N,e_fois_e_t));

    
    
    end PR_Mat_Pleine; -- le calcul des poids je le fais dans un autre document mais tu peux continuer la création des fichier
    
begin
    
    open (File, In_File,Argument(i)); --modifier pour mettre le bonne argument du nom 
     
    Initialise(Graphe,0);--Initialise le graphe stockant les valeurs du fichier
    
    begin 
        --Rajouter la lecture du fichier voir exemple moodle 
        
        -- Obtenir le nombre de noeud du graphe
        Get(File,Entier1);
        Nb_Noeud:=Entier1;
        
        --lire les valeurs du fichier
        while not End_Of_file (File) loop
            Get (File, Entier1);
            Get (File,Entier2);
            Graphe(i,1):=Entier1;
            Graphe(i,2):=Entier2;
            Longueur_Graphe:=Longueur_Graphe+1; 
        end loop;
    exception
        when End_Error=> null;          
    end;
    
    -- Créer les fichiers .pr et .prw 
    
    --Création du fichier .pr
    Nom_Fichier1 := Prefixe; 
    Append (Nom_Fichier1, ".pr");
    Create (File, Out_File, To_String (Nom_Fichier1));
    New_Line (File);
    close (File);
    
    --Rajouter les valeurs dans le fichier .prw
    
    
    -- Création du fichier .prw
    
    Nom_Fichier2 := Prefixe;
	Append (Nom_Fichier2, ".prw");
	Create (File, Out_File, To_String (Nom_Fichier2));
	New_Line (File);
    close (File);
    
    -- Rajouter les valeurs dans le fichier .prw
    
exception 
    when No_Argument_Error =>
		Put_Line ("Pas de fichier.");
		New_Line;
		Put_Line ("Usage : " & Command_Name & " <fichier>");

	when Ada.IO_Exceptions.Name_Error =>
		Put_Line ("Fichier inexisant : " & Argument (1)); -- Argument à voir 

	when Data_Error =>
		Put_Line ("Mauvais format du fichier : devrait être entier, reel, entier*");
end PageRank;
