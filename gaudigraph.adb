with p_combinaisons; use p_combinaisons;
with p_vue_graph; use p_vue_graph;
with p_fenbase; use p_fenbase;
with forms; use forms;
with text_io; use text_io;


procedure gaudigraph is
  Facc,Fcrypt : TR_Fenetre;
  -- s : string(1..20);
  num : integer := 1;
  nbcb : integer;
  sol : string(1..15);
  V : TV_Gaudi(1..16);
  continuer : boolean;
begin -- gaudigraph

  Gaudi(V);
  -----------------Initialisation des fenêtres----------------------------------
  InitialiserFenetres;
  -- Fenêtre d'accueil
  FenetreAccueil(Facc);
  --Fenêtre cryptogramme
  -- montrerfenetre(facc);
  -- s := attendreBouton(facc);

  ------------------------------------------------------------------------------
  Fcrypt := DebutFenetre("Cryptogramme de Subirachs",800,700);
    AjouterTexte(Fcrypt, "Titre","Cryptogramme de Subirachs", 200,20, 400, 30);
    AjouterTexte(Fcrypt, "FondCrypto", "", 175, 70, 450, 450);
    ChangerCouleurFond(Fcrypt, "FondCrypto", FL_BLACK);
    AfficheGrille(Fcrypt, V);
    AjouterBouton(Fcrypt, "pred", "Precedant", 50,550, 200,100);
    AjouterBouton(Fcrypt, "succ", "Suivant", 550,550, 200,100);
    AjouterTexte(Fcrypt, "numsol", "1", 370,560, 60, 80);
    ChangerTailleTexte(Fcrypt, "numsol", FL_LARGE_SIZE);
    ChangerStyleTexte(Fcrypt, "numsol", FL_FIXEDBOLD_STYLE);
    AjouterBouton(Fcrypt, "fin", "Retour a l'accueil", 20,20,150,100);
  FinFenetre(Fcrypt);
    montrerfenetre(Fcrypt);
    continuer := true;
    while continuer loop
      TrouveCombi(4, num, true, sol, nbcb);
      Solution(Fcrypt, num, nbcb, attendreBouton(Fcrypt),continuer);
      AfficheSolution(Fcrypt, sol, 4, V);
    end loop;

end gaudigraph;
