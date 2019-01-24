with text_io, p_vue_text; use text_io, p_vue_text;
with p_combinaisons; use p_combinaisons;
with sequential_IO;
use p_combinaisons.p_cases_IO;
use p_combinaisons.p_int_io;

procedure gauditext is
  nbcases : T_nbcases;
  f : p_cases_IO.file_type;
  V : TV_Gaudi(1..16);
  fsol, fcont : text_io.file_type;
  reponse : string(1..6);
begin -- Procedure
  open(f, in_file, "CarreGaudi");
  CreeVectGaudi(f, V);
  close(f);
  -----------TriVectGaudi---------
  --Vecteur Actualiser
  TriVectGaudi(V);
  -----------CreeFicsol-----------
  open(fsol, in_file, "fsol.txt");
  CreeFicsol(V, fsol);
  open(fcont, in_file, "fcont.txt");

  -------------------------------
  while true loop
    loop
      begin
        put("Choisissez un nombre de cases : "); get(nbcases);
        exit;
      exception
        when Constraint_Error =>
          put_line("Le nombre de cases doit être entre 3 et 7");
      end;
    end loop;
    afficheGrille(V);
    put_line("Voulez vous afficher toutes les combinaisons ou seulement les contigus?");
    put("(entrer combin ou contig : )"); get(reponse);
    if reponse = "combin" then
      Affichage(fsol,nbcases);
      skip_line;
    elsif reponse = "contig" then
      Affichage(fcont,nbcases);
      skip_line;
    end if;
  end loop;
end gauditext;
