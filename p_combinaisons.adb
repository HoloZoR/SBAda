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
  nb_case : integer;
  i1,i2,i3,i4,i5,i6,i7 : integer;
  nb_combi3,nb_combi4,nb_combi5,nb_combi6,nb_combi7 : integer;
  somme : integer;
  val : string 1..14;
  lg : integer;
begin
  reset(fsol, out_file);
  create(fsol3, out_file, "fsol3.txt");
  create(fsol5, out_file, "fsol5.txt");
  create(fsol6, out_file, "fsol6.txt");
  create(fsol7, out_file, "fsol7.txt");
  for i1 in V'First..V'Last loop
    for i2 in i1+1..V'Last loop
-- 3 cases
      for i3 in i2+1..V'Last loop
        somme := V(i1).valeur+V(i2).valeur+V(i3).valeur
        if somme = 33 then
          put(fsol3,i1);
          put(fsol3,i2);
          put(fsol3,i3);
          nb_combi3 := nb_combi3 +1;
        elsif somme < 33 then
-- 4 cases
          for i4 in i3+1..V'Last loop
            somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur
            if somme = 33 then
              put(fsol4,V(i1).nom);
              put(fsol4,V(i2).nom);
              put(fsol4,V(i3).nom);
              put(fsol4,V(i4).nom);
              nb_combi4 := nb_combi4 +1;
            elsif somme < 33 then
-- 5 cases
              for i5 in i4+1..V'Last loop
                somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur+V(i5).valeur
                if somme = 33 then
                  put(fsol5,V(i1).nom);
                  put(fsol5,V(i2).nom);
                  put(fsol5,V(i3).nom);
                  put(fsol5,V(i4).nom);
                  put(fsol5,V(i5).nom);
                  nb_combi5 := nb_combi5 +1;
                elsif somme < 33 then
-- 6 cases
                  for i6 in i5+1..V'Last loop
                    somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur+V(i5).valeur+V(i6).valeur
                    if somme = 33 then
                      put(fsol6,V(i1).nom);
                      put(fsol6,V(i2).nom);
                      put(fsol6,V(i3).nom);
                      put(fsol6,V(i4).nom);
                      put(fsol6,V(i5).nom);
                      put(fsol6,V(i6).nom);
                      nb_combi6 := nb_combi6 +1;
                    elsif somme < 33 then
-- 7 cases
                      for i7 in i6+1..V'Last loop
                        somme := V(i1).valeur+V(i2).valeur+V(i3).valeur+V(i4).valeur+V(i5).valeur+V(i6).valeur+V(i7).valeur
                        if somme = 33 then
                          put(fsol7,V(i1).nom);
                          put(fsol7,V(i2).nom);
                          put(fsol7,V(i3).nom);
                          put(fsol7,V(i4).nom);
                          put(fsol7,V(i5).nom);
                          put(fsol7,V(i6).nom);
                          put(fsol7,V(i7).nom);

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

  put(fsol,3); put(fsol,' '); put(fsol,nb_combi3); new_line(fsol);
  reset(fsol3, in_file);
  while not end_of_file(fsol3) loop
    get_line(fsol3,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,4); put(fsol,' '); put(fsol,nb_combi4); new_line(fsol);
  reset(fsol4, in_file);
  while not end_of_file(fsol4) loop
    get_line(fsol4,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,5); put(fsol,' '); put(fsol,nb_combi5); new_line(fsol);
  reset(fsol5, in_file);
  while not end_of_file(fsol5) loop
    get_line(fsol5,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,6); put(fsol,' '); put(fsol,nb_combi6); new_line(fsol);
  reset(fsol6, in_file);
  while not end_of_file(fsol6) loop
    get_line(fsol6,val,lg);
    put_line(fsol,val(1..lg));
  end loop;
  new_page(fsol);

  put(fsol,7); put(fsol,' '); put(fsol,nb_combi7); new_line(fsol);
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
  nbcombi : string(1..3);
  nb : natural;
begin
  nbCombi := "0 0";
  nb := 3;
  --------------------------
  if nbcases = 3 then
    get_line(f, nbcombi,nb);
  else -- nbcases /= 3
    for i in 3..nbcases loop
      skip_page(fsol); -- saute les pages jusqu'à la page voulu
    end loop;
  end if;
  --------------------------
  get_line(f, nbcombi,nb);
  --------------------------
  return integer'value(nbCombi(3..nb));
  --------------------------
  exception
    when END_ERROR => return integer'value(nbCombi(3..nb)); -- nbcases > 7
end nbCombi;
------------------------------Combi---------------------------------------------
function Combi(fsol : in text_io.file_type; nbcases : in T_nbcases; numsol : in positive) return string is
-- {fsol ouvert, f- = <>}
-- => {r�sultat = cha�ne repr�sentant la solution numsol lue dans fsol pour une combinaison de nbcases}
  nbcombi : string(1..14);
  nb : natural;
begin
  nbCombi := "0 0";
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
    get_line(f, nbcombi,nb);
  end loop;
  --------------------------
  return nbCombi(nbCombi'First..nb);
  ---------fin--------------
end Combi;
------------------------------nbCombi-------------------------------------------
function est_contigue(sol : in string) return boolean is
  --{sol repr�sente une solution} => {r�sultat = vrai si sol est une solution contig�e}
begin

end est_contigue;
----------------------------fin-------------------------------------------------
end p_combinaisons;
