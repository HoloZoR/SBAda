with text_io, p_vue_text; use text_io, p_vue_text;
with p_esiut; use p_esiut;
with p_combinaisons; use p_combinaisons;
with sequential_IO;
use p_combinaisons.p_cases_IO;
use p_combinaisons.p_int_io;

procedure gauditext is
  nbcases : T_nbcases;
  f : p_cases_IO.file_type;
  V : TV_Gaudi(1..16);
  fsol : text_io.file_type;

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

  -------------------------------
  while true loop
    put("Choisissez un nombre de cases : "); get(nbcases);
    afficheGrille(V);
    Affichage(fsol,nbcases);
    skip_line;

  end loop;
end gauditext;
