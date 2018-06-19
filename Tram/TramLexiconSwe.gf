--# -path=.:../Common:prelude:present

concrete TramLexiconSwe of TramLexicon = CatSwe ** 
    open Prelude, ParadigmsSwe, ParamX, GrammarSwe, 
         (Lex=LexiconSwe), (Irr=IrregSwe), (Res=CommonScand) in {

lin

-- Adjectives
short_A = Lex.short_A;

-- Adverbs
there      = mkAdv (variants{"h�r";"d�r"}); 
from_there = mkAdv (variants{"h�rifr�n";"d�rifr�n";["fr�n h�r"];["fr�n d�r"]});
to_there   = mkAdv (variants{"hit";"dit";["till h�r"];["till d�r"]});

-- Conjunctions
and_then_Conj = {s = ["och sedan"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regGenN "hj�lp" utrum;
route_N     = regGenN "rutt" utrum;
stop_N      = regGenN "h�llplats" utrum;
way_N       = regGenN "v�g" utrum;

-- Prepositions
from_Prep   = ss "fr�n";
to_Prep     = ss "till";

-- Verb-1
go_V        = regV "�ker";
help_V      = regV "hj�lper";

restart_VP  = UseV (partV (regV "starta") "om");

-- Verb-2
get_V2       = variants {Lex.have_V2; dirV2 (irregV "f�" "fick" "f�tt")};
go_from_V2   = dirV2 (partV (regV "�ker") "fr�n");
go_to_V2     = dirV2 (partV (regV "�ker") "till");
find_V2      = dirV2 (regV "hittar");
findout_V2   = dirV2 (Irr.finna_V);
take_V2      = dirV2 (ta_V);

the_shortest_route = 
    DetCN (DetSg (SgQuant DefArt) (OrdSuperl (regA "kort"))) (UseN (regN "v�g")) ;

oper 
ta_V  : V = mkV "ta" "tar" "ta" "tog" "tagit" "tagen";


}
