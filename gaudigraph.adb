with p_combinaisons; use p_combinaisons;
with p_vue_graph; use p_vue_graph;
with p_fenbase; use p_fenbase;
with forms; use forms;


procedure gaudigraph is
  Facc,Fcrypt : TR_Fenetre;
  s : string(1..20);
  num : integer;
begin -- gaudigraph
  -----------------Initialisation des fenêtres----------------------------------
  InitialiserFenetres;
  -- Fenêtre d'accueil
  FenetreAccueil(Facc);
  --Fenêtre cryptogramme
  montrerfenetre(facc);
  s := attendreBouton(facc);
  ------------------------------------------------------------------------------
  Fcrypt := DebutFenetre("Cryptogramme de Subirachs",800,700);
    AjouterTexte(Fcrypt, "Titre","Cryptogramme de Subirachs", 200,20, 400, 30);
    AjouterTexte(Fcrypt, "FondCrypto", "", 175, 70, 450, 450);
    ChangerCouleurFond(Fcrypt, "FondCrypto", FL_BLACK);
    AfficheGrille(Fcrypt);
    AjouterBouton(Fcrypt, "pred", "Precedant", 50,550, 200,100);
    AjouterBouton(Fcrypt, "succ", "Suivant", 550,550, 200,100);
    AjouterTexte(Fcrypt, "numsol", "1", 350,500, 150, 150);

  FinFenetre(Fcrypt);
  montrerfenetre(Fcrypt);
  AfficheSolution(Fcrypt, "A1A2B3C4");
  Solution(Fcrypt, num, 33, attendreBouton(Fcrypt));
end gaudigraph;
