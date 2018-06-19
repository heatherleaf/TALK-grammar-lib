--# -path=.:../Common:prelude:present

concrete TramLexiconSwe of TramLexicon = CatSwe ** 
    open Prelude, ParadigmsSwe, ParamX, GrammarSwe, 
         (Lex=LexiconSwe), (Irr=IrregSwe), (Res=CommonScand) in {

lin

-- Adjectives
short_A = Lex.short_A;

-- Adverbs
there      = mkAdv (variants{"här";"där"}); 
from_there = mkAdv (variants{"härifrån";"därifrån";["från här"];["från där"]});
to_there   = mkAdv (variants{"hit";"dit";["till här"];["till där"]});

-- Conjunctions
and_then_Conj = {s = ["och sedan"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regGenN "hjälp" utrum;
route_N     = regGenN "rutt" utrum;
stop_N      = regGenN "hållplats" utrum;
way_N       = regGenN "väg" utrum;

-- Prepositions
from_Prep   = ss "från";
to_Prep     = ss "till";

-- Verb-1
go_V        = regV "åker";
help_V      = regV "hjälper";

restart_VP  = UseV (partV (regV "starta") "om");

-- Verb-2
get_V2       = variants {Lex.have_V2; dirV2 (irregV "få" "fick" "fått")};
go_from_V2   = dirV2 (partV (regV "åker") "från");
go_to_V2     = dirV2 (partV (regV "åker") "till");
find_V2      = dirV2 (regV "hittar");
findout_V2   = dirV2 (Irr.finna_V);
take_V2      = dirV2 (ta_V);

the_shortest_route = 
    DetCN (DetSg (SgQuant DefArt) (OrdSuperl (regA "kort"))) (UseN (regN "väg")) ;

oper 
ta_V  : V = mkV "ta" "tar" "ta" "tog" "tagit" "tagen";


}
