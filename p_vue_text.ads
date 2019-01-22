with sequential_IO;
with text_io; use text_io;
with p_combinaisons; use p_combinaisons;
use p_combinaisons.p_cases_IO;
use p_combinaisons.p_int_io;
package p_vue_text is
  --------------------------------procedure-------------------------------------
  --------------------------------afficheEtoile---------------------------------
  procedure afficheEtoile(nb : in integer);
  -- {} => {Affiche *-----* de nb occurence}
  --------------------------------afficheBarre---------------------------------
  procedure afficheBarre(nb : in integer);
  -- {} => {Affiche |     | de nb occurence}
  --------------------------------afficheGrille---------------------------------
  procedure afficheGrille(V : in TV_Gaudi);
  --{V trié sur nom} => {Affiche la grille d'origine}











end p_vue_text;
