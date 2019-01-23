package body p_vue_graph is

  procedure AfficheGrille (Fen : in out TR_Fenetre) is
    f : p_cases_IO.file_type;
    V : TV_Gaudi(1..16);
  begin
    open(f, in_file, "CarreGaudi");
    CreeVectGaudi(f, V);
    close(f);
    for l in 1..4 loop
      for c in 1..4 loop
        AjouterBouton(Fen, "Case"& V((l-1)*4+c).nom, Integer'image(V((l-1)*4+c).valeur), 185 + 110*(l-1), 80 + 110*(c-1), 100, 100);
      end loop;
    end loop;
  end AfficheGrille;

end p_vue_graph;
