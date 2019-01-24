with p_combinaisons; use p_combinaisons;
with sequential_IO;
use p_combinaisons.p_cases_IO;
with p_fenbase; use p_fenbase;
with forms; use forms;

package p_vue_graph is
  procedure AfficheGrille (Fen : in out TR_Fenetre);

  procedure FenetreAccueil(Facc : in out TR_Fenetre);
  -- {} => {Creation de la fenetre d'accueil}

  procedure Solution(Fen : in out TR_Fenetre; num : out integer; nbcb : in integer;s : in string);

  procedure AfficheSolution (Fen : in out TR_Fenetre; sol : in string);


end p_vue_graph;
