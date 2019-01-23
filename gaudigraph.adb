with p_combinaisons; use p_combinaisons;
with p_vue_graph; use p_vue_graph;
with p_fenbase; use p_fenbase;

procedure gaudigraph is
  Facc : TR_Fenetre;
begin -- gaudigraph
  -----------------Initialisation des fenêtres----------------------------------
  InitialiserFenetres;
  -- Fenêtre d'accueil
  Facc := DebutFenetres("FenetreAccueil", 1200,800);
    AjouterTexte(Facc, "TexteAccueil", "Bonjour, Bienvenue dans notre programme \n
                                        Appuyer sur le bouton Commencer !", 800, 400, 400, 400)
    AjouterBouton(Facc,"BoutonCommencer","Commencer",100,   50,  70);
  FinFenetre(Facc);
  -- Fenêtre cryptogramme

  ------------------------------------------------------------------------------
end gaudigraph;
