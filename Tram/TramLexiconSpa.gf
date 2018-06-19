--# -path=.:../Common:prelude:present

concrete TramLexiconSpa of TramLexicon = CatSpa ** 
    open Prelude, ParadigmsSpa, ParamX, (Lex=LexiconSpa), (Irr=IrregSpa),
         (C=ConstructX),
         GrammarSpa, BeschSpa in {

lin

-- Adjectives
short_A = regA "corto" ;

-- Adverbs
there      = variants{here_Adv; there_Adv}; 
from_there = C.mkAdv ("desde" ++ variants{"acá";"allá"});
-- variants{here7from_Adv; there7from_Adv};
to_there   = variants{here7to_Adv; there7to_Adv};

-- Conjunctions
and_then_Conj = {s = ["y después"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regN "ayuda";
route_N     = regN "itinerario";
stop_N      = regN "parada";
way_N       = regN "carretera";

-- Prepositions
from_Prep   = mkPrep "desde" ;
to_Prep     = dative ;

-- Verb-1
go_V        = Lex.go_V;
help_V      = regV "ayudar";

restart_VP  = AdvVP (UseV (regV "empezar")) (mkAdv ["de nuevo"]) ;

-- Verb-2
get_V2       = dirV2 Irr.pedir_V;
go_from_V2   = mkV2 Lex.go_V (mkPrep "desde") ;
go_to_V2     = mkV2 Lex.go_V dative;
find_V2      = Lex.find_V2;
findout_V2   = dirV2 (regV "descubrir"); ----
take_V2      = dirV2 (regV "tomar") ;

---awful
the_shortest_route = 
  DetCN (DetSg (SgQuant DefArt) NoOrd) (AdjCN (AdAP {s = "más" ; lock_AdA = <>} (PositA (regA "corto"))) (UseN (regN "itinerario"))) ;


}
