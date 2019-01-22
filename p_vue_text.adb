With p_esiut; use p_esiut;
package body p_vue_text is
  procedure afficheEtoile(nb in integer) is
  -- {} => {Affiche *-----* de nb occurence}
  begin
    for j in 1..nb loop
      ecrire("*-----");
    end loop;
    ecrire("*");
  end afficheEtoile;
  procedure afficheBarre(nb in integer) is
  -- {} => {Affiche |     | de nb occurence}
  begin
    for j in 1..nb loop
      ecrire("|     ");
    end loop;
    ecrire("|");
  end afficheBarre;
  procedure afficheGrille(V : in TV_Gaudi) is
  --{V trié sur nom} => {Affiche la grille d'origine}
  begin
    for i in 'A'..'D' loop
      ecrire("   "&i&"   ");
    end loop;
    a_la_ligne;
    for j in 1..4 loop
      ecrire()
    end loop;
    a_la_ligne;
    afficheEtoile(4);
  end afficheGrille;











end p_vue_text;
