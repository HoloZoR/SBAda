With text_io; use text_io;
package body p_vue_text is
  procedure afficheEtoile(nb : in integer) is
  -- {} => {Affiche *-----* de nb occurence}
  begin
    put(' ');
    for j in 1..nb loop
      put("*-----");
    end loop;
    put('*');
    new_line;
  end afficheEtoile;

  procedure afficheBarre(nb : in integer) is
  -- {} => {Affiche |     | de nb occurence}
  begin
    put(' ');
    for j in 1..nb loop
      put("|     ");
    end loop;
    put('|');
    new_line;
  end afficheBarre;

  procedure afficheGrille(V : in TV_Gaudi) is
  --{V trié sur nom} => {Affiche la grille d'origine}
    k : integer;
  begin
    put(' ');
    for i in character range 'A'..'D' loop
      put("   "&i&"  ");
    end loop;
    new_line;
    for j in 1..4 loop
      afficheEtoile(4);
      afficheBarre(4);
      put(j,1);
      k := j;
      while k <= V'last loop
        put("|  ");
        if V(k).valeur < 10 then
          put(V(k).valeur,1);
          put("  ");
        else
          put(V(k).valeur,2);
          put(" ");
        end if;
        k := k+4;
      end loop;
      put('|');
      new_line;
      afficheBarre(4);
    end loop;
    afficheEtoile(4);
  end afficheGrille;



end p_vue_text;
