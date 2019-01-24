with p_combinaisons; use p_combinaisons;
with sequential_IO;
use p_combinaisons.p_cases_IO;
with p_fenbase; use p_fenbase;
with forms; use forms;
with text_io; use text_io;

package p_vue_graph is

  procedure Gaudi (V : out TV_Gaudi);
  --{} => {creation vecteur TV_Gaudi et fichiers fsol et fcont}

  procedure AfficheGrille (Fen : in out TR_Fenetre; V : in TV_Gaudi);

  procedure FenetreAccueil(Facc : in out TR_Fenetre);
  -- {} => {Creation de la fenetre d'accueil}

  procedure FenetreCryptogramme(Fcrypt : in out TR_Fenetre; V : in TV_Gaudi);
  -- {} => {Creation de la fenetre du Cryptogramme}

  procedure choixdesCase(Facc : in out TR_Fenetre; attClick : in string; nbcases : in out integer; Btc : in out boolean; BtCommencer : in out boolean);
  --{} => {Enregistre le dernier choix et case}

  procedure Solution(Fen : in out TR_Fenetre; num : in out integer; nbcb : in integer;s : in string; continuer : out boolean );

  procedure AfficheSolution (Fen : in out TR_Fenetre; sol : in string; nbcases : in integer; V : in TV_Gaudi);

  procedure TrouveCombi(nbcases : in integer; num : in integer; contigue : in boolean; sol : out string; nbcb : out integer);
    --{}=> {resultat : chaine de caractere de la combinaison}



end p_vue_graph;
