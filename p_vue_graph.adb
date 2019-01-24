
package body p_vue_graph is

  procedure FenetreAccueil(Facc : in out TR_Fenetre) is
  -- {} => {Creation de la fenetre d'accueil}
    x : integer := 150;
    y : integer := 345;
    C : integer := 90; -- Pour bouton carré
  begin -- FenetreAccueil
    Facc := DebutFenetre("Accueil", 800,700); -- x y et L h
      AjouterTexte(Facc, "TexteAccueil", "Bonjour et Bienvenue dans notre programme !", 250, 75, 400, 50);
      AjouterTexte(Facc, "TexteCommencer", "Appuyer sur le bouton Commencer !", 270, 650, 400, 50);
      --------------------------------------------------------------------------
      AjouterTexte(Facc, "TexteInstuction", "Tout d'abord, Vous devez choisir un nombre de case. Ensuite, il vous faut choisir si vous voulez afficher toute les solutions", 270, 650, 320, 50);
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
      AjouterBouton(Facc,"BoutonToutes"," Toutes",285, 500, 100, 50);
      AjouterBouton(Facc,"BoutonContigue"," Contigues",400, 500, 100, 50);

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


  procedure Solution(Fen : in out TR_Fenetre; num : out integer; nbcb : in integer; s : in string) is
  begin
    num := 1;
    loop
      if s = "pred" then
        if num = 1 then
          num := nbcb;
        else
          num := num-1;
        end if;
      elsif s = "succ" then
        if num = nbcb then
          num := 1;
        else
          num := num+1;
        end if;

      end if;
      ChangerTexte(Fen, "numsol", integer'image(num));

    end loop;

  end Solution;

  procedure AfficheSolution (Fen : in out TR_Fenetre; sol : in string) is
    i : integer := sol'first;
  begin
    while i <= sol'length loop
      ChangerCouleurFond(Fen, "Case"& sol(i..i+1), FL_DEEPPINK);
      i := i+2;
    end loop;

  end AfficheSolution;

end p_vue_graph;
