with traiter_argument; use traiter_argument;
with pagerank; use pagerank;
with poids ; use poids;

procedure page_rank is
  alpha : float;
  k0 : Integer;
  epsilon : float;
  algo : string;
  prefixe : string;

  --traiter les arguments de la ligne de commande
  traiter_argument(alpha, k0,epsilon, algo, prefixe);


  --determiner G
  PR_mat_pleine(alpha,G);

  --calcul des poids 
  poids(k0,epsilon,poids);




  --


end page_rank;
