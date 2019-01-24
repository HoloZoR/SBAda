with sequential_IO;
with text_io; use text_io;


package p_combinaisons is

	---- TYPES pour les cases de la grille --------------------------------------------------------------------------
	subtype T_Col is character range 'A'..'D';
	subtype T_Lig is integer range 1..4;
	subtype T_nbcases is positive range 3..7;
	type TR_Case is record
		nom	:	string(1..2); -- nom de la case (ex : "A1")
		valeur	:	positive;  -- nombre port� par la case (ex : 14)
	end record;
	----------------déclarations de vecteur pour partie 3-------------------------
	----- vecteur de Case -----
	type TV_Case is array (positive range <>) of string(1..2);

	---- Instanciation de sequential_IO pour le fichier de description de la grille ---------------------------------
	package p_cases_io is new sequential_IO (TR_Case); use p_Cases_IO;

	---- Instanciations de integer_io pour manipuler des entiers dans des fichiers texte ----------------------------
	package p_int_io is new integer_io(integer); use p_int_io;


	---- Type pour le vecteur de "travail" --------------------------------------------------------------------------
	type TV_Gaudi is array (positive range <>) of TR_Case;

	---- Recherche et affichage des combinaisons --------------------------------------------------------------------

	procedure CreeVectGaudi(f : in out p_cases_IO.file_type; V : out TV_Gaudi);
	-- {f ouvert, V de taille suffisante} => {le contenu de f a �t� copi� dans V}

	procedure TriVectGaudi(V : in out TV_Gaudi);
	-- {} => {V est tri� par nom de case}

	procedure CreeFicsol(V : in TV_Gaudi; fsol : in out text_io.file_type);
	-- {f ouvert en �criture, V Tri� par nom de case}
	--	=> 	{fsol contient toutes les combinaisons gagnantes et est structuré selon le format défini (cf. sujet)}

	function nbCombi(fsol : in text_io.file_type; nbcases : in T_nbcases) return natural;
	-- {fsol ouvert, f- = <>} => {r�sultat = nombre de combinaisons en nbcases dans fsol}

	function Combi(fsol : in text_io.file_type; nbcases : in T_nbcases; numsol : in positive) return string;
	-- {fsol ouvert, f- = <>}
	-- => {r�sultat = cha�ne repr�sentant la solution numsol lue dans fsol pour une combinaison de nbcases}

	procedure Affichage(fsol : in out text_io.file_type; nbcases : in T_nbcases);
	-- {fsol ouvert} => {Affiche toutes les combinaisons pour un nombre de case donnés}

	procedure permut(a, b: in out string);
		-- {} => {les valeurs de a et b ont été échangées}

	function contigue2cases(C1, C2 : in string) return boolean;
	--{sol repr�sente une solution} => {r�sultat = vrai si 2 cases sont contigues}

	procedure triBullesSurLettre(V : in out TV_Case);
	-- {} => {V trié par ordre croissant sur le numero de case}

	procedure triBullesSurNombre(V : in out TV_Case);
	-- {} => {V trié par ordre croissant sur le numero de case}

	function SuccDeContigue(V : in TV_Case) return boolean;
	-- {V Trié} => {vrai si tout les élément sont contigue 1 à 1 entre eux}

	function est_contigue(sol : in string) return boolean;
		--{sol repr�sente une solution} => {r�sultat = vrai si sol est une solution contig�e}

	procedure CreeFicsolcont(fsol, fcont : in out text_io.file_type) ;
	-- {fsol ouvert} => {fcont contient les combinaisons contig�es de fsol et est structur� de la m�me fa�on}

end p_combinaisons;
