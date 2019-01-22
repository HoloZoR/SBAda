with p_esiut, p_vue_text; use p_esiut, p_vue_text;
procedure gauditext is
  nbcases : T_nbcases;
begin -- Procedure
  while true loop
    ecrire_ligne("Choisissez un nombre de cases : "); lire(T_nbcases);
    afficheGrille();
  end loop;
end gauditext;
