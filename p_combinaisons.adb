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
procedure CreeFicsolcont(fsol, fcont : in out text_io.file_type) is
-- {fsol ouvert} => {fcont contient les combinaisons contig�es de fsol et est structur� de la m�me fa�on}
begin

end CreeFicsolcont;

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
