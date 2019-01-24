package body p_vue_graph is

  procedure FenetreAccueil(Facc : in out TR_Fenetre) is
  -- {} => {Creation de la fenetre d'accueil}
  begin -- FenetreAccueil
    Facc := DebutFenetre("Accueil", 1200,700); -- x y et L h
      AjouterTexte(Facc, "TexteAccueil", "Bonjour et bienvenue dans notre programme !", 500, 75, 400, 50);
      AjouterTexte(Facc, "TexteInstuction", "Appuyer sur le bouton Commencer !", 500, 600, 400, 50);

      AjouterBouton(Facc,"BoutonCommencer","Commencer",500, 300, 100, 50);
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


  procedure Solution(Fen : in out TR_Fenetre; num : out integer; nbcb : in integer) is
  begin
    AjouterBouton(Fen, "pred", "précédant", 50,550, 200,100);
    AjouterBouton(Fen, "succ", "suivant", 550,550, 200,100);
    num := 1;
    AjouterTexte(Fen, "numsol", integer'image(num), 400,500, 150, 150);
    loop
      if attendreBouton(Fen) = "pred" then
        if num = 1 then
          num := nbcb;
        else
          num := num-1;
        end if;
      elsif attendreBouton(Fen) = "succ" then
        if num = nbcb then
          num := 1;
        else
          num := num+1;
        end if;
        ChangerTexte(Fen, "numsol", integer'image(num));

      end if;

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
