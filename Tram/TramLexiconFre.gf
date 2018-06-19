--# -path=.:../Common:prelude:present

concrete TramLexiconFre of TramLexicon = CatFre ** 
    open Prelude, ParadigmsFre, ParamX, (Lex=LexiconFre), IrregFre, 
         GrammarFre in {

lin

-- Adjectives
short_A = regA "court";

-- Adverbs
there      = variants{here_Adv; there_Adv}; 
from_there = variants{here7from_Adv; there7from_Adv};
to_there   = variants{here7to_Adv; there7to_Adv};

-- Conjunctions
and_then_Conj = {s = ["et ensuite"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regN "aide";
route_N     = regN "voie";
stop_N      = regN "arrêt";
way_N       = regN "route";

-- Prepositions
from_Prep   = genitive ;
to_Prep     = dative ;

-- Verb-1
go_V        = Lex.go_V;
help_V      = regV "aider";

restart_VP  = UseV (regV "recommencer") ;

-- Verb-2
get_V2       = dirV2 (regV "trouver");
go_from_V2   = mkV2 Lex.go_V genitive;
go_to_V2     = mkV2 Lex.go_V dative;
find_V2      = Lex.find_V2;
findout_V2   = dirV2 (regV "trouver");
take_V2      = prendre_V2 ;

--- awful to get proper order
the_shortest_route = 
  DetCN (DetSg (SgQuant DefArt) NoOrd) (AdjCN (AdAP {s = ["le plus"] ; lock_AdA = <>} (PositA (regA "court"))) (UseN (regGenN "itinéraire" masculine))) ;
}
