with traiter_argument; use traiter_argument;
with pagerank; use pagerank;

procedure page_rank is
  alpha : float;
  k0 : Integer;
  epsilon : float;
  algo : string;
  prefixe : string;

  --traiter les arguments de la ligne de commande
  traiter_argument(alpha, k0,epsilon, algo, prefixe);


  --determiner G
  PR_mat_pleine(G)


  --
