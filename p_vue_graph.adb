
package body p_vue_graph is

  procedure FenetreAccueil(Facc : in out TR_Fenetre; FondCouleur : in T_couleur) is
  -- {} => {Creation de la fenetre d'accueil}
    x : integer := 170;
    y : integer := 300;
    C : integer := 90; -- Pour bouton carré
  begin -- FenetreAccueil
    Facc := DebutFenetre("Accueil", 800,700); -- x y et L h
      AjouterTexte(Facc, "TexteAccueil", "Bonjour et Bienvenue dans notre programme !", 250, 75, 400, 50);
      AjouterTexte(Facc, "TexteInstuction", "Appuyer sur le bouton Commencer !", 270, 650, 400, 50);
      --------------------Bouton choix nb cases---------------------------------
      AjouterBouton(Facc,"Bouton3","3 cases",x, y, C, C);
        x := x + 100;
      AjouterBouton(Facc,"Bouton4","4 cases",x, y, C, C);
        x := x + 100;
      AjouterBouton(Facc,"Bouton5","5 cases",x, y, C, C);
        x := x + 100;
      AjouterBouton(Facc,"Bouton6","6 cases",x, y, C, C);
        x := x + 100;
      AjouterBouton(Facc,"Bouton7","7 cases",x, y, C, C);
      --------------------Ajout de Check box------------------------------------
      AjouterBouton(Facc,"BoutonToutes"," Toutes",290, 400, 100, 50);
      AjouterBouton(Facc,"BoutonContigue"," Contigues",420, 400, 100, 50);

      -------------------- Bouton pour commmencer-------------------------------
      AjouterBouton(Facc,"BoutonCommencer","Commencer",340, 600, 100, 50);

    FinFenetre(Facc);
  end FenetreAccueil;

  procedure AfficheGrille (Fen : in out TR_Fenetre) is
    f : p_cases_IO.file_type;
    V : TV_Gaudi(1..16);
  begin
    open(f, in_file, "CarreGaudi");
    CreeVectGaudi(f, V);
    close(f);
    for l in 1..4 loop
      for c in 1..4 loop
        AjouterBouton(Fen, "Case"& V((l-1)*4+c).nom, Integer'image(V((l-1)*4+c).valeur), 185 + 110*(l-1), 80 + 110*(c-1), 100, 100);
      end loop;
    end loop;
  end AfficheGrille;



end p_vue_graph;
