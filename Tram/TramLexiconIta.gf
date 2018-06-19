--# -path=.:../Common:prelude:present

concrete TramLexiconIta of TramLexicon = CatIta ** 
    open Prelude, ParadigmsIta, ParamX, (Lex=LexiconIta), 
         (C=ConstructX), GrammarIta, BeschIta in {

lin

-- Adjectives
short_A = regA "corto";

-- Adverbs
there      = variants{here_Adv; there_Adv}; 
from_there = variants{here7from_Adv; C.mkAdv ["da lì"]};
-- variants{here7from_Adv; there7from_Adv};
to_there   = variants{here7to_Adv; there7to_Adv};

-- Conjunctions
and_then_Conj = {s = ["e poi"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regN "aiuto";
route_N     = regN "itinerario";
stop_N      = regN "fermata";
way_N       = regN "via";

-- Prepositions
from_Prep   = da_Prep ;
to_Prep     = dative ;

-- Verb-1
go_V        = Lex.go_V;
help_V      = regV "aiutare";

restart_VP  = UseV (regV "ricominciare") ;

-- Verb-2
get_V2       = dirV2 (regV "trovare"); --- ???
go_from_V2   = mkV2 Lex.go_V da_Prep ;
go_to_V2     = mkV2 Lex.go_V dative ;
find_V2      = Lex.find_V2;
findout_V2   = dirV2 (regV "trovare");
take_V2      = dirV2 (verboV (prendere_70 "prendere")) ;

---awful
the_shortest_route = 
  DetCN (DetSg (SgQuant DefArt) NoOrd) (AdjCN (AdAP {s = "più" ; lock_AdA = <>} (PositA (regA "corto"))) (UseN (regN "itinerario"))) ;

}
