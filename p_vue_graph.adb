with forms; use forms;
package body p_vue_graph is

  procedure FenetreAccueil(Facc : in out TR_Fenetre) is
  -- {} => {Creation de la fenetre d'accueil}
    x : integer := 150;
    y : integer := 345;
    C : integer := 90; -- Pour bouton carré
  begin -- FenetreAccueil
    Facc := DebutFenetre("Accueil", 800,700); -- x y et L h
      AjouterTexte(Facc, "TexteAccueil", "Bienvenue dans le jeux du cryptogramme !", 155, 75, 500, 50);
      ChangerTailleTexte(Facc, "TexteAccueil", FL_LARGE_SIZE);
      --------------------------Message--------------------------------
      AjouterTexte(Facc, "TexteInstuction", "Les instructions :", 220, 155, 320, 20);
      AjouterTexte(Facc, "TexteInstuction1", "Tout d'abord, Vous devez choisir un nombre de case.", 220, 185, 335, 20);
      AjouterTexte(Facc, "TexteInstuction2", "Ensuite, choisissez d'afficher toutes les solutions", 220, 215, 335, 20);
      AjouterTexte(Facc, "TexteInstuction3", "ou seulement celles etant contigues.", 220, 245, 320, 21);
      AjouterTexte(Facc, "TexteCommencer", "Appuyer sur le bouton Commencer !", 275, 650, 400, 50);
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
      --------------------Bouton Choix des solutions----------------------------
      AjouterBouton(Facc,"BoutonToutes"," Toutes",285, 500, 100, 50);
      AjouterBouton(Facc,"BoutonContigue"," Contigues",400, 500, 100, 50);

      -------------------- Bouton pour commmencer-------------------------------
      AjouterBouton(Facc,"BoutonCommencer","Commencer",340, 600, 100, 50);
    FinFenetre(Facc);
  end FenetreAccueil;
  procedure FenetreCryptogramme(Fcrypt : in out TR_Fenetre; V : in TV_Gaudi) is
  -- {} => {Creation de la fenetre du Cryptogramme}
  begin
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
      AjouterBouton(Fcrypt, "fin", "Quitter", 650,20,150,100);

    FinFenetre(Fcrypt);
  end FenetreCryptogramme;
  ------------------------------------------------------------------------------
  procedure choixdesCase(Facc : in out TR_Fenetre; attClick : in string; nbcases : in out integer; Btc : in out boolean; BtCommencer : in out boolean) is
  begin
    if (attClick(attClick'first..(attClick'last - 1)) = "Bouton") then
      for i in 3..7 loop
        changercouleurfond(Facc, "Bouton" & integer'image(i)(2), FL_COL1);
      end loop;
      changercouleurfond(Facc, attClick, FL_PALEGREEN);
      nbcases := integer'value('0'&attClick(attClick'Last));
    elsif attClick = "BoutonToutes" then
      changercouleurfond(Facc, "BoutonContigue", FL_COL1);
      changercouleurfond(Facc, attClick, FL_PALEGREEN);
      Btc := False;
    elsif attClick = "BoutonContigue" then
      changercouleurfond(Facc, "BoutonToutes", FL_COL1);
      changercouleurfond(Facc, attClick, FL_PALEGREEN);
      Btc := True;
    elsif attClick = "BoutonCommencer" then
      BtCommencer := true;
    end if;
  end choixdesCase;
  ------------------------------------------------------------------------------
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
