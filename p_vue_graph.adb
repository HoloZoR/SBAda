
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

  procedure Gaudi (V : out TV_Gaudi) is
  --{} => {creation vecteur TV_Gaudi et fichiers fsol et fcont}
    f : p_cases_IO.file_type;
    fsol, fcont : text_io.file_type;
  begin
    open(f, in_file, "CarreGaudi");
    CreeVectGaudi(f, V);
    close(f);
    create(fsol, out_file, "fsol.txt");
    CreeFicsol(V,fsol);
    create(fcont, out_file, "fcont.txt");
    CreeFicsolcont(fsol, fcont);
    close(fsol);
    close(fcont);
  end Gaudi;

  procedure AfficheGrille (Fen : in out TR_Fenetre; V : in TV_Gaudi) is
  begin
    for l in 1..4 loop
      for c in 1..4 loop
        AjouterBouton(Fen, "Case"& V((l-1)*4+c).nom, Integer'image(V((l-1)*4+c).valeur), 185 + 110*(l-1), 80 + 110*(c-1), 100, 100);
      end loop;
    end loop;
  end AfficheGrille;

  procedure TrouveCombi(nbcases : in integer; num : in integer; contigue : in boolean; sol : out string; nbcb : out integer) is
    --{}=> {resultat : chaine de caractere de la combinaison}
    f : text_io.file_type;
    val : string(1..15);
    lg : integer;
  begin
    if contigue then
      open(f, in_file, "fcont.txt");
    else
      open(f, in_file, "fsol.txt");
    end if;
    get_line(f, val, lg);



    ------------avance jusqu'au nombre de cases correspondant-------------------
    while val(1) /= integer'image(nbcases)(2) and not end_of_file(f) loop
    --(integer'image(nbcases)&' ')
      get_line(f, val, lg);
    end loop;
    nbcb := integer'value(val(3..lg));
    for i in 1..num loop
      get_line(f,val,lg);
    end loop;
    sol(sol'first..sol'last) := (others => ' ');
    sol(1..lg) := val(1..lg);
    close(f);
  end TrouveCombi;

  procedure Solution(Fen : in out TR_Fenetre; num : in out integer; nbcb : in integer; s : in string; continuer : out boolean ) is
  --{} => {}
  begin
    continuer := true;
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
      elsif s = "fin" then
        continuer := false;

      end if;
      ChangerTexte(Fen, "numsol", integer'image(num));

    -- end loop;

  end Solution;


  procedure AfficheSolution (Fen : in out TR_Fenetre; sol : in string; nbcases : in integer; V : in TV_Gaudi) is
    i : integer := sol'first;
  begin
    for l in 1..4 loop
      for c in 1..4 loop
        ChangerCouleurFond(Fen, "Case"& V((l-1)*4+c).nom, FL_COL1);
      end loop;
    end loop;
    while i <= nbcases*2 loop
      put(integer'image(i));
      ChangerCouleurFond(Fen, "Case"& sol(i..i+1), FL_DEEPPINK);
      i := i+2;
    end loop;

  end AfficheSolution;

end p_vue_graph;
