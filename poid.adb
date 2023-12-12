--importer le module T_mat

procedure poids(nb_noeud : in integer;k0 : integer; epsilon : float; poids : out T_mat) is
   
  --initailiser les packages T_mat pour le vecteur poids_k et pour G


  poids_k_m : T_mat; -- poids a k-1
  poids_k : T_mat; -- pods a k
  norme  : float; -- norme 

begin 
  initialiser(poids_k_m,1/nb_noeuds);
  initialiser(poids_k,1/nb_noeuds);
  
  --derterminer les poids vérifiant les options
  while (k<k0) and norme > epsilon loop
    poids_k_m := poids_k;
    poids_k := multiplication_mat_1_nb_noeuds_nb_noeuds(poids_k,G); -- coder la multiplication
    norme := norme(--soustraction de matrice puis norme a coder
    k := k +1 ;
  end loop;

end poids;




