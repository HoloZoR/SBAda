with p_esiut; use p_esiut;

package body p_combinaisons is
---------------------------procedure--------------------------------------------
---------------------------CreeVectGaudi----------------------------------------
procedure CreeVectGaudi(f : in out p_cases_IO.file_type; V : out TV_Gaudi) is
-- {f ouvert, V de taille suffisante} => {le contenu de f a �t� copi� dans V}
    i : integer;
begin
  i := V'first; reset(f, IN_FILE);
  while not end_of_file(f) loop
    read(f, V(i));
    i := i + 1;
  end loop;
end CreeVectGaudi;
-------------------------TriVectGaudi-------------------------------------------
procedure TriVectGaudi(V : in out TV_Gaudi) is
-- {} => {V est tri� par nom de case}
--function-----
  function positSup(W : in TV_Gaudi; val : in TR_case ) return integer is
    -- {W trié, val < W(W'last)} => {résultat = indice du 1er élément de W > val}
    j : integer := W'first;
  begin
    while W(j).nom <= val.nom loop
      j := j+1;
    end loop;
    return j;
  end positSup;
  --Variable-----
  i, k : integer;
  sauv : TR_Case;
begin
    i := V'first+1;
    while i < V'last+1 loop
      if V(i).nom < V(i-1).nom then
        k := positSup(V(V'first..i-1), V(i));
        sauv := V(i);
        V(k+1..i) := V(k..i-1);
        V(k) := sauv;
      end if;
      i := i + 1;
    end loop;
end TriVectGaudi;
----------------------------CreeFicsolcont--------------------------------------
procedure CreeFicsol(V : in TV_Gaudi; fsol : in out text_io.file_type) is
-- {f ouvert en �criture, V Tri� par nom de case}
--	=> 	{fsol contient toutes les combinaisons gagnantes et est structuré selon le format défini (cf. sujet)}
  fsol3, fsol4, fsol5, fsol6, fsol7 : text_io.file_type;
  nb_combi3,nb_combi4,nb_combi5,nb_combi6,nb_combi7 : integer := 0;
  somme : integer;
  val : string(1..15);
  lg : integer;
begin
  reset(fsol, out_file);
  create(fsol3, out_file, "fsol3.txt");
  create(fsol4, out_file, "fsol4.txt");
  create(fsol5, out_file, "fsol5.txt");
  create(fsol6, out_file, "fsol6.txt");
  create(fsol7, out_file, "fsol7.txt");
  for i1 in V'First..V'Last loop
    for i2 in i1+1..V'Last loop
-- 3 cases
      for i3 in i2+1..V'Last loop
        somme := V(i1).valeur+V(i2).valeur+V(i3).valeur;
        if somme = 33 then
          put(fsol3,V(i1).nom);
          put(fsol3,V(i2).nom);
          put(fsol3,V(i3).nom);
          new_line(fsol3);
          nb_combi3 := nb_combi3 +1;
        elsif somme < 33 then
-- 4 cases
          for i4 in i3+1..V'Last loop
            somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur;
            if somme = 33 then
              put(fsol4,V(i1).nom);
              put(fsol4,V(i2).nom);
              put(fsol4,V(i3).nom);
              put(fsol4,V(i4).nom);
              new_line(fsol4);
              nb_combi4 := nb_combi4 +1;
            elsif somme < 33 then
-- 5 cases
              for i5 in i4+1..V'Last loop
                somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur+V(i5).valeur;
                if somme = 33 then
                  put(fsol5,V(i1).nom);
                  put(fsol5,V(i2).nom);
                  put(fsol5,V(i3).nom);
                  put(fsol5,V(i4).nom);
                  put(fsol5,V(i5).nom);
                  new_line(fsol5);
                  nb_combi5 := nb_combi5 +1;
                elsif somme < 33 then
-- 6 cases
                  for i6 in i5+1..V'Last loop
                    somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur+V(i5).valeur+V(i6).valeur;
                    if somme = 33 then
                      put(fsol6,V(i1).nom);
                      put(fsol6,V(i2).nom);
                      put(fsol6,V(i3).nom);
                      put(fsol6,V(i4).nom);
                      put(fsol6,V(i5).nom);
                      put(fsol6,V(i6).nom);
                      new_line(fsol6);
                      nb_combi6 := nb_combi6 +1;
                    elsif somme < 33 then
-- 7 cases
                      for i7 in i6+1..V'Last loop
                        somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur+V(i5).valeur+V(i6).valeur+V(i7).valeur;
                        if somme = 33 then
                          put(fsol7,V(i1).nom);
                          put(fsol7,V(i2).nom);
                          put(fsol7,V(i3).nom);
                          put(fsol7,V(i4).nom);
                          put(fsol7,V(i5).nom);
                          put(fsol7,V(i6).nom);
                          put(fsol7,V(i7).nom);
                          new_line(fsol7);
                          nb_combi7 := nb_combi7 +1;

                        end if;
                      end loop;

                    end if;
                  end loop;

                end if;
              end loop;

            end if;
          end loop;

        end if;
      end loop;

    end loop;
  end loop;

  put(fsol,3,1); put(fsol,' '); put(fsol,nb_combi3,1); new_line(fsol);
  reset(fsol3, in_file);
  while not end_of_file(fsol3) loop
    get_line(fsol3,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,4,1); put(fsol,' '); put(fsol,nb_combi4,1); new_line(fsol);
  reset(fsol4, in_file);
  while not end_of_file(fsol4) loop
    get_line(fsol4,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,5,1); put(fsol,' '); put(fsol,nb_combi5,1); new_line(fsol);
  reset(fsol5, in_file);
  while not end_of_file(fsol5) loop
    get_line(fsol5,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,6,1); put(fsol,' '); put(fsol,nb_combi6,1); new_line(fsol);
  reset(fsol6, in_file);
  while not end_of_file(fsol6) loop
    get_line(fsol6,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,7,1); put(fsol,' '); put(fsol,nb_combi7,1); new_line(fsol);
  reset(fsol7, in_file);
  while not end_of_file(fsol7) loop
    get_line(fsol7,val,lg);
    put_line(fsol,val(1..lg));
  end loop;

  close(fsol3);
  close(fsol4);
  close(fsol5);
  close(fsol6);
  close(fsol7);

end CreeFicsol;


---------------------------function---------------------------------------------
---------------------------nbCombi----------------------------------------------
function nbCombi(fsol : in text_io.file_type; nbcases : in T_nbcases) return natural is
-- {fsol ouvert, f- = <>} => {r�sultat = nombre de combinaisons en nbcases dans fsol}
  n : integer;
  esp : character := ' ';
begin
  n := 0;
  --------------------------
  if nbcases /= 3 then
    for i in 3..nbcases loop
      skip_page(fsol); -- saute les pages jusqu'à la page voulu
    end loop;
  end if;
  --------------------------
  get(fsol, n);
  get(fsol, esp);
  get(fsol, n);
  --------------------------
  return n;
  --------------------------
end nbCombi;


------------------------------Combi---------------------------------------------
function Combi(fsol : in text_io.file_type; nbcases : in T_nbcases; numsol : in positive) return string is
-- {fsol ouvert, f- = <>}
-- => {r�sultat = cha�ne repr�sentant la solution numsol lue dans fsol pour une combinaison de nbcases}
  nbcombi : string(1..14);
  nb : natural;
begin
  nbCombi := "0 0           ";
  nb := 3;
  --------------------------
  if nbcases /= 3 then
    for i in 3..nbcases loop
      skip_page(fsol); -- saute les pages jusqu'à la page voulu
    end loop;
  end if;
  --------------------------
  skip_line(fsol); -- saute la ligne avec solutions et cases
  --------------------------
  for j in 1..numsol loop
    get_line(fsol, nbcombi,nb);
  end loop;
  --------------------------
  return nbCombi(nbCombi'First..nb);
  ---------fin--------------
end Combi;

------------------------------Affichage---------------------------------------------
procedure Affichage(fsol : in text_io.file_type; nbcases : in T_nbcases) is
  -- {fsol ouvert, f- = <>} => {Affiche toutes les combinaisons pour un nombre de case donnés}
  nbCb : natural;
  cb : string(1..nbcases*2);
begin
  nbCb := nbCombi(fsol,nbcases);

  Ecrire("* "); Ecrire(nbCb);
  Ecrire(" solutions en "); Ecrire(nbcases); Ecrire_Ligne(" cases");
  Ecrire_Ligne("-------------------------");

  for i in 1..nbcb loop
    cb := Combi(fsol,nbcases,i);
    Ecrire("solution "); Ecrire(i); Ecrire('/'); Ecrire(nbcb); Ecrire(": ");
    for j in 1..nbcases-1 loop
      Ecrire(cb(j..j+1));
      if j < nbcases-1 then
        Ecrire(',');
      else
        A_la_ligne;
      end if;
    end loop;
  end loop;


end Affichage;


	function contigue2cases(C1, C2 : in string) return boolean is
	--{sol repr�sente une solution} => {r�sultat = vrai si 2 cases sont contigues}
    col1, col2 : character;
    lig1, lig2 : T_Lig;
  begin
    col1 := C1(C1'First);
    lig1 := T_Lig'Value('0' & C1(C1'First + 1));
    col2 := C2(C2'First);
    lig2 := T_Lig'Value('0' & C2(C2'First + 1));
    return((col1 = col2 and (lig1 = lig2 +1 or lig1 = lig2 -1))
        or (lig1 = lig2 and (col1 = T_Col'succ(col2) or col1 = T_Col'pred(col2)))
        or ((lig1 = lig2 +1 or lig1 = lig2 -1) and (col1 = T_Col'succ(col2) or col1 = T_Col'pred(col2))));

  end contigue2cases;
-- function est_contigue(sol : in string) return boolean is
--   --{sol repr�sente une solution} => {r�sultat = vrai si sol est une solution contig�e}
--   ---- record de Case ----
--   type TR_case is record
--     cases : string(1..2);
--     contig : boolean;
--   end record;
--   ----- vecteur de Case -----
--   type TV_Case is array (positive range <>) of TR_Case;
--   ----- declatation de mes variables
--   V : TV_Case(1..(sol'length/2)); -- vecteur de la taille de sol/2
--   i,j : positive := V'first;
--   indVal : positive := V'first;
--   contigue : boolean := false;
-- begin
--   -- Initialisation de V --
--   while i < V'last + 1 loop
--     V(i) := (sol(j)&sol(j+1), true);
--     i := i + 1;
--     j := j + 2;
--   end loop; -- Vecteur initiliser par les cases de sol et contigue = true
--     ------------------------------------------------------------------------
--     -- initialiser les valeurs contigue --
--     while not contigue loop
--       i := V'first + 1;
--       contigue := true;
--       while i < V'last + 1 loop
--         if not contigue2cases(V(indVal).cases,V(i).cases) then
--           contigue := false;
--           v(i).contig := false; -- mets les valeurs contigue avec V'first à false
--         end if;
--         i := i + 1;
--       end loop;
--     if not contigue then
--       -------------------------------------------------------------------------
--       -- indice de la première valeurs contigue --
--       i := V'first + 1;
--       while i < V'last + 1 and then v(i).contig = false loop
--         i := i + 1;
--       end loop;
--       indVal := i;
--       -------------------------------------------------------------------------
--     end if;
--     end loop;
--     return contigue;
-- end est_contigue;

-- procedure CreeFicsolcont(fsol, fcont : in out text_io.file_type)  is
-- -- {fsol ouvert} => {fcont contient les combinaisons contig�es de fsol et est structur� de la m�me fa�on}
--   val : string(1..15);
--   lg : integer;
-- begin
--   reset(fsol, in_file);
--   reset(fcont, out_file);
--   while not end_of_file(fsol) loop
--     skip_line()
--     get_line(fsol,val,lg)
--   end loop;
-- end CreeFicsolcont;

----------------------------fin-------------------------------------------------
end p_combinaisons;
