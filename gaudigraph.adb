with p_combinaisons; use p_combinaisons;
with p_vue_graph; use p_vue_graph;
with p_fenbase; use p_fenbase;
with forms; use forms;
with p_esiut; use p_esiut;

procedure gaudigraph is
  Facc,Fcrypt : TR_Fenetre;
  s : string(1..20);
  nbcases : integer;
  Btcontigue, BtCommencer : boolean;
begin -- gaudigraph
  -----------------Initialisation des fenêtres----------------------------------
  InitialiserFenetres;
  -- Fenêtre d'accueil
  FenetreAccueil(Facc);
  --Fenêtre cryptogramme
  FenetreCryptogramme(Fcrypt);
  ------------------------------------------------------------------------------
  montrerfenetre(facc);
  nbcases := 3; Btcontigue := false; BtCommencer := False;
  while not BtCommencer loop
    choixdesCase(Facc,attendreBouton(facc),nbcases, Btcontigue, BtCommencer);
    ecrire_ligne(nbcases);
    ecrire_ligne(Btcontigue);
    ecrire_ligne(BtCommencer);
  end loop;
  montrerfenetre(Fcrypt);
  s := attendreBouton(FCrypt);
end gaudigraph;
