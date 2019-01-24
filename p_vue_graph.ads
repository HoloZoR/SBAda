with p_combinaisons; use p_combinaisons;
with sequential_IO;
use p_combinaisons.p_cases_IO;
with p_fenbase; use p_fenbase;

package p_vue_graph is
  procedure AfficheGrille (Fen : in out TR_Fenetre);
  
  procedure FenetreAccueil(Facc : in out TR_Fenetre);
  -- {} => {Creation de la fenetre d'accueil}
end p_vue_graph;
