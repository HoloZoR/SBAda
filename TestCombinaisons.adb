with p_combinaisons; use p_combinaisons;
with text_io, p_esiut; use text_io, p_esiut;
with sequential_IO;
use p_combinaisons.p_cases_IO;
use p_combinaisons.p_int_io;

procedure Testcombinaisons is
  f : p_cases_IO.file_type;
  V : TV_Gaudi(1..16);
  fsol : text_io.file_type;
begin -- TestCombinaisons
  open(f, in_file, "CarreGaudi");
  CreeVectGaudi(f, V);
  close(f);
  -------------------------------
  --Vecteur Actualiser
  TriVectGaudi(V);
  for i in V'Range loop
    ecrire_ligne(V(i).nom);
    ecrire_ligne(V(i).valeur);
  end loop;
  -------------------------------
  open(fsol, in_file, "fsol.txt");
  CreeFicsol(V, fsol);
  reset(fsol, in_file);
  ecrire_ligne(nbCombi(fsol, 4));
  reset(fsol, in_file);
  ecrire(combi(fsol, 3, 10));
  close(fsol);
  -------------------------------

end TestCombinaisons;
