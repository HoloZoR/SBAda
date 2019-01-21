package body p_combinaisons is


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


end p_combinaisons;
