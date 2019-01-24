with p_combinaisons; use p_combinaisons;
with p_vue_graph; use p_vue_graph;
with p_fenbase; use p_fenbase;
with forms; use forms;


procedure gaudigraph is
  Facc,Fcrypt : TR_Fenetre;
  s : string(1..20);
begin -- gaudigraph
  -----------------Initialisation des fenêtres----------------------------------
  InitialiserFenetres;
  -- Fenêtre d'accueil
  Facc := DebutFenetre("Accueil", 1200,700);
    AjouterTexte(Facc, "TexteAccueil", "Bonjour et bienvenue dans notre programme !", 500, 200, 400, 50);
    AjouterTexte(Facc, "TexteInstuction", "Appuyer sur le bouton Commencer !", 300, 550, 400, 50);

    AjouterBouton(Facc,"BoutonCommencer","Commencer",500, 300, 200, 200);
  FinFenetre(Facc);
  -- Fenêtre cryptogramme
  -- montrerfenetre(facc);
  -- s := attendreBouton(facc);
  ------------------------------------------------------------------------------
  Fcrypt := DebutFenetre("Cryptogramme de Subirachs",800,700);
  AjouterTexte(Fcrypt, "Titre","Cryptogramme de Subirachs", 200,20, 400, 30);
  AjouterTexte(Fcrypt, "FondCrypto", "", 175, 70, 450, 450);
  ChangerCouleurFond(Fcrypt, "FondCrypto", FL_BLACK);
  AjouterBouton(Fcrypt, "pred", "précédant", 30,600, 200,70);
  AfficheGrille(Fcrypt);
  FinFenetre(Fcrypt);
  montrerfenetre(Fcrypt);
  s := attendreBouton(Fcrypt);
end gaudigraph;
