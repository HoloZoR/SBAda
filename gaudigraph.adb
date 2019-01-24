with p_combinaisons; use p_combinaisons;
with p_vue_graph; use p_vue_graph;
with p_fenbase; use p_fenbase;
with forms; use forms;
with text_io; use text_io;
with p_esiut; use p_esiut;

procedure gaudigraph is
  Facc,Fcrypt : TR_Fenetre;
  -- s : string(1..20);
  num : integer := 1;
  nbcb : integer;
  sol : string(1..15);
  V : TV_Gaudi(1..16);
  continuer : boolean;
  s : string(1..20);
  nbcases : integer;
  Btcontigue, BtCommencer : boolean;
begin -- gaudigraph

  Gaudi(V);
  -----------------Initialisation des fenêtres----------------------------------
  InitialiserFenetres;
  -- Fenêtre d'accueil
  FenetreAccueil(Facc);
  --Fenêtre cryptogramme
  FenetreCryptogramme(Fcrypt, V);
  ------------------------------------------------------------------------------
  montrerfenetre(facc);
  nbcases := 3; Btcontigue := false; BtCommencer := False;
  changercouleurfond(Facc, "Bouton3", FL_PALEGREEN);
  changercouleurfond(Facc, "BoutonToutes", FL_PALEGREEN);
  while not BtCommencer loop
    choixdesCase(Facc,attendreBouton(facc),nbcases, Btcontigue, BtCommencer);
    ecrire_ligne(nbcases);
    ecrire_ligne(Btcontigue);
    ecrire_ligne(BtCommencer);
  end loop;
  cacherfenetre(Facc);
  montrerfenetre(Fcrypt);
  continuer := true;
  while continuer loop
    TrouveCombi(4, num, true, sol, nbcb);
    Solution(Fcrypt, num, nbcb, attendreBouton(Fcrypt),continuer);
    AfficheSolution(Fcrypt, sol, 4, V);
  end loop;
  cacherfenetre(Fcrypt);

end gaudigraph;
